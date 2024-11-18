CREATE FUNCTION log_insurance_status_change()
RETURNS TRIGGER AS $$
BEGIN
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
