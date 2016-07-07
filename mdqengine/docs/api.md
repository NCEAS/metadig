## Metadata Quality Engine API

### Summary

The API will allow clients to interact with the MQE using published methods either directly
or via a REST layer.

### Types
- Selector
- Check
- Suite*
- Result
- Run* 

*stand-alone document format type

### Design methods
#### Checks (TBD: separate document type for these?)
- MQE.listChecks()
- MQE.createCheck()
- MQE.getCheck()
- MQE.updateCheck()
- MQE.deleteCheck()

#### Suites
- MQE.listSuites()
	- D1.query()
	- D1.listObjects()
- MQE.createSuite()
	- D1.create()
- MQE.getSuite()
	- D1.get()
- MQE.updateSuite()
	- D1.update()
- MQE.deleteSuite()
	-D1.delete()

### Execution methods
- MQE.runSuite(Suite suite, InputStream document)

### Reporting methods
- MQE.listRuns()
	- D1.query()
- MQE.getRun()
	- D1.get()
- MQE.deleteRun()
	- D1.delete()
