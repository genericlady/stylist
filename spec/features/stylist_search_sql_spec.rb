require 'rails_helper'

describe StylistSearchSQL do
  def stylist_where(stylist_search_sql)
    User.joins(:locations)
        .where(stylist_search_sql.where_clause,
               stylist_search_sql.where_args)
        .order(stylist_search_sql.order)  
  end
  
  it "Can be initialized" do
    search_terms = { stylist: "Barbra, Foo", near: "new york, NY" }
    stylist_search_sql = StylistSearchSQL.new search_terms
    expect(stylist_search_sql.class).to eq(StylistSearchSQL)
  end

end
