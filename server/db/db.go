package db

import(
	"server/model"
	"gorm.io/gorm"
	"github.com/labstack/echo/v4"
	"net/http"
)

var DB *gorm.DB

func SaveUser(c echo.Context ,user *model.User)error{

	if result := DB.Create(user); result.Error != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to create user"})
	}
	return c.JSON(http.StatusOK, user)
}

func GetUser(c echo.Context, email string, password string, user *model.User) error {
	if result := DB.Where("email = ? AND password = ?", email, password).First(user); result.Error != nil {
		if result.Error == gorm.ErrRecordNotFound {
			return c.JSON(http.StatusNotFound, echo.Map{"message": "User not found"})
		}
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to retrieve user"})
	}
	return nil
}


func SaveGroup(c echo.Context, group *model.Group) error {
	if result := DB.Create(group); result.Error != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to create group"})
	}
	return c.JSON(http.StatusOK, "success savegroup db")
}


func GetGroup(c echo.Context, groupID int, group *model.Group) error {
	if result := DB.Preload("Users").Preload("Messages").First(group, groupID); result.Error != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"message": "Failed to retrieve group"})
	}
	return nil
}
