require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  
  test "person_name_not_nil" do
    assert_not_nil people(:person_one).name
  end
  
  test "person_imageurl_not_nil" do
    assert_not_nil people(:person_one).imageurl
  end
  
  test "person_times_liked_more_than_rated" do
    assert_not people(:person_one).times_liked > people(:person_one).times_rated
  end
  
  test "person_hot_rated_correct_increment" do
    original_times_liked = people(:person_one).times_liked
    original_times_rated = people(:person_one).times_rated
    people(:person_one).hot
    assert_equal original_times_liked + 1, people(:person_one).times_liked
    assert_equal original_times_rated + 1, people(:person_one).times_rated
  end
  
  test "person_not_rated_correct_increment" do
    original_times_liked = people(:person_one).times_liked
    original_times_rated = people(:person_one).times_rated
    people(:person_one).not
    assert_equal original_times_liked, people(:person_one).times_liked
    assert_equal original_times_rated + 1, people(:person_one).times_rated
  end
  
  test "person_hotness_test" do
    hotness = people(:person_one).times_rated != 0 ? ((people(:person_one).times_liked.to_f / people(:person_one).times_rated) * 100).round(2) : 0.00
    assert_equal hotness, people(:person_one).hotness
  end
  
end
