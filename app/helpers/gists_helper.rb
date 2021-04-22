module GistsHelper

  def link_to_gist(gist)
    gist_url = "https://gist.github.com/#{gist.gist_url}.git"
    link_to(gist.gist_url, gist_url, target: '_blank', rel: 'noopener')
  end

end
