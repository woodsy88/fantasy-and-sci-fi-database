jQuery ->
  console.log "autocomplete"
  $('[data-behavior="autocomplete"]').atwho(
    at:"@", 
    'data': "/users.json"
  )