import { createClient } from "jsr:@supabase/supabase-js@2"

console.log("Started the validate_answers function")

const SUPABASE_URL = Deno.env.get("SUPABASE_URL") || "";
const SUPABASE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || "";
const SUPABASE_CLIENT = createClient(SUPABASE_URL, SUPABASE_KEY);

interface Answers {
    user_id: string;
    full_name: string;
    height: number;
    weight: number;
    smoker: boolean;
}


Deno.serve(async (req) => {
    if (req.method !== "POST") {
        return new Response(
            '{ "error": "Method Not Allowed" }',
            {
                headers: { "Content-Type": "application/json" },
                status: 405
            }
        )
    }

    const requestBody = await req.json()
    const answers = requestBody["answers"]
    if (!answers.user_id || !answers.full_name || !answers.height || !answers.weight || !answers.smoker) {
        return new Response(
            '{ "error": "Answers are incomplete" }',
            {
                headers: { "Content-Type": "application/json" },
                status: 400
            }
        )
    }

    if (/\d/.test(answers.full_name)) {
        return new Response(
            '{ "error": "Full name must not contain numbers" }',
            {
                headers: { "Content-Type": "application/json" },
                status: 400
            }
        )
    }

    if (answers.height <= 0 || answers.weight <= 0 || !Number.isInteger(answers.height) || !Number.isInteger(answers.weight)) {
        return new Response(
            '{ "error": "Height and weight must be positive number" }',
            {
                headers: { "Content-Type": "application/json" },
                status: 400
            }
        )
    }

    if (typeof answers.smoker !== "boolean") {
        return new Response(
            '{ "error": "Smoker value must be a boolean" }',
            {
                headers: { "Content-Type": "application/json" },
                status: 400
            }
        )
    }

    const { error } = await SUPABASE_CLIENT.from("answers").insert([
        {
            user_id: answers.user_id,
            full_name: answers.full_name,
            height: answers.height,
            weight: answers.weight,
            smoker: answers.smoker
        }
    ])

    if (error) {
        console.error("Failed to insert answers", error)
        return new Response(
            '{ "error": "Failed to insert answers" }',
            {
                headers: { "Content-Type": "application/json" },
                status: 500
            }
        )
    }

    return new Response(
        '{ "message": "Answers validated and inserted" }',
        { headers: { "Content-Type": "application/json" } },
    )
})
