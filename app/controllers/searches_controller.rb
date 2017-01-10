class SearchesController < ApplicationController
  def results
  end

  private
  def query_stylist
    Stylist.search_by_name('G')
  end

  def query_beauty
    Beauty.search_by_title('B')
  end

  def search_params_for_results
    params.permit(*(search_params)) 
  end

  def search_params
    [
      :query_type,
      searchTerms: [],
    ]
  end

end
