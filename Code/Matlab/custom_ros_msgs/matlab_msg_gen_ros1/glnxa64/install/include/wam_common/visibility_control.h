#ifndef WAM_COMMON__VISIBILITY_CONTROL_H_
#define WAM_COMMON__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define WAM_COMMON_EXPORT __attribute__ ((dllexport))
    #define WAM_COMMON_IMPORT __attribute__ ((dllimport))
  #else
    #define WAM_COMMON_EXPORT __declspec(dllexport)
    #define WAM_COMMON_IMPORT __declspec(dllimport)
  #endif
  #ifdef WAM_COMMON_BUILDING_LIBRARY
    #define WAM_COMMON_PUBLIC WAM_COMMON_EXPORT
  #else
    #define WAM_COMMON_PUBLIC WAM_COMMON_IMPORT
  #endif
  #define WAM_COMMON_PUBLIC_TYPE WAM_COMMON_PUBLIC
  #define WAM_COMMON_LOCAL
#else
  #define WAM_COMMON_EXPORT __attribute__ ((visibility("default")))
  #define WAM_COMMON_IMPORT
  #if __GNUC__ >= 4
    #define WAM_COMMON_PUBLIC __attribute__ ((visibility("default")))
    #define WAM_COMMON_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define WAM_COMMON_PUBLIC
    #define WAM_COMMON_LOCAL
  #endif
  #define WAM_COMMON_PUBLIC_TYPE
#endif
#endif  // WAM_COMMON__VISIBILITY_CONTROL_H_
// Generated 22-Apr-2022 13:44:17
// Copyright 2019-2020 The MathWorks, Inc.
