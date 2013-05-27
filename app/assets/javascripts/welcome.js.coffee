# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class FacebookLogin
  constructor: ->
    # FB.Event.subscribe 'auth.authResponseChange', (response) =>
    #   alert(JSON.stringify(response)) # @onResponse
      
    FB.login(@onResponse, { scope : "email,friends_hometown,friends_location" })
    # ",friends_hometown,friends_location,hometown,location" })
    
  onResponse: (response) =>
    if (response.status == 'connected')
      window.top.location = window.facebookAppUrl
    else if (response.status == 'not_authorized')
      FB.login()
    else
      FB.login()

@FacebookLogin = FacebookLogin
