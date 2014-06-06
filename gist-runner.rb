$doc = $$[:document]
input = $doc.querySelector('input#gist_id')
form = $doc.querySelector('form')

form[:onsubmit] = -> submit {
  Native(submit).preventDefault
  gist_id = input[:value]
  $$[:location][:href] = "/#{gist_id}/index.html"
}
