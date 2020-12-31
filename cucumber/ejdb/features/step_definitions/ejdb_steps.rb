# frozen_string_literal: true

require 'net/http'
require 'uri'

require 'rspec'

require File.expand_path('../../lib/letter', __dir__)

Given('Start ejdb') do
  @paper = Letter::Paper.new(rand(10_000))
  fork do
    system('jbs --trylock')
  end
  sleep 2
end

When('Send {string}') do |contact_name|
  @paper.send(contact_name)
end

Then('Receive {string}') do |receive_content|
  # @Type [String]
  receive_data = @paper.receive
  Cucumber.logger.info "#{receive_data}\n"
  expect(receive_data).to eq(receive_content)
end

Given('Stop ejdb') do
  system('killall -15 jbs')
  sleep 1
end
