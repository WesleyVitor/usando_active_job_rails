class ReporteJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    sleep 8
    unless File.directory?("#{Rails.root.join('public')}/reports")
      Dir.mkdir "#{Rails.root.join('public')}/reports"
    end
    code = (0...8).map { (65 + rand(26)).chr }.join
    out_file = File.new("#{Rails.root.join('public')}/reports/report#{code}.html", "w")
    out_file.puts("<p>Your Report Here - code: <b>#{code}</b></p>")
    out_file.puts("<hr>")
    out_file.close
  end
end
