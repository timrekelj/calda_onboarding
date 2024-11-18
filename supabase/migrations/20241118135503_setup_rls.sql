ALTER TABLE public.answers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can CRUD their answers"
ON public.answers
FOR ALL
TO authenticated
USING ((SELECT auth.uid()) = user_id);

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

ALTER TABLE public.deathwish_custom ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can CRUD their deathwish_custom"
ON public.deathwish_custom
fOR ALL
TO authenticated
USING ((SELECT auth.uid()) = user_id);

ALTER TABLE public.deathwish_default ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Everyone can view deathwish_default"
ON public.deathwish_default
FOR SELECT
TO authenticated, anon
USING (TRUE);

ALTER TABLE public.insurance_status_changes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their insurance_status_changes"
ON public.insurance_status_changes
FOR ALL
TO authenticated
USING ((SELECT auth.uid()) = user_id);

ALTER TABLE public.prices ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Everyone can view prices"
ON public.prices
FOR SELECT
TO authenticated, anon
USING (TRUE);

CREATE POCREATE POLICY "Allow authenticated uploads"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'profile_pictures' AND
  (storage.foldername(name))[1] = (select auth.uid()::text)
);

CREATE POLICY "Allow authenticated uploads"
ON storage.objects
FOR SELECT
TO authenticated
WITH CHECK (bucket_id = 'deathwish_thumbnails');

ALTER TABLE public.user_data ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Authenticated users can CRUD user_data"
ON public.user_data
fOR ALL
TO authenticated
USING (auth.uid() IS NOT NULL);
