module Sostik::Info
  class ParseTranslationsService
    include Helpers

    def initialize(body : String)
      @parser = Myhtml::Parser.new(body)
    end

    def call
      @parser.css("div.vcb_word").each do |word_wrapper|
        puts
        begin
          puts(green(word_wrapper.css("span.vcb_word_top").first.inner_text))
        rescue Enumerable::EmptyError
          puts(red("Ничего не найдено"))
        end

        word_wrapper.css("li.dec").each do |translations|
          show_translation(translations)

          examples = parse_examples(translations)
          show_examples(examples) if examples.any?

          puts("________________________")
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
      return examples
    end

    private def show_examples(examples)
      puts("Примеры:")
      examples.each do |k,r|
        puts("#{blue(k)} - #{r}")
      end
    end

    private def show_translation(translations)
      puts(yellow(translations.css("span.black").first.inner_text))
      puts
    end
  end
end
