module SearchableByName
  extend ActiveSupport::Concern

    module ClassMethods #remove self.search with this
      def search(term)
        where("name LIKE ?", "%#{term}%")
      end
    end
  end

  #another way
#   included do
#     scope :search, ->(term { where("name LIKE ?", "%#{term}%")}
#   end
# end
#in label.rb artist.rb and album.rb add include SearchableByName
