class Comment < ApplicationRecord

    include Visible
    #belongs_to :article // désactivé pour les tests
    belongs_to :article, optional: true
end
