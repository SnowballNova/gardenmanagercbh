require 'rails_helper'

RSpec.describe "Brakeman exercise spec" do
  it 'contains an SQL injection for the students to fix' do
    brakeman_report = Brakeman.run(
      app_path: Rails.root,
      run_checks: ["CheckSQL"],
      only_files: ["app/controllers/gardens_controller.rb"]
    ).report

    warning_message = brakeman_report.to_hash[:generic_warnings][0].message
    expect(warning_message).to match(/Possible SQL injection.+Garden.find_by_sql/)
  end
end
