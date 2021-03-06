// Generated by gencpp from file wam_common/OrtnMove.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_ORTNMOVE_H
#define WAM_COMMON_MESSAGE_ORTNMOVE_H

#include <ros/service_traits.h>


#include <wam_common/OrtnMoveRequest.h>
#include <wam_common/OrtnMoveResponse.h>


namespace wam_common
{

struct OrtnMove
{

typedef OrtnMoveRequest Request;
typedef OrtnMoveResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct OrtnMove
} // namespace wam_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::wam_common::OrtnMove > {
  static const char* value()
  {
    return "86f723fe9a4be8979be87cd065276584";
  }

  static const char* value(const ::wam_common::OrtnMove&) { return value(); }
};

template<>
struct DataType< ::wam_common::OrtnMove > {
  static const char* value()
  {
    return "wam_common/OrtnMove";
  }

  static const char* value(const ::wam_common::OrtnMove&) { return value(); }
};


// service_traits::MD5Sum< ::wam_common::OrtnMoveRequest> should match
// service_traits::MD5Sum< ::wam_common::OrtnMove >
template<>
struct MD5Sum< ::wam_common::OrtnMoveRequest>
{
  static const char* value()
  {
    return MD5Sum< ::wam_common::OrtnMove >::value();
  }
  static const char* value(const ::wam_common::OrtnMoveRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::wam_common::OrtnMoveRequest> should match
// service_traits::DataType< ::wam_common::OrtnMove >
template<>
struct DataType< ::wam_common::OrtnMoveRequest>
{
  static const char* value()
  {
    return DataType< ::wam_common::OrtnMove >::value();
  }
  static const char* value(const ::wam_common::OrtnMoveRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::wam_common::OrtnMoveResponse> should match
// service_traits::MD5Sum< ::wam_common::OrtnMove >
template<>
struct MD5Sum< ::wam_common::OrtnMoveResponse>
{
  static const char* value()
  {
    return MD5Sum< ::wam_common::OrtnMove >::value();
  }
  static const char* value(const ::wam_common::OrtnMoveResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::wam_common::OrtnMoveResponse> should match
// service_traits::DataType< ::wam_common::OrtnMove >
template<>
struct DataType< ::wam_common::OrtnMoveResponse>
{
  static const char* value()
  {
    return DataType< ::wam_common::OrtnMove >::value();
  }
  static const char* value(const ::wam_common::OrtnMoveResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WAM_COMMON_MESSAGE_ORTNMOVE_H
