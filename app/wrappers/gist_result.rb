class GistResult
  def initialize(response)
    @response = response
  end

  def url
    @response['html_url']
  end

  def success?
    url.present?
  end
end
