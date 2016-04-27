require "king_of_time/version"
require 'rest-client'

class KingOfTime

  END_POINT = 'https://kingoftime-recorder.appspot.com/ajax?function=record_timestamp_and_log'

  def initialize(name:, employee_id:, timerecorder_id:)
    @param = {}
    @param[:name] = name
    @param[:employee_id] = employee_id
    @param[:timerecorder_id] = @param[:employee_timerecorder_id] = timerecorder_id
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
      end_break: "<font color='#FF00FF'>End-break</font>",
    }

    codes = {
      checkin: 1,
      checkout: 2,
      start_break: 3,
      end_break: 4,
    }

    params = @param.merge({
      recording_type_code: codes[type],
      device_type_code:4,
      recording_time: Time.now.strftime('%Y%m%d%H%M%S'),
      now: Time.now.to_i,
      kot_url: 'https://s3.kingtime.jp/gateway/gaegateway?page_id=/gaegateway/',
      log: Time.now.strftime('%m/%d %H:%M') + ' ' + messages[type] + ' ' + @param[:name],
      # input_password: '', # not necessary
    })

    headers = {
      'Accept' => 'application/json, text/javascript, */*; q=0.01',
      'Content-Type' => 'application/x-www-form-urlencoded',
      'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36',
      'X-Requested-With' => 'XMLHttpRequest',
    }

    RestClient.post END_POINT, params, headers


  end


end
