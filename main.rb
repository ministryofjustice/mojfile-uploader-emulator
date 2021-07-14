require 'sinatra'
require 'json'

get '/:collection_ref/?:folder:x?' do |collection_ref, folder, _|
  content_type :json
  files = {
    collection: collection_ref,
    folder: folder,
    files: [
      { key: 'ABC123',
        title: 'Test Document ABC123',
        last_modified: Time.now },
      { key: 'DEF456',
        title: 'Test Document DEF456',
        last_modified: Time.now }
    ]
  }
  body(files.to_json)
  status(200)
end

post '/?:collection_ref?/new' do |collection_ref|
  content_type :json
  filename = JSON.parse(request.body.read).fetch('file_filename', '')
  body({ collection: collection_ref, key: filename }.to_json)
  status(200)
end

delete '/:collection_ref/?:folder?/:filename' do |_, _|
  status(204)
end
