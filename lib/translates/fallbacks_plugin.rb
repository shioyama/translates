module Translates
  module FallbacksPlugin
    def read(locale)
      fallback_locales(locale).each do |locale|
        value = super(locale)
        return value if present?(value)
      end
      nil
    end

    def fallback_locales(locale)
      [locale, I18n.default_locale]
    end

    def present?(value)
      !value.nil? && (value != "")
    end
  end
end
