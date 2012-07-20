require 'multi_json'
require 'rest_client'

require 'careerjet/locales'
require 'careerjet/version'

module Careerjet
  class UnknownLocale < ArgumentError
  end

  def self.search(locale, params)
    domain = LOCALES.fetch(locale) { raise UnknownLocale, "no domain for locale `#{locale}'" }
    MultiJson.decode(RestClient::Resource.new(domain)['/devel/search.api'].get(params))
  end
end
