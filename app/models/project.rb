class Project < ApplicationRecord
  belongs_to :team, optional: true

  def self.status_options
    %w[Green Yellow Red]
  end
end
