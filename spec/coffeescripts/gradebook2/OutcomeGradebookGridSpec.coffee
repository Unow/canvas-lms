define [
  'compiled/gradebook2/OutcomeGradebookGrid'
], (Grid) ->

  module 'OutcomeGradebookGrid'

  test 'Grid.Math.mean', ->
    subject = [1,1,2,4,5]
    ok Grid.Math.mean(subject) == 2.6, 'returns a proper average'
    ok Grid.Math.mean(subject, true) == 3, 'optionally rounds result value'
    ok Grid.Math.mean([5,12,2]) == 6.33, 'rounds to two places'

  test 'Grid.Math.median', ->
    odd  = [1,3,2,5,4]
    even = [1,3,2,6,5,4]
    ok Grid.Math.median(odd) == 3, 'properly finds median on odd datasets'
    ok Grid.Math.median(even) == 3.5, 'properly finds median on even datasets'

  test 'Grid.Math.mode', ->
    single   = [1,1,1,3,5]
    multiple = [1,1,2,2,3,5]
    ok Grid.Math.mode(single) == 1, 'returns mode when it is a single node'
    ok Grid.Math.mode(multiple) == 2, 'averages multiple modes to return a single result'

  test 'Grid.View.masteryClassName', ->
    outcome = { mastery_points: 5 }
    ok Grid.View.masteryClassName(5, outcome) == 'mastery', 'returns "mastery" if equal to mastery score"'
    ok Grid.View.masteryClassName(7, outcome) == 'mastery', 'returns "mastery" if above mastery score"'
    ok Grid.View.masteryClassName(3, outcome) == 'near-mastery', 'returns "near-mastery" if half of mastery score or greater'
    ok Grid.View.masteryClassName(1, outcome) == 'remedial', 'returns "remedial" if less than half of mastery score'
