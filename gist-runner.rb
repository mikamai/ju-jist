$doc  = $$[:document]
input = $doc.querySelector('input#user_and_gist_id')
form  = $doc.querySelector('form')

form[:onsubmit] = -> submit {
  Native(submit).preventDefault
  user_and_gist_id = input[:value]
  $$[:location][:href] = "/#{user_and_gist_id}/index.html"
}
