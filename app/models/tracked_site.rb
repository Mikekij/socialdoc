class TrackedSite < ActiveRecord::Base

  has_many :doc_sites
  has_many :site_stats, through: :doc_sites

end
