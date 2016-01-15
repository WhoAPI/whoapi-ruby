module WhoAPI
  class Error < StandardError
    attr_reader :status, :status_desc

    def initialize(status, status_desc)
      @status = status
      @status_desc = status_desc
    end

    def message
      "Error code: #{@status} - #{@status_desc}"
    end

  end
end
