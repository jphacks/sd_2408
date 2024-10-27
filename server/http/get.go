package http

import (
	"net/http"
	"server/model"
	"server/db"
	"github.com/labstack/echo/v4"
	"strconv"
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

	if err := db.GetUser(c, email, password, &user); err != nil {
		return err
	}

	return c.JSON(http.StatusOK, user)
}



func getGroup(c echo.Context) error {
	groupIDStr := c.QueryParam("groupID")
	groupID, err := strconv.Atoi(groupIDStr)
	if err != nil {
		return c.JSON(http.StatusBadRequest, echo.Map{"message": "Invalid group ID format"})
	}

	var group model.Group
	if err := db.GetGroup(c, groupID, &group); err != nil {
		return err
	}

	return c.JSON(http.StatusOK, group)
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
