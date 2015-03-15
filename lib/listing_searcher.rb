module ListingSearcher
  def search(query)
    query.downcase!
    where("title like ?", "%#{query}%")
  end
end