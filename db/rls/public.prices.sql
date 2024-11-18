ALTER TABLE public.prices ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Everyone can view prices"
ON public.prices
FOR SELECT
TO authenticated, anon
USING (TRUE);
