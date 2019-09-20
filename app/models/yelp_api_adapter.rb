class YelpApiAdapter
  require "json"
  require "http"

  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
  API_KEY = ENV["YELP_API_KEY"]

  DEFAULT_BUSINESS_ID = "ypqK8DWM8Bcs43YveSJnNw"
  DEFAULT_TERM = "dinner"
  DEFAULT_LOCATION = "New York, NY"
  SEARCH_LIMIT = 15

  def self.search(term, location = "new york")
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT,
    }
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse["businesses"]
  end

  def self.business_reviews(business_id)
    url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"
    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse["reviews"]
  end

  def self.business(business_id)
    url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse
  end
end
