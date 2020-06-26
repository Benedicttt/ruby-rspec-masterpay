class Schema
  def check(errors, response, params)
    unless errors.empty?
      print "\n\n#{color('Params with request ' + params.to_s, 'gray')}\n"
      print "\n\n#{color('In response ' + response, 'yellow')}, \nparams:"
      response = OpenStruct.new(symbolize response.body)

      errors.each do |key, value|
        puts "\t#{color(key.to_s, :red)} #{value} but was #{color(response.send(key).to_s, :green)}\n\n"
      end

      raise "\nCorrect please that is true"
    end
  end
end