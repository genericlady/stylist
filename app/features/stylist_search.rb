class StylistSearch
  def self.resolve(search_terms, page_size, page)
    stylist_search_sql = StylistSearchSQL.new(search_terms)

    User.joins(:locations)
        .where(stylist_search_sql.where_clause,
               stylist_search_sql.where_args)
        .order(stylist_search_sql.order)
        .offset(page_size * page)
        .limit(page_size)
  end
end
