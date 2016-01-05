module SiteStatsHelper

  def url_test(url,string)
    if url.split('/').any? {|str| str.downcase.include?(string.downcase)}
      "<li class='stat-green'>#{url.split('/')[2]}</li>"
    else
      "<li class='stat-red'>#{url.split('/')[2]}</li>"
    end
  end

end
