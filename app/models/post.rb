class Post < ApplicationRecord
    belongs_to :user
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :answers, class_name: 'Post', foreign_key: 'parent_post_id', dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
  
    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
    before_validation :set_published_at
  
    private
  
    def set_published_at
      self.published_at ||= Time.current
    end
  end
  