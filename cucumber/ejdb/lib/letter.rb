# frozen_string_literal: true

require 'json'

module Letter
  # Paper
  class Paper
    def initialize(tag)
      # @type: [int]
      @paper_tag = tag
    end

    def send(contact_name) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      # @type [String]
      contact = contact_name
      # @type [String]
      request_body = { 'name' => contact, 'tag' => @paper_tag }.to_json
      Cucumber.logger.info "#{request_body}\n"
      # @type [URI::HTTP]
      url = URI.parse 'http://localhost:9191/persons'
      # @type [Net::HTTPRequest]
      request = Net::HTTP::Post.new(url.path)
      request['Content-Type'] = 'application/json'
      case request
      when Net::HTTPRequest
        request.body = request_body
      end
      # @type [Net::HTTPResponse]
      response = Net::HTTP.start(url.host, url.port) do |http|
        http.request request
      end
      case response
      when Net::HTTPResponse
        # @type [String]
        response_body = response.body
        Cucumber.logger.info "#{response_body}\n"
      end
    end

    def receive # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      # @type [String]
      request_body = "@persons/[tag=#{@paper_tag}]"
      Cucumber.logger.info "#{request_body}\n"
      # @type [URI::HTTP]
      url = URI.parse('http://localhost:9191/')
      # @type [Net::HTTPRequest]
      request = Net::HTTP::Post.new(
        url.path,
        {
          'Content-Type' => 'application/json'
        }
      )
      case request
      when Net::HTTPRequest
        request.body = request_body
      end
      # @type [Net::HTTPResponse]
      response = Net::HTTP.start(url.host, url.port) do |http|
        http.request(request)
      end
      case response
      when Net::HTTPResponse
        # @type [String]
        response_body = response.body
        Cucumber.logger.info "#{response_body}\n"
        # @type [Array]
        document = response_body.split("\t")
        # @type [Hash]
        document_json = JSON.parse(document[1])
        # @type [String]
        name = document_json['name']
        Cucumber.logger.info "#{name}\n"
        name
      end
    end
  end
end
