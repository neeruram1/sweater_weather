class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :image_url, :author, :author_profile_link, :source, :source_url
end
