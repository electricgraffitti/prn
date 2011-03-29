// JS validations go here

$(document).ready(function() {
  
  // Validates a new user 
    $('#new_user').validate({
      rules: {
        "user[fullname]": "required",
        "user[username]": {required: true, email: true},
        "user[phone]": "required",
        "user[password]": "required"
      },
      messages: {
        "user[fullname]": "please supply your name",
        "user[username]": {
          required: "please supply an email address", 
          email: "your email is not valid."},
        "user[phone]": "please supply a phone number",
        "user[password]": "please supply a password"
      }
    });
    
    // validates booking
    $('#new_booking').validate({
      
      rules: {
        "booking[arrival_date]": "required",
        "booking[departure_date]": "required"
      },
      messages: {
        "booking[arrival_date]": "arrival date invalid",
        "booking[departure_date]": "departure date invalid"
      },
      
    });
});
  