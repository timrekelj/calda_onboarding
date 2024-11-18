ALTER TABLE public.user_data ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can CRUD user_data"
ON public.user_data
fOR ALL
TO authenticated
USING (auth.uid() IS NOT NULL);
