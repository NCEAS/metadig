## Metadata Quality Engine API

### Summary

The API will allow clients to interact with the MQE using published methods either directly
or via a REST layer.

### Types
- Selector
- Check
- Recommendation
- Result
- Run

### Design methods
#### Checks
- MQE.listChecks()
- MQE.createCheck()
- MQE.getCheck()
- MQE.updateCheck()
- MQE.deleteCheck()

#### Recommendations
- MQE.listRecommendations()
- MQE.createRecommendation()
- MQE.getRecommendation()
- MQE.updateRecommendation()
- MQE.deleteRecommendation()

### Execution methods
- MQE.runRecommendations(List<Identifier> pids, List<Recommendation> recs)

### Reporting methods
- MQE.listRuns()
- MQE.getRun()
- MQE.deleteRun()
