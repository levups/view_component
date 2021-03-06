# frozen_string_literal: true

require "test_helper"
require "rails/generators/test_case"
require "rails/generators/haml/component_generator"

Rails.application.load_generators

class HamlGeneratorTest < Rails::Generators::TestCase
  tests Haml::Generators::ComponentGenerator
  destination File.expand_path("../tmp", __dir__)
  setup :prepare_destination

  arguments %w[user]

  def test_component
    run_generator

    assert_file "app/components/user_component.html.haml" do |view|
      assert_match(/%div Add User template here/, view)
    end
  end

  def test_component_with_namespace
    run_generator %w[admins/user]

    assert_file "app/components/admins/user_component.html.haml"
  end
end
