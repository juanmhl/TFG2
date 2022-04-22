#ifndef WAM_MSGS__VISIBILITY_CONTROL_H_
#define WAM_MSGS__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define WAM_MSGS_EXPORT __attribute__ ((dllexport))
    #define WAM_MSGS_IMPORT __attribute__ ((dllimport))
  #else
    #define WAM_MSGS_EXPORT __declspec(dllexport)
    #define WAM_MSGS_IMPORT __declspec(dllimport)
  #endif
  #ifdef WAM_MSGS_BUILDING_LIBRARY
    #define WAM_MSGS_PUBLIC WAM_MSGS_EXPORT
  #else
    #define WAM_MSGS_PUBLIC WAM_MSGS_IMPORT
  #endif
  #define WAM_MSGS_PUBLIC_TYPE WAM_MSGS_PUBLIC
  #define WAM_MSGS_LOCAL
#else
  #define WAM_MSGS_EXPORT __attribute__ ((visibility("default")))
  #define WAM_MSGS_IMPORT
  #if __GNUC__ >= 4
    #define WAM_MSGS_PUBLIC __attribute__ ((visibility("default")))
    #define WAM_MSGS_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define WAM_MSGS_PUBLIC
    #define WAM_MSGS_LOCAL
  #endif
  #define WAM_MSGS_PUBLIC_TYPE
#endif
#endif  // WAM_MSGS__VISIBILITY_CONTROL_H_
// Generated 22-Apr-2022 13:44:17
// Copyright 2019-2020 The MathWorks, Inc.
