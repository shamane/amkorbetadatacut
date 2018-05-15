class AchieveWithCore
  def self.call(data)
    new.call(data)
  end

  def call(data)
    result = RestClient::Request.execute(method: :post,
                                         url: base_path,
                                         headers: headers,
                                         payload: data.to_json)
    core_id = JSON.parse(result)['data']['id']
    update_core_id(core_id) if core_id.present?
  rescue RestClient::Exception => e
    puts JSON.parse(e.response)['errors']
  end

  private

  def headers
    { 'Content-Type': 'application/vnd.api+json',
      'Accept': 'application/vnd.api+json' }
  end

  def host_path
    'http://lvh.me:3000'
  end

  def base_path
    "#{host_path}/api/jobs"
  end

  def update_core_id(updated_id)
  end
end
