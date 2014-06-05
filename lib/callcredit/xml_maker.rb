require 'nokogiri'

module CallCredit
  class XMLmaker

    def self.person(data)
      builder = generate_header(data)
      template = Nokogiri::XML((fix_root_node(builder)), &:noblanks)

      body = '//soapenv:Envelope/soapenv:Body'
      request = '/soap:Search07a/soap:SearchDefinition/soap:creditrequest'
      applicant = '/soap:applicant'

      template.xpath(body).each do |node|
        node.add_child search_node
      end

      template.xpath("#{body}#{request}").each do |node|
        node.add_child purpose
      end

      data.addresses.each do |location|
        template.xpath("#{body}#{request}#{applicant}").each do |node|
          node.add_child address(location)
        end
      end

      data.people.each do |person|
        template.xpath("#{body}#{request}#{applicant}").each do |node|
          node.add_child tenant(person[:forename], person[:surname], person[:dob])
        end
      end

      template.root.to_xml
    end


    private
      def self.fix_root_node(builder)
        builder.doc.root.node_name = "soapenv:Envelope"
        builder.doc.root.to_xml
      end

      def self.generate_header(data)
        ns = { "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
          "xmlns:soap" => "urn:callcredit.co.uk/soap:callreport7" }

        doc = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["soapenv"].Header do
              xml["soap"].callcreditheaders do
                xml["soap"].company  CallCredit.configuration.company
                xml["soap"].username CallCredit.configuration.username
                xml["soap"].password CallCredit.configuration.password
              end
            end
            xml["soapenv"].Body
          end
        end
      end

      def self.search_node
        ns = {"xmlns:soap" => "definition"}

        search = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["soap"].Search07a do
              xml["soap"].SearchDefinition do
                xml["soap"].creditrequest({ "schemaversion" => "7.0", "datasets" => "255" }) do
                  xml["soap"].applicant
                end
              end
            end
          end
        end
        search.doc.root.children.to_xml
      end


      def self.purpose
        ns = {"xmlns:soap" => "definition"}
        purp = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["soap"].score 1
            xml["soap"].purpose "TV"
            # Auto searching will automatically search any undeclared addresses up to the number you set in <autosearchmaximum>.
            # Each extra address searched is charged.  The advantage is that it will find hidden CCJs and BAI’s, but the trade
            # off is obviously costs. Set autosearch to 1 if you want to use it.
            xml["soap"].autosearch 0
            # xml["soap"].autosearchmaximum 3
          end
        end
        purp.doc.root.children.to_xml
      end

      def self.address(location)
        ns = {"xmlns:soap" => "definition"}
        address = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["soap"].address do
              xml["soap"].buildingno location[:number] if location[:number]
              xml["soap"].buildingname location[:buildingname] if location[:buildingname]
              xml["soap"].buildingno location[:abodeno] if location[:abodeno].present? && !location[:number]
              xml["soap"].postcode location[:postcode]
            end
          end
        end
        address.doc.root.children.to_xml
      end


      def self.tenant(forename, surname, dob)
        ns = {"xmlns:soap" => "definition"}
        tenant = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["soap"].name do
              xml["soap"].forename forename
              xml["soap"].surname surname
            end
            xml["soap"].dob dob
            xml["soap"].hho 0
            xml["soap"].tpoptout 1
            xml["soap"].applicantdemographics do
              xml["soap"].employment
            end
          end
        end
        tenant.doc.root.children.to_xml
      end

  end
end
