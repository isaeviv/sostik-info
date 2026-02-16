# TODO: Write documentation for `Sostik::Info`
require "http/client"
require "compress/gzip"
require "yaml"
require "./**"
# require "../src/sostik/info/get_translate_service"

module Sostik::Info
  BASE_URL = "http://sostik.info/word/"
  VERSION = "0.1.0"
  GetTranslateService.new("ит").call
end
