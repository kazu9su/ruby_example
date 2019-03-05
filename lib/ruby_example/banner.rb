# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'

module RubyExample
  class Banner
    attr_accessor :id, :ip, :title, :start_at, :end_at
    PERMITTED_IPS = ['10.0.0.1', '10.0.0.2'].freeze

    def initialize(id:, ip:, title:, start_at:, end_at:)
      @id = id
      @ip = ip
      @title = title
      @start_at = start_at
      @end_at = end_at
    end

    def self.create_from_json(json)
      self.new(ActiveSupport::JSON.decode(json).symbolize_keys)
    end

    def display_period?
      now_i = Time.now.to_i
      start_at_i = Date.parse(start_at).to_time.to_i
      end_at_i = Date.parse(end_at).to_time.to_i

      return now_i <= end_at_i if permitted_ip?

      now_i >= start_at_i && now_i <= end_at_i
    end

    private

    def permitted_ip?
      !ip.nil? && PERMITTED_IPS.include?(ip)
    end
  end
end
