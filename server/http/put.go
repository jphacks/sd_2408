package http

import(
	"github.com/labstack/echo/v4"
	// "server/model"
	"net/http"
)

func Puts(e *echo.Echo){
	e.PUT("/put/user", putUser)
	e.PUT("/put/group", putGroup)
}

func putUser(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}

func putGroup(c echo.Context)error{
	return c.String(http.StatusOK, "test")
}
