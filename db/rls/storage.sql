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
