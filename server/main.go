package main

import (
	"fmt"
	"log"
	"os"

	hserver "server/http"
	"github.com/joho/godotenv" // godotenvをインポート
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func main() {
	// .envファイルをロード
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
	var dbErr error
	DB, dbErr = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if dbErr != nil {
		log.Fatalf("Failed to connect to database: %v", dbErr)
	}

	// ルーティングの設定
	routing(e)

	e.Logger.Fatal(e.Start(":1323"))
}

func routing(e *echo.Echo){
	hserver.Posts(e)
	hserver.Gets(e)
	hserver.Puts(e)
	hserver.Deletes(e)
}
