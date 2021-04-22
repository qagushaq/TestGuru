module ApplicationHelper

  COLORS = { alert: 'danger', notice: 'warning', greeting: 'success', goodbye: 'primary' }

  def current_year
    "#{Time.current.year.to_i}"
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(flag)
    tag.p(flash[flag], class: "flash #{flag}") if flash[flag]
    tag.span(flash[flag]) if flash[flag]
  end

  def bootstrap_color(flag)
    "alert-#{COLORS[flag.to_sym]}"
  end
end
