class DocSite < ActiveRecord::Base

  belongs_to :doc
  belongs_to :tracked_site

  has_many :site_stats

end
