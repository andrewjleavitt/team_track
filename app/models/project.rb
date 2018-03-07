class Project < ApplicationRecord

  def self.status_options
    %w[Green Yellow Red]
  end
end
