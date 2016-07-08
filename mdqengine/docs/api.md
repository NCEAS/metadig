## Metadata Quality Engine API

### Summary

The API will allow clients to interact with the MQE using published methods either directly
or via a REST layer.

### Types
- Selector
- Check*
- Suite*
- Result
- Run* 

*stand-alone document format type

### Design methods
#### Checks
- MQE.listChecks()
	- GET /checks
- MQE.createCheck()
	- POST /checks/:id
- MQE.getCheck()
	- GET /checks/:id
- MQE.updateCheck()
	- PUT /checks/:id
- MQE.deleteCheck()
	- DELETE /checks/:id

#### Suites
- MQE.listSuites()
	- GET /suites
- MQE.createSuite()
	- POST /suites/:id
- MQE.getSuite()
	- GET /suites/:id
- MQE.updateSuite()
	- PUT /suites/:id
- MQE.deleteSuite()
	- DELETE /suites/:id

### Execution methods
- MQE.runSuite(Suite suite, InputStream document)
	- POST /suites/:id/runs/:pid

### Reporting methods
- MQE.listRuns()
	- GET /runs
- MQE.getRun()
	- GET /runs/:id
- MQE.deleteRun()
	- DELETE /runs/:id
