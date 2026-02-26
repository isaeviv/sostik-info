# TODO: Write documentation for `Sostik::Info`
require "http/client"
require "myhtml"
require "yaml"
require "./**"
# require "../src/sostik/info/get_translate_service"

module Sostik::Info
  BASE_URL = "http://sostik.info/word/"
  VERSION = "0.1.0"

  def self.run
    if ARGV.any?
      GetTranslateService.new(ARGV[0]).call
    else
      puts("Передайте слово для перевода в качестве аргумента")
    end
  end
end

Sostik::Info.run
