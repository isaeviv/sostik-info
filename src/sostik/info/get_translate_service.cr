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
      HTTP::Client.get(uri, headers: build_headers)
    end

    private def build_headers
      headers = HTTP::Headers.new
      headers["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
      headers["Accept-Encoding"] = "gzip, deflate"
      headers["Accept-Language"] = "ru"
      headers["Connection"] = "keep-alive"
      headers["Priority"] = "u=0, i"
      headers["Referer"] = "http://sostik.info/"
      headers["Upgrade-Insecure-Requests"] = "1"
      headers["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15"
      headers
    end
  end
end
