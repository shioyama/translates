require "translates/version"

module Translates
  def translates(*attributes, backend:, plugins: [])
    backend_subclass = Class.new(backend)
    plugins.each { |plugin| backend_subclass.include plugin }

    attributes.each do |attribute|
      define_accessor(attribute)
      define_backend(attribute, backend_subclass)
    end
    backend_subclass.setup_model(self, attributes)
  end

  private

  def define_backend(attribute, backend_class)
    define_method "#{attribute}_backend" do
      @backends ||= {}
      @backends[attribute] ||= backend_class.new(self, attribute)
    end
  end

  def define_accessor(attribute)
    define_method(attribute) do
      send("#{attribute}_backend").read(I18n.locale)
    end

    define_method("#{attribute}=") do |value|
      send("#{attribute}_backend").write(I18n.locale, value)
    end
  end
end
