# frozen_string_literal: true

require 'test_helper'

module RubyExample
  class BannerTest < Minitest::Test
    def setup
      @attributes = {
        id: 1,
        ip: '1.0.0.0',
        title: 'foo',
        start_at: '2014-08-10T12:00:00+0900',
        end_at: '2014-08-10T12:00:00+0900',
      }
    end

    def test_create_from_json
      assert_instance_of Banner, Banner.create_from_json(@attributes.to_json)
    end

    def test_display_period_if_expired
      refute Banner.create_from_json(@attributes.to_json).display_period?
    end

    def test_display_period_if_ip_is_valid_and_before_start_at
      @attributes[:ip] = '10.0.0.1'
      @attributes[:start_at] = (Date.today + 1).iso8601
      @attributes[:end_at] = (Date.today + 2).iso8601

      assert Banner.create_from_json(@attributes.to_json).display_period?
    end

    def test_display_period_if_ip_is_invalid_and_before_start_at
      @attributes[:start_at] = (Date.today + 1).iso8601
      @attributes[:end_at] = (Date.today + 2).iso8601

      refute Banner.create_from_json(@attributes.to_json).display_period?
    end

    def test_display_period_if_period_is_within_period
      @attributes[:start_at] = (Date.today - 1).iso8601
      @attributes[:end_at] = (Date.today + 2).iso8601

      assert Banner.create_from_json(@attributes.to_json).display_period?
    end
  end
end
