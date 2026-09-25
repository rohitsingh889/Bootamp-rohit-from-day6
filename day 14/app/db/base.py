from sqlalchemy.orm import DeclarativeBase


class Base(DeclarativeBase):
    pass



# Table Creation using SQLAlchemy

# If the PostgreSQL table does not already exist,
# SQLAlchemy can create it from the registered models.
#
# from app.db.session import engine
# from app.models.employee import Employee
#
# Base.metadata.create_all(bind=engine)
#
# NOTES:
# create_all() creates missing tables only.
# It does not modify/alter an existing table structure.
# For production schema changes, use Alembic migrations.
