package main

import (
	"net/http"
	server "server/http"
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

func routing(e *echo.Echo){
	server.Posts(e)
	server.Gets(e)
	server.Puts(e)
	server.Deletes(e)
}
