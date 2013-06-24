require 'nokogiri'

class XMLmaker

  def self.person(data)
    builder = generate_header(data)
    template = Nokogiri::XML((fix_root_node(builder)), &:noblanks)

    body = '//soapenv:Envelope/soapenv:Body'

    template.xpath(body).each do |node|
      node.add_child search_node
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


end
