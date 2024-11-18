CREATE POLICY "Users can CRUD their profile images"
ON storage.objects
FOR ALL
TO authenticated
WITH CHECK (
  bucket_id = 'profile_pictures' AND
  (storage.foldername(name))[1] = (select auth.uid()::text)
);

CREATE POLICY "Everyone can view thumbnails"
ON storage.objects
FOR SELECT
TO authenticated, anon
USING (bucket_id = 'deathwish_thumbnails');
