class GistResult
  def initialize(response)
    @response = response
  end

  def html_url
    @response['html_url']
  end

  def success?
    html_url.present?
  end
end
