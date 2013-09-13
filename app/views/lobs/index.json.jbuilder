json.array!(@lobs) do |lob|
  json.extract! lob, :description
  json.url lob_url(lob, format: :json)
end
