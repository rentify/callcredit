class Person
  def initialize(*param)
    if param.length == 1 && param.first.kind_of?(Hash)
      param.first.each { |k,v| instance_variable_set("@#{k}",v) }
    end
  end

  def method_missing(meth)
    if self.instance_variables.include? "@#{meth}".to_sym
      self.instance_variable_get "@#{meth}".to_sym
    end
  end
end
