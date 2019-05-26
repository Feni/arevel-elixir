package app

import "github.com/gin-gonic/gin"

// Start sets up and starts the web server portion
func Start() {
	engine := gin.New()
	SetupRouter(engine)
	engine.Run("localhost:8080") // listen and serve on 0.0.0.0:8080
}
