module IntervalsAPI
  class RequestHandler
    include HTTParty
    base_uri 'https://api.myintervals.com'

    attr_accessor :default_options

    def initialize(token)
      @default_options = {
        headers: {
          'Accept'        => 'application/json',
          'Content-Type'  => 'application/json',
          'Authorization' => "Basic #{Base64.encode64(token + ":X")}"
        },
        query:  {},
        body:   {}
      }
    end

    %w(get post put delete options).each do |request_type|
      define_method request_type do |url, options = {}|
        RecursiveOpenStruct.new(
          self.class.send(
            request_type,
            url,
            {
              headers:  @default_options[:headers].merge( options[:headers].to_json),
              query:    @default_options[:query].merge(   options[:query].to_json),
              body:     @default_options[:body].merge(    options[:body].to_json)
            }
          )
        )
      end
    end
  end
end
