create function log_insurance_status_change()
returns trigger as $$
begin
    if new.monthly_payment_amount is not null then
        insert into insurance_status_changes (user_id, status, monthly_payment_amount)
        values (new.id, new.status, new.monthly_payment_amount);
    else
        insert into insurance_status_changes (user_id, status)
        values (new.id, new.status);
    end if;
    return new;
end;
$$ language plpgsql;
