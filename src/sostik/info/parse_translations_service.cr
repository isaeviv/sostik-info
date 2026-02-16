module Sostik::Info
  class ParseTranslationsService

    def initialize(body : String)
      @parser = Myhtml::Parser.new(body)
    end

    def call
      @parser.css("div.vcb_word").each do |word_wrapper|
        puts(word_wrapper.css("span.vcb_word_top").first.inner_text)

        word_wrapper.css("li.dec").each do |translations|
          puts(translations.css("span.black").first.inner_text)
          parse_examples(translations)
        end
      end
    end

    private def parse_examples(translations :  Myhtml::Node)
      examples = {} of String => String
      khakass = translations.css("span.brown").map(&.inner_text)
      russian = translations.css("span.blue").map(&.inner_text)
      
      khakass.each_with_index do |example, index|
        examples[example] = russian[index]
      end

      puts(examples.to_yaml)
    end
  end
end
