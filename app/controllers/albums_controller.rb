class AlbumsController < ApplicationController
    def index
        if params[:query].present?
            @albums = Album.global_search(params[:query]).order(created_at: :desc)
        else
            @albums = Album.all.order(created_at: :desc)
        end
    end

end
