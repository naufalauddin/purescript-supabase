'use client'
import { useUser } from "@supabase/auth-helpers-react";
import { createBrowserClient as createBrowserSupabaseClient } from "@supabase/ssr";

export const useUserImpl = useUser;


export const createBrowserClientInternal = (url, key) => createBrowserSupabaseClient(url, key);

export const createBrowserClientWithOptionsInternal = (url, key, options) => () =>
  createBrowserSupabaseClient(url, key, options);
