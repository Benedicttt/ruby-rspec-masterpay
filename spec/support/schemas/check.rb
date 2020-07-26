class Schema
  def check(errors, response, params)
    unless errors.empty?
      print "#{color("Params with request:\n" + params.to_s, 'green')}"
      print "\n#{color("In response:\n" + response, 'yellow')}, \nparams:"
      response = OpenStruct.new(symbolize response.body)

      errors.each do |key, value|
        puts "\t#{color(key.to_s, :red)} #{value} but was #{color(response.send(key).to_s, :green)}\n\n"
      end

      raise "\nCorrect please that is true"
    end
  end
end