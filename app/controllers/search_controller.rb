class SearchController < ApplicationController

  def index
    search_results = SearchResults.new(search_params)
    @search_facade = SearchFacade.new(search_results)
  end

  private

  def search_params
    params.permit(:location)
  end
end
