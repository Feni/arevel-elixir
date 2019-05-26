package app

import (
	"arevel/app/api"

	"github.com/gin-gonic/gin"
)

// SetupRouter creates a router without any middleware by default
func SetupRouter(router *gin.Engine) {
	// Default middlewares
	router.Use(gin.Logger())
	router.Use(gin.Recovery())

	// Statics
	// TODO: Path when packaged?
	// router.Static("/assets", "../assets")

	// Browser group
	browser_group := router.Group("/")
	{
		browser_group.GET("/", views.LandingView)
	}

	// API group
	api_group := router.Group("/api")
	{
		api_group.GET("/_health", api.HealthView)
	}
}
