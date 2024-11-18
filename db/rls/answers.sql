ALTER TABLE public.answers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can CRUD their answers"
ON public.answers
FOR ALL
TO authenticated
USING ((SELECT auth.uid()) = user_id);
