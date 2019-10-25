module Admin::GistsHelper
  def gist_hash(gist)
    gist.gist_url.split('/').last
  end
end
