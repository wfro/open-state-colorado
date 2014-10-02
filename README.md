Select issues you care about and be notified of open bills in the Colorado state legislature.

Iterations (10/2, 10/6, 10/9, 10/13, 10/16)

## 10/13 - Bill interface and notifications complete

#### Need:

- Users have associated issues
- Users can be notified of bills related to their issues that are open for voting
- Users can see a list of bills related to their issues through a web interface
- Invididual bills can be viewed with a list of sponsors
- There are easy/obvious ways to contact relevent legislators

#### Want:

- Users can bookmark bills and legislators
- Users can see legislators by district
- Legislators are displayed with donors
- Users can use a web interface to view a general list of bills and filter by issues

#### "Ship is actively sinking" protocol:

- Notification system is a priority


## 10/9 - Email notification complete

#### Need:

- Email notifications working
- In email:
  - basic bill information
  - link to official documentation
  - list of sponsors and contact information
- It remembers which bills a user has been previously notified of

#### Want:

- Web interface for viewing bills that have been bookmarked for a user
- Show legislators by district
- Users can view individual legislators with contact information
- Users can email legislators via modal

#### "Ship is actively sinking" protocol:

- Bill information in the notification itself is the priority
- If this is behind, ditch sponsors/contact info in bill until next iteration

## 10/6 - Generate bills for users

#### Need:

- Users can select issues
- We can find relevant data (bills) based on those issues

#### Want:

- Some background jobs in place for API calls
- It notifies a user via email of currently open bills

## 10/2 - Authentication working and tested

#### Need

- User can sign in via facebook
- Application can remember user past browser close
- At least a few decent functioning tests
- Basic page layout

#### Want

- Set up proper environment variables for api keys
- Be able to retrieve data from the Open States API from within the application








