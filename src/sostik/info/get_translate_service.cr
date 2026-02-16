module Sostik::Info
  class GetTranslateService

    def initialize(word : String)
      @word = word
    end

    def call
      response = get_translate
      HandleResponseService.new(response).call
    end

    private def get_translate
      uri = URI.parse(BASE_URL)
      uri.query = URI::Params.new({"word" => [@word]}).to_s
      HTTP::Client.get(uri)
    end
  end
end
