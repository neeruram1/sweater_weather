class Image
  attr_reader :id,
              :author,
              :source,
              :location,
              :image_url,
              :source_url,
              :author_profile_link

  def initialize(data)
    @id = data[:id]
    @source = data[:source]
    @location = data[:location]
    @author = data[:author]
    @image_url = data[:image_url]
    @author_profile_link = data[:author_profile_link]
    @source_url = data[:source_url]
  end
end
