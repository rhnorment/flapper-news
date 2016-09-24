# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  link       :string
#  upvotes    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  belongs_to  :user
  has_many    :comments

  def as_json(options = {})
    super(options.merge(include: [:user, comments: { include: :user }]))
  end

end
