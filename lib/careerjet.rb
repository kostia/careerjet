require 'multi_json'
require 'rest_client'

require 'careerjet/locales'
require 'careerjet/version'

module Careerjet
  def self.search(locale, params)
    MultiJson.decode(RestClient::Resource.new(LOCALES[locale])['/devel/search.api'].get(params))
  end
end
