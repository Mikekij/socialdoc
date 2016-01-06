class PagesController < ApplicationController

  def home
  end

  def draft_report

  end

  def report
    @doc = Doc.find(params[:id])
    @doc_sites = @doc.doc_sites

    #zoc doc
    if !@doc_sites.where(:tracked_site_id => 1).empty? #this is hacky
      SiteStat.scrape_zoc_doc(@doc.doc_sites.where(:tracked_site_id => 1).last)
      @zoc_doc_site_stat = SiteStat.joins(:doc_site).where('tracked_site_id = ? AND doc_id = ?', 1, @doc.id).last
      @zoc_doc_rating_distribution = JSON.parse(@zoc_doc_site_stat.rating_distribution)
      @zoc_doc_site_stats = @doc.site_stats.joins(:doc_site).where('doc_sites.tracked_site_id = 1')

    end

    #google
    if !@doc_sites.where(:tracked_site_id => 2).empty? #this is hacky
      SiteStat.scrape_google(@doc.doc_sites.where(:tracked_site_id => 2).last)
      SiteStat.scrape_google_search_results(@doc.doc_sites.where(:tracked_site_id => 2).last)
      @google_site_stat = SiteStat.joins(:doc_site).where('tracked_site_id = ? AND doc_id = ?', 2, @doc.id).last
    end

  end

  def get_place_id

  end

  def google_api_submit
    location_string = params["/google_api_submit"][:location_string]
    name_string = params["/google_api_submit"][:name_string]
    doc_id = params["/google_api_submit"][:doc_id]
    #puts "doc_id: #{doc_id}"

    #puts location_string

    #place_id = "1234fagd"

    place_id = SiteStat.get_google_place_id(location_string, name_string)


    redirect_to new_doc_site_path(:place_id => place_id, :doc_id => doc_id)

  end

end
