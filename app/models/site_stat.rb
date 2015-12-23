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

    puts page

    #get demo info
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

    #new ratings


    #first page?


    @site_stat.save!

    return @site_stat
  end

end
