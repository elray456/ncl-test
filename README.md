Did not have time to finish the UI, unit tests, and exceptions for different HTTP responses.

Unit tests should include more tests on different states the application can run into.

BLoC pattern is a little bit overkill for this application. Could have used Provider or Cubits. But
wanted to demonstrate how I would approach or what would I use when developing a large scale application.

Also, the application could be condensed a bit. The cruises, SKY, ESCAPE and BLISS share same data
from the fetched JSON. So the models, maybe even blocs, could be condensed together. I took the
liberty to assume that certain cruises might have different data about them displayed in a bigger
application. Therefore, I separated them.