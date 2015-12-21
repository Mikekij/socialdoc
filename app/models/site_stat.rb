class SiteStat < ActiveRecord::Base

  belongs_to :doc_site
  has_many :tracked_sites, through: :doc_site
  has_many :docs, through: :doc_site

end
