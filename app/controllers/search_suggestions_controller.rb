class SearchSuggestionsController < ApplicationController
    def index
       render json: SearchSuggestion.terms_for(param[:term])
    end
end
