require "test_helper"


class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweets_url
    assert_response :success
  end

  test "should get create" do
    post tweets_url, params: { tweet: { body: 'Hello, world!' } }  # Använd POST för att skapa en ny tweet
    assert_response :success
  end

  test "should get destroy" do
    delete tweet_url(tweets(:one))
    assert_redirected_to tweets_url # Förvänta dig en omdirigering till tweets_url
  end
end
