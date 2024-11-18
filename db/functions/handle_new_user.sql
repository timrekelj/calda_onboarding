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
