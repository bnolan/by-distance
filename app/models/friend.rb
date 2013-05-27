class Friend
  def initialize(hash)
    @hash = hash
  end

  def location_hash
    @hash['current_location'] || @hash['hometown_location']
  end
  
  def has_location?
    @hash['current_location'].present? || @hash['hometown_location'].present?
  end
  
  def name
    @hash['name']
  end
  
  def pic
    @hash['pic']
  end
  
  def profile_url
    "http://www.facebook.com/" + @hash['uid'].to_s
  end
  
  def location
    OpenStruct.new({
      :city => location_hash['city'],
      :state => location_hash['state'],
      :country => location_hash['country'],
      :latitude => location_hash['latitude'],
      :longitude => location_hash['longitude']
    })
  end
  
  def city
    [location.city, location.state, location.country].join(", ")
  end
  
  def latitude
    location.latitude
  end
  
  def longitude
    location.longitude
  end
end
