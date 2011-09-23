ActiveSupport::SafeBuffer

module ActiveSupport
  class SafeBuffer < String

    def %(*args)
      to_str.% *args
    end
  end
end
