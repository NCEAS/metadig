## Metadata Quality Engine API

### Summary

The API will allow clients to interact with the MQE using published methods either directly
or via a REST layer.

### Types
- Selector
- Check
- Recommendation*
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

#### Recommendations
- MQE.listRecommendations()
	- D1.query()
	- D1.listObjects()
- MQE.createRecommendation()
	- D1.create()
- MQE.getRecommendation()
	- D1.get()
- MQE.updateRecommendation()
	- D1.update()
- MQE.deleteRecommendation()
	-D1.delete()

### Execution methods
- MQE.runRecommendations(List<Identifier> pids, List<Recommendation> recs)

### Reporting methods
- MQE.listRuns()
	- D1.query()
- MQE.getRun()
	- D1.get()
- MQE.deleteRun()
	- D1.delete()
