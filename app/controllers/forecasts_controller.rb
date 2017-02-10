class ForecastsController < ApplicationController

  def index
    city = params[:city]
    state = params[:state]
    unless city && state
      city = "new york"
      state = "ny"
    end
    data = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    @forecasts = data["query"]["results"]["channel"]["item"]["forecast"]
    @title = data["query"]["results"]["channel"]["item"]["title"]
    @description = data["query"]["results"]["channel"]["item"]["description"]
  end
end
