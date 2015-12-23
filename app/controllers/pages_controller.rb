class PagesController < ApplicationController

  def home
  end

  def draft_report

  end

  def report
    @doc = Doc.find(params[:id])
    
    SiteStat.scrape_zoc_doc(@doc.doc_sites.where(:tracked_site_id => 1).last)
    @site_stat = @doc.site_stats.last
    @rating_distribution = JSON.parse(@site_stat.rating_distribution)

  end

end
