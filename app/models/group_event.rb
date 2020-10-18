class GroupEvent < ApplicationRecord
  scope :drafts, -> { where published: false }
  scope :published_events, -> { where published: true }
  scope :deleted_events, -> { where deleted: true }
end
