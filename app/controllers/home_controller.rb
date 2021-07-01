class HomeController < ApplicationController
    def index
        render
    end
    
    def four_o_four
        render
    end

    def redirect_to_original_url
      link = Link.find_by(short_url: params[:short_url_id])
      unless link.present?
        redirect_to '/not-found'
        return 
      end
      link.increment!(:counter)
      redirect_to "https://#{link.original_url}"
    end

end
