require 'multi_json'
require 'rest_client'

require 'careerjet/locales'
require 'careerjet/version'

module Careerjet
  class UnknownLocale < ArgumentError
  end

  class InvalidParam < ArgumentError
  end

  def self.search(locale, params = {})
    domain = LOCALES.fetch(locale) { raise UnknownLocale, "no domain for locale `#{locale}'" }
    params.each_key do |k|
      unless [:keywords, :location, :sort, :start_num, :pagesize, :page, :contracttype,
          :contractperiod].include? k
        raise InvalidParam, "Unknown param key `#{k}'"
      end
    end
    MultiJson.decode(RestClient::Resource.new(domain)['/devel/search.api'].get(params))
  end
end
