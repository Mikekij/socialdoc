module DocSitesHelper

  def selected(doc)
    if doc.nil?
      return nil
    else
      return doc.id
    end
  end

end
