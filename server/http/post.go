package http

import (
	"github.com/labstack/echo/v4"
)

func Posts(e *echo.Echo){
	e.POST("/post/user", postUser)
	e.POST("/post/group", postGroup)
	e.POST("/post/image", postImage)
	e.POST("/post/group/message", postGroupMessage)
	e.POST("/post/direct_message", postDirectMessage)
	e.POST("post/hashtag", postHashtag)
}
