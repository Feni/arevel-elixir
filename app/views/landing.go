package views

import "github.com/gin-gonic/gin"

func LandingView(c *gin.Context) {
	c.JSON(200, gin.H{
		"status": "landing",
	})
}
