ALTER TABLE public.benefactors ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can CRUD benefactors from their deathwishes"
ON public.benefactors
fOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM orders
    WHERE deathwish_custom.id = benefactors.deathwish_id
    AND deathwish_custom.user_id = auth.uid()
  )
);
