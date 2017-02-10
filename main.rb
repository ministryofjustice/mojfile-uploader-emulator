require 'sinatra'
require 'json'

post '/?:collection_ref?/new' do |collection_ref|
  content_type :json
  filename = JSON.parse(request.body.read).fetch('file_filename', '')
  body( { collection: collection_ref, key: filename }.to_json)
  status(200)
end

delete '/:collection_ref/:filename' do |collection_ref, filename|
  status(204)
end

