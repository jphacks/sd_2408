package http

import (
	"net/http"
	// "server/model"

	"github.com/labstack/echo/v4"
)

func Gets(e *echo.Echo){
	e.GET("/get/user", getUser)
	e.GET("/get/group", getGroup)
	e.GET("/get/image", getImage)
	e.GET("/get/message", getMessage)
	e.GET("/get/direct_message", getDirectMessage)
	e.GET("/get/hashtag", getHashtag)
}

func getUser(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func getGroup(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func getImage(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func getMessage(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func getDirectMessage(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func getHashtag(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}
