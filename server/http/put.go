package http

import(
		"github.com/labstack/echo/v4"
)

func Puts(e *echo.Echo){
	e.PUT("/put/user", putUser)
	e.PUT("/put/group", putGroup)
}
