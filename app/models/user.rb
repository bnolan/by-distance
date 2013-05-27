class User < ActiveRecord::Base
  # attr_accessible :title, :body
  serialize :friends_hash, JSON
  
  # Ahem - hardcoded to Melbourne
  
  def latitude
    -37.8136
  end
  
  def longitude
    144.963
  end
  
  def query!(token)
    if self.friends_hash.blank?
      self.friends_hash = FbGraph::Query.new(
        "SELECT uid, name, pic , timezone, hometown_location, current_location FROM user WHERE uid IN ( SELECT uid2 FROM friend WHERE uid1 = me() )"
      ).fetch(:access_token => token)
      save!
    end
  end
  
  def friends
    friends_hash.map do |hash|
      Friend.new(hash)
    end
  end
  
  def friends_with_location
    friends.select do |friend|
      friend.has_location?
    end
  end
  
  def cities
    friends_with_location.group_by(&:city).map do |key, friends|
      City.new(self, friends)
    end
  end
  
  def cities_by_distance
    cities.sort_by(&:distance)
  end
end
