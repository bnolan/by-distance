$facebook =
  if Rails.env.production?
    { 
      :id => "172947592871456", 
      :secret => ENV['FB_SECRET'], 
      :app_url => "https://apps.facebook.com/by-distance/" 
    }
  else
    { :id => "601889039834754", :secret => 'df1e98e18b5d2c0cb76b6fc8cd3347d0', :app_url => "https://apps.facebook.com/flights-dev/" }
  end
