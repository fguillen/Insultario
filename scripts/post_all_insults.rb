require "httparty"

class Script
  def self.run(insults_file_path, app_host_url, admin_password)
    File.foreach("#{insults_file_path}") do |insult_text|
      post_insult(insult_text.strip, app_host_url, admin_password)
    end
  end

  def self.post_insult(insult_text, app_host_url, admin_password)
    puts "Sending insult: #{insult_text}"

    options = {
      body: {
        insult: { # your resource
          text: insult_text
        },
        password: admin_password
      }
    }

    url = "#{app_host_url}/admin/insults"
    response = HTTParty.post(url, options)

    puts "XXX: response.body: #{response.body}"
    puts "XXX: response.code: #{response.code}"

    if response.code.to_s =~ /20./
      puts "Sending correct!"
    else
      puts "Sending ERROR!"
    end
  end
end

if(ARGV.size != 3)
  puts "use $ ruby post_all_instuls.rb <INSULTS_FILE_PATH> <APP_HOST_URL> <ADMIN_PASSWORD>"
  exit 1
end

Script.run(ARGV[0], ARGV[1], ARGV[2])
