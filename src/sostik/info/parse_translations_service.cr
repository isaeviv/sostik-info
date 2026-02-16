module Sostik::Info
  class ParseTranslationsService
    @body : String

    def initialize(body)
      @body = body
    end

    def call
      puts("progress")
    end
  end
end
