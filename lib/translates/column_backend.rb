module Translates
  class ColumnBackend
    def initialize(model, attribute)
      @model, @attribute = model, attribute
    end

    def read(locale)
      @model.read_attribute(column(locale))
    end

    def write(locale, value)
      @model.write_attribute(column(locale), value)
    end

    def self.setup_model(*)
    end

    private

    def column(locale)
      "#{@attribute}_#{locale.to_s.downcase.gsub('-', '_')}"
    end
  end
end
