package router

import (
	"com/example/controller"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
)

type Router struct {
	*gin.Engine
	ctrl      *controller.Controller
	validator *validator.Validate
}

func SetupRouter(ctrl *controller.Controller) Router {

	var r Router
	r.Engine = gin.Default()
	r.ctrl = ctrl
	r.validator = validator.New()

	// routes

	base := r.Group("/api/v1")

	// project

	project := base.Group("/project")
	project.POST("/create", r.CreateProjectDEF)

	return r
}
