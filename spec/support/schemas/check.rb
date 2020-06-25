class Schema
  def check(errors, response)
    unless errors.empty?
      puts "#{color('In response ' + response, 'yellow')}, \nparams:"
      response = OpenStruct.new(symbolize response.body)

      errors.each do |key, value|
        print "#{color(key.to_s, :red)} #{value} but was #{color(response.send(key).to_s, :green)}\n"
      end

      raise "\nCorrect please that is true"
    end
  end
end