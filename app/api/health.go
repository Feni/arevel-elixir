package api

import "github.com/gin-gonic/gin"

func HealthView(c *gin.Context) {
	c.JSON(200, gin.H{
		"status": "OK",
	})
}
