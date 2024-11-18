ALTER TABLE public.deathwish_default ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Everyone can view deathwish_default"
ON public.deathwish_default
FOR SELECT
TO authenticated, anon
USING (TRUE);
