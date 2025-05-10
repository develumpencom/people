require "test_helper"

module People
  class PersonTest < ActiveSupport::TestCase
    setup do
      @person = people_people(:one)
    end

    test "is valid" do
      assert @person.valid?
    end

    test "without name is invalid" do
      @person.name = nil

      assert @person.invalid?
      assert_not_empty @person.errors[:name]
    end
  end
end
