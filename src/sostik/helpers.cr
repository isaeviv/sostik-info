module Sostik::Info
  module Helpers
    def red(string)
      return "\e[31m#{string}\e[0m"
    end

    def green(string)
      return "\e[32m#{string}\e[0m"
    end

    def yellow(string)
      return "\e[33m#{string}\e[0m"
    end

    def blue(string)
      return "\e[34m#{string}\e[0m"
    end
  end
end