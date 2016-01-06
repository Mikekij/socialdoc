module SiteStatsHelper

  def url_test(url,string)
    if url.split('/').any? {|str| str.downcase.include?(string.downcase)}
      "<li class='stat-green'>#{url.split('/')[2]}</li>"
    else
      "<li class='stat-red'>#{url.split('/')[2]}</li>"
    end
  end


  def review_count_change(site_stats)
    @last = site_stats.last
    @first = site_stats.first

    percent_change = (@last.review_count.to_f - @first.review_count.to_f ) / @first.review_count.to_f

    if percent_change >= 0
      change_info = "<span class='stat-green'>#{@last.review_count} (#{number_with_precision(percent_change, :precision => 3)}%)</span>"
    else
      change_info = "<span class='stat-red'>#{@last.review_count} (#{number_with_precision(percent_change, :precision => 3)}%)</span>"
    end

    return change_info.html_safe
  end

  def average_rating_change(site_stats)
    @last = site_stats.last
    @first = site_stats.first

    percent_change = (@first.avg_rating.to_f - @last.avg_rating.to_f ) / @last.avg_rating.to_f

    if percent_change >= 0
      change_info = "<span class='stat-green'>#{@last.avg_rating} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    else
      change_info = "<span class='stat-red'>#{@last.avg_rating} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    end

    return change_info.html_safe
  end

  def ratio_change(site_stats)
    @last = site_stats.last
    @first = site_stats.first

    last_ratio = JSON.parse(@last.rating_distribution)["five"].to_f / JSON.parse(@last.rating_distribution)["one"].to_f

    first_ratio = JSON.parse(@first.rating_distribution)["five"].to_f / JSON.parse(@first.rating_distribution)["one"].to_f

    percent_change_unformatted = (last_ratio.to_f - first_ratio.to_f ) / first_ratio.to_f

    percent_change_unformatted.nan? ? percent_change = 0 : percent_change = percent_change_unformatted

    puts "#{last_ratio}, #{first_ratio}, #{percent_change}"

    if percent_change >= 0
      change_info = "<span class='stat-green'>#{number_with_precision(last_ratio,:precision => 2)} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    else
      change_info = "<span class='stat-red'>#{number_with_precision(last_ratio,:precision => 2)} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    end

    return change_info.html_safe
  end

  def one_star_change(site_stats)
    @last = site_stats.last
    @first = site_stats.first

    percent_change_unformatted = (JSON.parse(@last.rating_distribution)["one"].to_f - JSON.parse(@first.rating_distribution)["one"].to_f ) / JSON.parse(@first.rating_distribution)["one"].to_f
    percent_change_unformatted.nan? ? percent_change = 0 : percent_change = percent_change_unformatted

    if percent_change >= 0
      change_info = "<span class='stat-green'>#{JSON.parse(@last.rating_distribution)["one"]} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    else
      change_info = "<span class='stat-red'>#{JSON.parse(@last.rating_distribution)["one"]} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    end

    return change_info.html_safe
  end

  def five_star_change(site_stats)
    @last = site_stats.last
    @first = site_stats.first

    percent_change_unformatted = (JSON.parse(@last.rating_distribution)["five"].to_f - JSON.parse(@first.rating_distribution)["five"].to_f ) / JSON.parse(@first.rating_distribution)["five"].to_f
    percent_change_unformatted.nan? ? percent_change = 0 : percent_change = percent_change_unformatted

    if percent_change >= 0
      change_info = "<span class='stat-green'>#{JSON.parse(@last.rating_distribution)["five"]} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    else
      change_info = "<span class='stat-red'>#{JSON.parse(@last.rating_distribution)["five"]} (#{number_with_precision(percent_change, :precision => 1)}%)</span>"
    end

    return change_info.html_safe
  end

end
