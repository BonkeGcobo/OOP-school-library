require './app'

class Main
  def main
    app = App.new
    app.run
  end
end

start = Main.new
start.main
