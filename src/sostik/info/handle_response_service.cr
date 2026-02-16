module Sostik::Info
  class HandleResponseService
    @response : HTTP::Client::Response

    def initialize(response)
      @response = response
    end

    def call
      case @response.status_code
      when 200
        handle_ok_response
      when 301
        handle_redirected_response
      else
        handle_unexpected_response
      end
    end

    private def handle_ok_response
      ParseTranslationsService.new(@response.body).call
    end

    private def handle_redirected_response
      puts("Сервер ответил с кодом 301 и Location #{@response.headers["Location"]}")
    end

    private def handle_unexpected_response
      output = <<-OUTPUT
      Неожиданный ответ от сервера
      Код ответа: #{@response.status_code}
      Заголовки ответа:
      #{@response.headers.to_yaml}
      Длина тела ответа: #{@response.body.size} символов
      OUTPUT
      puts output
    end
  end
end
