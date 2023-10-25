CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS project_definitions (
  "uuid" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "teacher_uuid" UUID NOT NULL,
  "title" VARCHAR(255) UNIQUE NOT NULL,
  "description" VARCHAR(1000) NOT NULL
);

CREATE TABLE IF NOT EXISTS definition_attatchments (
  "uuid" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "project_definition" UUID NOT NULL,
  CONSTRAINT fk_definition_attatchments_project_definitions
	  FOREIGN KEY ("project_definition")
	    REFERENCES project_definitions (uuid),
  "name" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS project_implementations (
  "uuid" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "project_definition" UUID NOT NULL,
  CONSTRAINT fk_project_implementations_definition_attatchments
	  FOREIGN KEY ("project_definition")
	    REFERENCES project_definitions (uuid),
  "description" VARCHAR(10000) NOT NULL,
  "status" BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS project_implementation_has_users  (
  "uuid" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "project_implementation_uuid" UUID NOT NULL,
  CONSTRAINT fk_project_implementation_has_users_project_implementations
	  FOREIGN KEY ("project_implementation_uuid")
	    REFERENCES  project_implementations (uuid),
  "user_uuid" UUID NOT NULL,
  UNIQUE("project_implementation_uuid", "user_uuid")
);

CREATE TABLE IF NOT EXISTS project_implementation_reviews (
  "uuid" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "project_implementation_uuid" UUID NOT NULL,
  CONSTRAINT fk_project_implementations_reviews_project_implementations
	  FOREIGN KEY ("project_implementation_uuid")
	    REFERENCES project_implementations (uuid),
  "author_uuid" UUID,
  "score" DECIMAL NOT NULL,
  UNIQUE("project_implementation_uuid", "author_uuid")
);
