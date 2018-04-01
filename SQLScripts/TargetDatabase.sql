
-- Target Database

use TargetDatabase;

drop table if exists dbo.TestTable1;

create table dbo.TestTable1(
RecordId int not null identity(1,1),
DisplayName varchar(50) not null,
SortOrder int NULL
);

go

create or alter procedure dbo.GetTestTable1 (
@RecordId int
)
as

select RecordId, DisplayName
from dbo.TestTable1
where RecordId = @RecordId;

go

-- Objects not in Source - To Drop

drop table if exists dbo.TableToDrop;

create table dbo.TableToDrop(
RecordId int not null identity(1,1),
DisplayName varchar(50) not null,
SortOrder int NULL
);
go
create or alter procedure dbo.ProcToDrop
as

select 1;
go

create or alter view dbo.ViewToDrop
as

select * 
from dbo.TableToDrop;
go

-- Objects to alter

go
create or alter procedure dbo.ProcToAlter
as

select 1, 2;
go

create or alter view dbo.ViewToAlter
as

select RecordId, DisplayName, SortOrder 
from dbo.TableToDrop;
go

drop function if exists dbo.FunctionToAlter;
go
create or alter function dbo.FunctionToAlter(@inputText varchar(50))
returns bit
as

begin
	return 1;
end
go--