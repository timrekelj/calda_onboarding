-- Insert a row into public.profiles
CREATE FUNCTION handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER SET search_path = ''
AS $$
BEGIN
  INSERT INTO public.user_data (id, name)
  VALUES (new.id, new.name);
  RETURN new;
END;
$$;

CREATE FUNCTION log_insurance_status_change()
RETURNS TRIGGER AS $$
BEGINEND
  IF new.monthly_payment_amount IS NOT NULL THEN
    INSERT INTO insurance_status_changes (user_id, status, monthly_payment_amount)
    VALUES (new.id, new.status, new.monthly_payment_amount);
  ELSE
    INSERT INTO insurance_status_changes (user_id, status)
    VALUES (new.id, new.status);
  END IF;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;
