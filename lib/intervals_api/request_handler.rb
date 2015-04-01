module IntervalsAPI
  class RequestHandler
    include HTTParty
    base_uri 'https://api.myintervals.com'

    attr_accessor :default_options

    def initialize(token)
      unless token
        raise <<-MSG
          Must instantiate with a valid Intervals token
          Form: IntervalsAPI::RequestHandler.new(valid_token)
        MSG
      end

      @default_options = {
        headers: {
          'Accept'        => 'application/json',
          'Content-Type'  => 'application/json',
          'Authorization' => "Basic #{Base64.encode64(token + ":X")}"
        },
      }
    end

    %w(get post put delete).each do |request_type|
      define_method request_type do |url, options = {}|

        query_options = @default_options
        query_options[:headers].merge(options[:headers])  if options.key?(:header)
        query_options[:query] = options[:query]           if options.key?(:query)
        query_options[:body ] = options[:body ].to_json   if options.key?(:body)

        RecursiveOpenStruct.new(
          self.class.send(request_type, url, query_options)
        )
      end
    end
  end
end
