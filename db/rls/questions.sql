ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Everyone can view questions"
ON public.questions
FOR SELECT
TO authenticated, anon
USING (TRUE);
