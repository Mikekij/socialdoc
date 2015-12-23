module DocsHelper

  def name_doctorized(doc)
    "#{doc.first_name} #{doc.last_name}, #{doc.title}"
  end

end
