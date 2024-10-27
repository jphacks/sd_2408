package http

import(
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
