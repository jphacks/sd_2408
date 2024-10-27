package http

import (
	"github.com/labstack/echo/v4"
		"net/http"
	// model "server/model"

	// "os"
	// "io"
	// "strconv"
)

func Posts(e *echo.Echo){
	e.POST("/post/user", postUser)
	e.POST("/post/group", postGroup)
	e.POST("/post/image", postImage)
	e.POST("/post/group/message", postGroupMessage)
	e.POST("/post/direct_message", postDirectMessage)
	e.POST("post/hashtag", postHashtag)
}

func postUser(c echo.Context)error{
		return c.String(http.StatusOK, "test")

	// name := c.FormValue("name")
	// email := c.FormValue("email")
	// birthday, err := strconv.Atoi(c.FormValue("birthday"))

	// if err != nil {
	// 	//ここの処理を書いて
	// }

	// password := c.FormValue("password")
	// place := c.FormValue("place")
	// githubURL := c.FormValue("githubURL")
	// selfIntro := c.FormValue("selfIntro")
	// preference := c.FormValue("preference")

	// // followIDs := c.FormValue("followIDs")
	// // groupIDs := c.FormValue("groupIDs")
	// // directMessageIDs := c.FormValue("directMessageIDs")

	// icon, err := c.FormFile("icon")
	// if err != nil {
	// 	//ここのエラー処理を書いて
	// }

	// src, err := icon.Open()
	// if err != nil{
	// 	//ここのエラー処理を書いて
	// }
	// defer src.Close()

	// dst, err := os.Create(icon.Filename)
	// if err != nil{
	// 	//ここのエラー処理を書いて
	// }
	// defer dst.Close()

	// if _, err = io.Copy(dst, src); err != nil {
	//     //ここのエラー処理を書いて
	// }

	// image := model.Image{
	// 	FilePath: icon.Filename,
	// }

	// user := model.User{//TODO PASSWORDをハッシュ関数で暗号化
	// 	Name: name,
	// 	Birthday: birthday,
	// 	Email: email,
	// 	Password: password,
	// 	Place: place,
	// 	GithubURL: githubURL,
	// 	SelfIntro: selfIntro,
	// 	Image: image,
	// 	Preference: preference,
	// 	//TODO listを含むやつを取得できるようにする
	// }



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
