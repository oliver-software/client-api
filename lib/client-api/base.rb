module ClientApi

  def get(url, headers = nil)
    @output = get_request(url, headers: headers)
  end

  def post(url, body, headers = nil)
    @output = post_request(url, body: body, headers: headers)
  end

  def delete(url, headers = nil)
    @output = delete_request(url, headers: headers)
  end

  def put(url, body)
    @output = put_request(url, body: body)
  end

  def patch(url, body)
    @output = patch_request(url, body: body)
  end

  def status
    @output.code.to_i
  end

  def body
    if [200, 201, 204].include? status
      JSON.parse(@output.body)
    else
      JSON.parse(@output.message)
    end
  end

end