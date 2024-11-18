ALTER TABLE public.insurance_status_changes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their insurance_status_changes"
ON public.insurance_status_changes
FOR ALL
TO authenticated
USING ((SELECT auth.uid()) = user_id);
