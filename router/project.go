package router

import (
	"com/example/model"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func (r *Router) CreateProjectDEF(ctx *gin.Context) {
	// validate

	var req model.ReqProjectDEF
	if err := ctx.BindJSON(&req); err != nil {
		ctx.AbortWithStatusJSON(http.StatusBadRequest, model.MsgBadRequest())
		return
	}

	if err := r.validator.Struct(req); err != nil {
		ctx.JSON(http.StatusBadRequest, model.MsgValidationErr(err.Error()))
		return
	}

	if err := r.ctrl.CreateProjectDEF(req); err != nil {
		log.Println(err)
		ctx.AbortWithStatusJSON(http.StatusBadRequest, model.MsgIntServerErr())
		return
	}

	ctx.JSON(http.StatusOK, gin.H{"msg": "Project definition created"})
}
