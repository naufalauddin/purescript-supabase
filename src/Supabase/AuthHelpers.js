'use client'
import { useUser } from "@supabase/auth-helpers-react";
import { createBrowserClient as createBrowserSupabaseClient } from "@supabase/ssr";

export const useUserImpl = useUser;


export const createBrowserClient = () => createBrowserSupabaseClient();

export const createBrowserClientWithOptionsInternal = (options) => () =>
  createBrowserSupabaseClient(options);
