class ProfileDownloader
  attr_reader :handle
  
  def initialize(handle)
    @handle = handle.downcase
  end
  
  def save!
    Profile.where(handle: handle, 
                 json: user_hash, 
                 stars: stars.to_i).first_or_create
  end

  private 
  def user_url
    "https://api.github.com/users/#{handle}"
  end

  def user_hash
    response = Faraday.get(user_url)
    JSON.parse(response.body)
  end

  def stars 
    response = Faraday.get(stars_url)
    link_header = response.headers['link']

    # trick as per https://github.community/t/how-can-i-know-the-number-of-repository-by-user-name/13767
    link_header.match(/page=(\d+)>; rel="last"/)[1]
  end

  def stars_url
    "https://api.github.com/users/#{handle}/starred?per_page=1"
  end
end