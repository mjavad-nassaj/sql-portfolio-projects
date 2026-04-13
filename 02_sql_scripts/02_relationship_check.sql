USE gtfs_berlin;
DESCRIBE 
	agency;
DESCRIBE 
	calendar;
DESCRIBE 
	calendar_dates;
DESCRIBE 
	frequencies;
DESCRIBE 
	levels;    
DESCRIBE 
	pathways;    
DESCRIBE 
	routes;
DESCRIBE 
	shapes;
DESCRIBE 
	stop_times;
DESCRIBE 
	stops;
DESCRIBE 
	transfers;
DESCRIBE 
	trips;
    
-- routes.route_id <----> trips.route_id
-- trips.trip_id <----> stop_times.trip_id
-- stop_times.stop_id <----> stops.stop_id
-- trips.service_id <----> calendar.service_id
-- trips.service_id <----> calendar_dates.service_id
-- trips.shape_id <----> shapes.shape_id
-- trips.trip_id <----> frequencies.trip_id
-- levels.level_id <----> stops.level_id
-- pathways.from_stop_id <----> stops.stop_id
-- pathways.to_stop_id <----> stops.stop_id
-- transfers.from_stop_id <----> stops.stop_id
-- transfers.to_stop_id <----> stops.stop_id
-- agency.agency_id <----> routes.agency_id