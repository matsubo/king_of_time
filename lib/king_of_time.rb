require "king_of_time/version"
require 'rest-client'

# Main class
class KingOfTime

  END_POINT = 'https://kingoftime-recorder.appspot.com/ajax?function=record_timestamp_and_log'.freeze

  def initialize(name:, employee_id:, timerecorder_id:, password:)
    @param = {}
    @param[:employee_name] = name
    @param[:employee_id] = employee_id
    @param[:employee_timerecorder_id] = @param[:employee_timerecorder_id] = timerecorder_id
    @param[:password] = password
  end

  def check_in
    http_request(:checkin)
  end

  def check_out
    http_request(:checkout)
  end


  def start_break
    http_request(:start_break)
  end

  def end_break
    http_request(:end_break)
  end

  private
  def http_request(type)

    messages = {
      checkin: "<font color='#0000FF'>Check-in</font>",
      checkout: "<font color='#FF0000'>Check-out</font>",
      start_break:  "<font color='#00FF00'>Start break</font>",
      end_break: "<font color='#FF00FF'>End-break</font>"
    }

    codes = {
      checkin: 1,
      checkout: 2,
      start_break: 3,
      end_break: 4
    }

    now_with_time_zone = Time.now.getlocal('+09:00')

    params = @param.merge({
      recording_type_code: codes[type],
      recording_time: now_with_time_zone.strftime('%Y%m%d%H%M%S'),
      now: now_with_time_zone.to_i,
      kot_url: 'https://s3.kingtime.jp/gateway/gaegateway?page_id=/gaegateway/',
      log: now_with_time_zone.strftime('%m/%d %H:%M') + ' ' + messages[type] + ' ' + @param[:employee_name],
      time_zone: 'Asia/Tokyo',
      input_password: @param[:password],
    })

    headers = {
      'Accept' => 'application/json, text/javascript, */*; q=0.01',
      'Content-Type' => 'application/x-www-form-urlencoded',
      'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
      'X-Requested-With' => 'XMLHttpRequest',
      'origin' => 'https://kingoftime-recorder.appspot.com',
    }

    RestClient.post END_POINT, params, headers

  end

end

