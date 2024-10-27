package main

import (
	"fmt"
	"log"
	"os"

	"server/http"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"server/db"
	"server/model"
)



func main() {
	err := godotenv.Load()
	if err != nil {
		log.Println("No .env file found. Using environment variables.")
	}

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

	var dbErr error
	db.DB, dbErr = gorm.Open(mysql.Open(dsn), &gorm.Config{})

	if dbErr != nil {
		log.Fatalf("Failed to connect to database: %v", dbErr)
	}

	db.DB.AutoMigrate(
		&model.User{},
	  &model.Group{},
	  &model.Message{},
		&model.DirectMessage{},
		&model.HashTag{},
	)

	routing(e)
	e.Logger.Fatal(e.Start(":1323"))
}

func routing(e *echo.Echo){
	http.Posts(e)
	http.Gets(e)
	http.Puts(e)
	http.Deletes(e)
}
