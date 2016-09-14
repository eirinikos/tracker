# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  state       :string
#  project_id  :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#

class Task < ActiveRecord::Base
  belongs_to :project

  validates :project_id, presence: :true
  validates :name, presence: :true
  validates :description, presence: :true
  validates :state, inclusion: { in: %w(to-do in-progress done) }

  after_initialize :set_default_state

  def project_name
    project.name
  end

  private

  def set_default_state
    self.state ||= 'to-do'
  end
end
