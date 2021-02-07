var config = {
	database: {
		host:	  'TEMPLATE_DB_HOST', 	// database host
		user: 	  'TEMPLATE_DB_USER', 		// your database username
		password: 'TEMPLATE_DB_PASSWORD', 		// your database password
		port: 	  TEMPLATE_DB_PORT, 		// default MySQL port
		db: 	  'TEMPLATE_DB_DATABASE' 		// your database name
	},
	server: {
		host: '127.0.0.1',
		port: '3000'
	}
}

module.exports = config
