class SiteController < ApplicationController
  def search
    # artists = Artist.where("name LIKE ?", "%#{params[:term]}%") #sql injection defense
    # labels = Label.where("name LIKE ?", "%#{params[:term]}%")
    # albums = Album.where("name LIKE ?", "%#{params[:term]}%")
    # @results = artists + labels + albums #allows us to search throughout all of the tables

    # refactored
    #     @results = []
    #     [Artist, Album, Label].each do |model|
    #       @results += model.where("name LIKE ?", "%#{params[:term]}%")
    #     end
    #     @results
    #   end
    # end

    #refactored
    #     @results = [Artist, Album, Label].map do |model|
    #       model.where("name LIKE ?", "%#{params[:term]}%")
    #     end.flatten
    #   end
    # end

    #controller should be talking directly to the models. 'Where' implies that they are talking to the data base.
    # enter this in label.rb artist.rb and album.rb then was moved to application_record.rb
    # problem: every model created from now on will inherit from this seach def.

    # def self.search(term)
    #   where("name LIKE ?", "%#{term}%")
    # end

    #created "searchable_by_name.rb" in app>models>concerns. It is a module. Input above code to file and remove from application_record.rb

    #in label.rb artist.rb and album.rb add include SearchableByName
    #concerns are a way to clean up repeated code in your models

#so the ALL the results don't show up just by refreshing. Check search.html.erb
    term = params[:term]
    return if term.blank?

    #refactor with map
    @results = [Artist, Album, Label].map do |model|
      model.search(params[:term])
    end.flatten
  end
end
