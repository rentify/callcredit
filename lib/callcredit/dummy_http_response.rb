class DummyHttpResponse
  def self.mock
    new.mock
  end

  def mock
    Savon::Response.new(self, dummy_globals, dummy_locals)
  end

  def body
    @body ||= File.read(CallCredit.configuration.dummy_xml_response_file)
  end

  def error?
    false
  end

  def dummy_locals
    { advanced_typecasting: true, response_parse: :nokogiri }
  end

  def dummy_globals
    { wsdl: File.join(ROOT_PATH, "data/SingleAccessPoint.development.wsdl") }
  end
end