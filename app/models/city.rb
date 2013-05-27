class City
  attr_accessor :name, :state, :country, :latitude, :longitude, :friends, :distance

  def initialize(user, friends)
    @friends = friends
    @latitude = friends.first.latitude
    @longitude = friends.first.longitude
    @name = friends.first.location.city
    @state = friends.first.location.state
    @country = friends.first.location.country
    @distance = calculate_distance(user.latitude, user.longitude)
  end
  
  private
  
  def calculate_distance(lat1, lon1)
    lat2 = @latitude
    lon2 = @longitude
    
    earthRadius = 6371 # Earth's radius in KM

    # convert degrees to radians
    def convDegRad(value)
      unless value.nil? or value == 0
        value = (value/180) * Math::PI
      end
      value
    end

    deltaLat = (lat2-lat1)
    deltaLon = (lon2-lon1)
    deltaLat = convDegRad(deltaLat)
    deltaLon = convDegRad(deltaLon)

    # Calculate square of half the chord length between latitude and longitude
    a = Math.sin(deltaLat/2) * Math.sin(deltaLat/2) +
        Math.cos((lat1/180 * Math::PI)) * Math.cos((lat2/180 * Math::PI)) *
        Math.sin(deltaLon/2) * Math.sin(deltaLon/2); 

    # Calculate the angular distance in radians
    begin
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
      earthRadius * c
    rescue
      10e8
    end
  end
end