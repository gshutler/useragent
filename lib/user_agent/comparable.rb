class UserAgent
  # A custom Comparable module that will always return false
  # if the <=> returns false
  module Comparable
    def <(other)
      (c = self <=> other) ? c == -1 : false
    end

    def <=(other)
      (c = self <=> other) ? c == -1 || c.zero? : false
    end

    def ==(other)
      (c = self <=> other) ? c.zero? : false
    end

    def >(other)
      (c = self <=> other) ? c == 1 : false
    end

    def >=(other)
      (c = self <=> other) ? c == 1 || c.zero? : false
    end
  end
end
