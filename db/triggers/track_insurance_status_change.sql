create trigger track_insurance_status_change
after update on user_data
for each row
execute function log_insurance_status_change();
