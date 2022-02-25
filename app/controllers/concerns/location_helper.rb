module LocationHelper
  def get_nearest_results(base_latitude, base_longitude)
    ll = base_latitude.to_s + ',' + base_longitude.to_s
    api_key = ENV['api_key']

    # make API call with the provided lat long
    url = URI("https://api.foursquare.com/v3/places/search?ll=#{ll}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"
    request['Authorization'] = api_key

    response = https.request(request)

    # parse the results, calculate and store the distance from the original provided location
    results = JSON.parse(response.body)["results"]
    results.each do |result|
      latitude = result["geocodes"]["main"]["latitude"]
      longitude = result["geocodes"]["main"]["longitude"]
      x = (latitude.to_f - base_latitude) * (latitude.to_f - base_latitude)
      y = (longitude.to_f - base_longitude) * (longitude.to_f - base_longitude)
      result['calculated_distance'] = Math.sqrt(x + y)
    end

    # sort the results
    results.sort_by { |hash| hash['calculated_distance'] }
  end
end
