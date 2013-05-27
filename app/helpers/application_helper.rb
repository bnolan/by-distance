module ApplicationHelper

  def travel_distance(distance)
    if distance < 10
      "nearby"
    elsif distance < 80
      (distance / 80 * 60).ceil.to_s + " minutes drive"
    elsif distance < 400
      pluralize((distance / 80).ceil, ' hour') + " drive"
    else
      pluralize((distance / 880).ceil, ' hour') +  " flight"
    end
  end
  
  def icon_for_distance(distance)
    if travel_distance(distance).match /drive/i
      'mako/bus-24.png'
    elsif travel_distance(distance).match /flight/i
      'mako/airport-24.png'
    elsif travel_distance(distance).match /nearby/i
      'mako/marker-stroked-24.png'
    end
  end

end
