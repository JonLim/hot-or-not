require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "person_count_test" do
    assert_equal 1, Person.count
  end
  
  test "person_name_not_nil" do
    assert_not_nil people(:person_one).name
  end
  
  test "person_imageurl_not_nil" do
    assert_not_nil people(:person_one).imageurl
  end
  
  test "person_hotness_test" do
    hotness = people(:person_one).times_rated != 0 ? ((people(:person_one).times_liked.to_f / people(:person_one).times_rated) * 100).round(2) : 0.00
    assert_equal hotness, people(:person_one).hotness
  end
  
end
