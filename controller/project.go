package controller

import (
	"com/example/model"
	"context"
	"time"
)

func (ctrl *Controller) CreateProjectDEF(req model.ReqProjectDEF) error {

	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	query := "INSERT INTO project_definitions (teacher_uuid, title, description) VALUES ($1, $2, $3)"

	_, err := ctrl.DB.ExecContext(ctx, query, req.Teacher_uuid, req.Title, req.Description)
	if err != nil {
		return err
	}

	return nil
}
