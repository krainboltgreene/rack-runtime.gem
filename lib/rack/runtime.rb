module Rack
  class Runtime
    require_relative "runtime/version"

    attr_reader :startstamp
    private :startstamp

    attr_reader :endstamp
    private :endstamp

    attr_reader :label
    private :label

    def initialize(stack, label = "Runtime")
      @stack = stack
      @label = label
    end

    def call(previous_state)
      @state = previous_state
      @startstamp = Time.now

      @status, @headers, @body = stack.call(state)

      @endstamp = Time.now

      unless headers.has_key?(label)
        headers[label] = runtime
      end

      [status, headers, body]
    end

    private def runtime
      (endstamp - startstamp).to_s
    end

    private def stack
      @stack
    end

    private def state
      @state
    end

    private def headers
      @headers
    end

    private def status
      @status
    end

    private def body
      @body
    end
  end
end
