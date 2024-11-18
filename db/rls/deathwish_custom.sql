ALTER TABLE public.deathwish_custom ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can CRUD their deathwish_custom"
ON public.deathwish_custom
fOR ALL
TO authenticated
USING ((SELECT auth.uid()) = user_id);
