package main

import (
	// "net/http"
	"os"
	"fmt"
	"log"

	hserver "server/http"
	// dserver "server/db"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func main() {
	e := echo.New()
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	dbUser := os.Getenv("DB_USER")
    dbPassword := os.Getenv("DB_PASSWORD")
    dbHost := os.Getenv("DB_HOST")
    dbPort := os.Getenv("DB_PORT")
    dbName := os.Getenv("DB_NAME")
    dbCharset := os.Getenv("DB_CHARSET")
    dbParseTime := os.Getenv("DB_PARSE_TIME")
    dbLoc := os.Getenv("DB_LOC")

    // DSNを構築
    dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=%s&loc=%s",
        dbUser,
        dbPassword,
        dbHost,
        dbPort,
        dbName,
        dbCharset,
        dbParseTime,
        dbLoc,
    )
    var err error
    DB, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
    if err != nil {
        log.Fatalf("Failed to connect to database: %v", err)
    }

	e.Logger.Fatal(e.Start(":1323"))
}

func routing(e *echo.Echo){
	hserver.Posts(e)
	hserver.Gets(e)
	hserver.Puts(e)
	hserver.Deletes(e)
}
