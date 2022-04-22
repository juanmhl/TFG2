// Generated by gencpp from file wam_common/DirMove.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_DIRMOVE_H
#define WAM_COMMON_MESSAGE_DIRMOVE_H

#include <ros/service_traits.h>


#include <wam_common/DirMoveRequest.h>
#include <wam_common/DirMoveResponse.h>


namespace wam_common
{

struct DirMove
{

typedef DirMoveRequest Request;
typedef DirMoveResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct DirMove
} // namespace wam_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::wam_common::DirMove > {
  static const char* value()
  {
    return "74d315c33b71098916cb1e21a2e6a66f";
  }

  static const char* value(const ::wam_common::DirMove&) { return value(); }
};

template<>
struct DataType< ::wam_common::DirMove > {
  static const char* value()
  {
    return "wam_common/DirMove";
  }

  static const char* value(const ::wam_common::DirMove&) { return value(); }
};


// service_traits::MD5Sum< ::wam_common::DirMoveRequest> should match
// service_traits::MD5Sum< ::wam_common::DirMove >
template<>
struct MD5Sum< ::wam_common::DirMoveRequest>
{
  static const char* value()
  {
    return MD5Sum< ::wam_common::DirMove >::value();
  }
  static const char* value(const ::wam_common::DirMoveRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::wam_common::DirMoveRequest> should match
// service_traits::DataType< ::wam_common::DirMove >
template<>
struct DataType< ::wam_common::DirMoveRequest>
{
  static const char* value()
  {
    return DataType< ::wam_common::DirMove >::value();
  }
  static const char* value(const ::wam_common::DirMoveRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::wam_common::DirMoveResponse> should match
// service_traits::MD5Sum< ::wam_common::DirMove >
template<>
struct MD5Sum< ::wam_common::DirMoveResponse>
{
  static const char* value()
  {
    return MD5Sum< ::wam_common::DirMove >::value();
  }
  static const char* value(const ::wam_common::DirMoveResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::wam_common::DirMoveResponse> should match
// service_traits::DataType< ::wam_common::DirMove >
template<>
struct DataType< ::wam_common::DirMoveResponse>
{
  static const char* value()
  {
    return DataType< ::wam_common::DirMove >::value();
  }
  static const char* value(const ::wam_common::DirMoveResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WAM_COMMON_MESSAGE_DIRMOVE_H
