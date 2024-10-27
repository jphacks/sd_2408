package http

import (
	"github.com/labstack/echo/v4"
		"net/http"
	"server/model"
"strings"
"server/db"
	"os"
	"io"
	"strconv"
)

func Posts(e *echo.Echo){
	e.POST("/post/user", postUser)
	e.POST("/post/group", postGroup)
	e.POST("/post/image", postImage)
	e.POST("/post/group/message", postGroupMessage)
	e.POST("/post/direct_message", postDirectMessage)
	e.POST("post/hashtag", postHashtag)
}

func postUser(c echo.Context) error {
	name := c.FormValue("name")
	email := c.FormValue("email")
	birthday, err := strconv.Atoi(c.FormValue("birthday"))
	if err != nil {
		return c.JSON(http.StatusBadRequest, echo.Map{"message": "Invalid birthday format"})
	}

	password := c.FormValue("password")
	place := c.FormValue("place")
	githubURL := c.FormValue("githubURL")
	selfIntro := c.FormValue("selfIntro")
	preference := c.FormValue("preference")

	groupIDsStr := c.FormValue("groupIDs")
	groupIDs := []int{}

	if groupIDsStr != "" {
		for _, idStr := range strings.Split(groupIDsStr, ",") {
			id, err := strconv.Atoi(strings.TrimSpace(idStr))
			if err != nil {
				return c.JSON(http.StatusBadRequest, echo.Map{"message": "Invalid group ID format"})
			}
			groupIDs = append(groupIDs, id)
		}
	}

	icon, err := c.FormFile("icon")
	if err != nil {
		return c.JSON(http.StatusBadRequest, echo.Map{"message": "Failed to get icon"})
	}

	src, err := icon.Open()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to open icon"})
	}
	defer src.Close()

	dst, err := os.Create(icon.Filename)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to create icon file"})
	}
	defer dst.Close()

	if _, err = io.Copy(dst, src); err != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to save icon"})
	}

	image := model.Image{
		FilePath: icon.Filename,
	}

	user := model.User{
		Name:        name,
		Birthday:    birthday,
		Email:       email,
		Password:    password, // TODO: パスワードをハッシュ化
		Place:       place,
		GithubURL:   githubURL,
		SelfIntro:   selfIntro,
		Image:       image,
		Preference:  preference,
		GroupIDs:    groupIDs,
	}

	result := db.SaveUser(c, &user); if result != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to create user"})
	}

	return c.JSON(http.StatusOK, user)
}


func postGroup(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func postImage(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func postGroupMessage(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func postDirectMessage(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func postHashtag(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}
