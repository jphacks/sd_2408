package main

import (
	"net/http"
	_ "server/http"
	_ "server/db"
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})
	e.Logger.Fatal(e.Start(":1323"))
}

// func rooting(e *echo.Echo){
// 	e.GET("/get/user", getUser)
// 	e.POST("/post/message", postMessage)
// 	e.PUT("/put/user", putUser)
// 	e.DELETE("/delete/message", deleteMessage)
// }

// //下の感じのやつをhttpの下にあるファイルにそれぞれ記述していく

// func getUser(c echo.Context)error{
// 	data := c.QueryParam("name")
// 	//...

// }
