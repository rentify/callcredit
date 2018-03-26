require 'nokogiri'

module CallCredit
  class XMLmaker

    def self.person(data)
      builder = generate_header(data)
      template = Nokogiri::XML((fix_root_node(builder)), &:noblanks)

      body = '//soap:Envelope/soap:Body'
      request = '/ns:Search/ns:request'
      applicant = '/ns:Individuals'

      template.xpath(body).each do |node|
        node.add_child search_node
      end

      data.people.each do |person|
        template.xpath("#{body}#{request}#{applicant}").each do |node|
          node.add_child tenant(person, data.addresses)
        end
      end

      template.root.to_xml
    end

    private
      def self.fix_root_node(builder)
        builder.doc.root.node_name = "soap:Envelope"
        builder.doc.root.to_xml
      end

      def self.generate_header(data)
        ns = { "xmlns:ns" => "http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0",
               "xmlns:soap" => "http://www.w3.org/2003/05/soap-envelope",
             }

        doc = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["soap"].Header do
              xml.Security({ "xmlns" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" }) do |xml|
                xml.UsernameToken do
                  xml.Username "#{CallCredit.configuration.company}\\#{CallCredit.configuration.username}"
                  xml.Password CallCredit.configuration.password
                end
              end
            end
            xml["soap"].Body
          end
        end
      end

      def self.search_node
        ns = {"xmlns:ns" => "definition"}

        search = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["ns"].Search do
              xml["ns"].request do
                xml["ns"].Individuals
                xml["ns"].ProductsToCall do
                  xml["ns"].CallReport7({ "DataSets" => "255" }) do
                    xml["ns"].Score 1
                    xml["ns"].Purpose 'TV'
                  end
                end
              end
            end
          end
        end
        search.doc.root.children.to_xml
      end

      def self.address(xml, location)
        xml["ns"].Address do
          xml["ns"].Line1 location[:abodeno] if location[:abodeno].present?
          xml["ns"].Line1 location[:number] if location[:number]
          xml["ns"].Line1 location[:buildingname] if location[:buildingname]
          xml["ns"].Line10 location[:postcode]
          xml["ns"].CountryCode "GB"
        end
      end

      def self.tenant(person, addresses)
        ns = {"xmlns:ns" => "definition"}
        tenant = Nokogiri::XML::Builder.new do |xml|
          xml.root(ns) do
            xml["ns"].Individual do
              xml["ns"].DateOfBirth person[:dob]
              xml["ns"].Names do
                xml["ns"].Name do
                  xml["ns"].Title person[:title]
                  xml["ns"].GivenName person[:forename]
                  xml["ns"].FamilyName1 person[:surname]
                end
              end
              xml["ns"].Addresses do
                addresses_block(xml, addresses)
              end
              xml["ns"].ApplicationSettings do |xml|
                xml["ns"].HouseholdSearchEnabled 'false'
                xml["ns"].ThirdPartyOptOut 'true'
              end
            end
          end
        end
        tenant.doc.root.children.to_xml
      end

      def self.addresses_block(xml, addresses)
        addresses.each do |location|
          address(xml, location)
        end
      end
  end
end
