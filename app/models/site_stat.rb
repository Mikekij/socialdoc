class SiteStat < ActiveRecord::Base

  belongs_to :doc_site
  has_many :tracked_sites, through: :doc_site
  has_many :docs, through: :doc_site


  def self.scrape_zoc_doc(doc_site)
    puts doc_site.url
    @site_stat = SiteStat.find_or_create_by(:doc_site_id => doc_site.id, :processed_date => Date.today)
    #get the page content
    m = Mechanize.new {|a| a.ssl_version, a.verify_mode = 'TLSv1',OpenSSL::SSL::VERIFY_NONE}
    page = m.get(doc_site.url)
    parsed_page = page.parser

    puts page

    #get demo info
    #doc name
    @site_stat.doc_name = page.at('[itemprop="name"]').content unless page.at('[itemprop="name"]').nil?

    #address_1
    puts page.at('[itemprop="streetAddress"]')
    content1 = page.at('[itemprop="streetAddress"]').content
    address_array = content1.split("\n")[1].split(" ")
    address_string = address_array[0]

    (1..(address_array.count - 1)).each do |a|
      address_string = address_string + " #{address_array[a]}"
    end

    @site_stat.address_1 = address_string

    #city
    @site_stat.city = page.at('[itemprop="addressLocality"]').content

    #state
    @site_stat.state = page.at('[itemprop="addressRegion"]').content

    #zip
    @site_stat.zip = page.at('[itemprop="postalCode"]').content

    #hours
    #n/a

    #practice name
    @site_stat.practice_name = page.at('a[class="practiceName"]').content

    #insurance accepted
    #can't do it yet

    #average rating
    @site_stat.avg_rating = page.at('meta[@itemprop="ratingValue"]')[:content]
    #rating count
    @site_stat.review_count = page.at('meta[@itemprop="reviewCount"]')[:content]

    #ratings histogram data

    ratings_distribution = {}

    ratings_distribution["five"] = parsed_page.css('.sg-rating-5_0').count
    ratings_distribution["four"] = parsed_page.css('.sg-rating-4_0').count
    ratings_distribution["three"] = parsed_page.css('.sg-rating-3_0').count
    ratings_distribution["two"] = parsed_page.css('.sg-rating-2_0').count
    ratings_distribution["one"] = parsed_page.css('.sg-rating-1_0').count

    @site_stat.rating_distribution = ratings_distribution.to_json

    #new ratings


    #first page?


    @site_stat.save!

    return @site_stat
  end

  def self.scrape_google(doc_site)
    puts "url: #{doc_site.url}"
    puts "search string: #{doc_site.data_1}"
    puts "google placeId: #{doc_site.data_2}"
    placeId = doc_site.data_2

    @site_stat = SiteStat.find_or_create_by(:doc_site_id => doc_site.id, :processed_date => Date.today)

    #get the Google PLaces info
    base_url = "https://maps.googleapis.com/maps/api/place/details/json?"
    place_id = "placeid=#{placeId}"
    api_key = "&key=AIzaSyApD_aS1Ay1bIb-g6dQrD9Gn1Djsyv8qjg"
    concat_url = base_url + place_id + api_key

    api_results = HTTParty.get(concat_url, :verify => false ).parsed_response["result"]

    #parse results, insert into @site_stat
    @site_stat.address_1 = api_results["address_components"].find { |x| x["types"].include?("street_number")}["long_name"] + " " + api_results["address_components"].find { |x| x["types"].include?("route")}["long_name"]
    @site_stat.city = api_results["address_components"].find { |x| x["types"].include?("locality")}["long_name"]
    @site_stat.state = api_results["address_components"].find { |x| x["types"].include?("administrative_area_level_1")}["short_name"]
    @site_stat.zip = api_results["address_components"].find { |x| x["types"].include?("postal_code")}["long_name"]
    @site_stat.phone =  api_results["formatted_phone_number"]
    @site_stat.url =  api_results["website"]
    @site_stat.doc_name = api_results["name"]

    @site_stat.save!


    return api_results
    #return @site_stat
  end

  def self.scrape_google_search_results(doc_site)
    puts doc_site.url
    @site_stat = SiteStat.find_or_create_by(:doc_site_id => doc_site.id, :processed_date => Date.today)
    #get the page content
    m = Mechanize.new {|a| a.ssl_version, a.verify_mode = 'TLSv1',OpenSSL::SSL::VERIFY_NONE}
    page = m.get('http://www.google.com/')
    google_form = page.form('f')
    google_form.q = doc_site.data_1
    page = m.submit(google_form, google_form.buttons.first)

    #puts page

    results_array = []

    page.links.each do |link|
      if link.href.to_s =~/url.q/ and !link.href.to_s.include?("webcache") and !link.href.to_s.include?("/settings/ads/preferences") #this is hacky
          str=link.href.to_s
          strList=str.split(%r{=|&})
          url=strList[1]
          puts url
          results_array << url
      end
    end

    @site_stat.search_results = results_array.to_json
    @site_stat.save!

    return results_array


  end


end
