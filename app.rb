require_relative 'squadbook'
require_relative 'controller'
require_relative 'router'

csv_file   = File.join(__dir__, 'players.csv')
squadbook   = Squadbook.new(csv_file)
controller = Controller.new(squadbook)

router = Router.new(controller)

# Start the app
router.run
