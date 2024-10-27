package http

import (
	"net/http"
	"server/model"
	"server/db"
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

func getUser(c echo.Context) error {
	email := c.FormValue("email")
	password := c.FormValue("password")

	var user model.User

	// DBからユーザーを取得
	if err := db.GetUser(c, email, password, &user); err != nil {
		return err // すでにエラーメッセージが含まれている
	}

	return c.JSON(http.StatusOK, user) // ユーザー情報を返す
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
