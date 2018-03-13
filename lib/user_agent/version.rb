class UserAgent
  class Version
    include ::Comparable

    def self.new(obj = nil)
      case obj
      when Version
        obj
      when String
        super
      when NilClass
        super("")
      else
        raise ArgumentError, "invalid value for Version: #{obj.inspect}"
      end
    end

    def initialize(str)
      @str = str

      if @str =~ /^\s*$/
        @nil        = true
        @sequences  = []
        @comparable = false
      elsif str =~ /^\d+$/ || str =~ /^\d+\./
        @nil        = false
        @sequences  = str.scan(/\d+|[A-Za-z][0-9A-Za-z-]*$/).map { |s| s =~ /^\d+$/ ? s.to_i : s }
        @comparable = true
      else
        @nil        = false
        @sequences  = [str]
        @comparable = false
      end
    end

    def nil?
      @nil
    end

    def to_a
      @sequences.dup
    end

    def to_str
      @str.dup
    end

    def eql?(other)
      other.is_a?(self.class) && to_s == other.to_s
    end

    def ==(other)
      case other
      when Version
        eql?(other)
      when String
        eql?(self.class.new(other))
      when NilClass
        nil?
      else
        false
      end
    end

    def <=>(other)
      case other
      when Version
        if @comparable
          ([0] * 6).zip(to_a, other.to_a).each do |_dump, a, b|
            a ||= 0
            b ||= 0

            return -1 if a.is_a?(String) && b.is_a?(Integer)
            return 1 if a.is_a?(Integer) && b.is_a?(String)
            next if a == b
            return a <=> b
          end
          0
        elsif to_s == other.to_s
          0
        else
          -1
        end
      when String, NilClass
        self <=> self.class.new(other)
      end
    end

    def to_s
      to_str
    end

    def inspect
      "#<#{self.class} #{self}>"
    end
  end
end
