require 'nokogiri'

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

    template.xpath("#{body}#{request}#{applicant}").each do |node|
      node.add_child address(10, "X9 9LF")
      node.add_child tenant("Julia", "Audi", "1910-01-01")
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
            xml["soap"].company  data.conf.env["company"]
            xml["soap"].username data.conf.env["username"]
            xml["soap"].password data.conf.env["password"]
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
        xml["soap"].autosearch 1
        xml["soap"].autosearchmaximum 3
      end
    end
    purp.doc.root.children.to_xml
  end

  def self.address(number, postcode)
    ns = {"xmlns:soap" => "definition"}
    address = Nokogiri::XML::Builder.new do |xml|
      xml.root(ns) do
        xml["soap"].address do
          xml["soap"].buildingno number
          xml["soap"].postcode postcode
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
