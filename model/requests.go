package model

// projectDEF

type ReqProjectDEF struct {
	Teacher_uuid string `json:"teacher_uuid" validate:"required"`
	Title        string `json:"title" validate:"required"`
	Description  string `json:"description" validate:"required"`
}
