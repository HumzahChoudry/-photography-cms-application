class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :category
  has_many :post_tags
  #has_many :tags, through: :post_tags
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :tags

  def tag_contents
    self.try(:tags).try(:content)
  end

  def tag_contents=(content)
    if !content.empty?
      content.each do |c|
        t = Tag.find_or_create_by(name: c)
        self.tags << t
      end
    end
  end

  def category_id=(id)
    self.category = Category.find(id)
    self.save
  end

  def category_id
    self.try(:category).try(:id)
  end
end
