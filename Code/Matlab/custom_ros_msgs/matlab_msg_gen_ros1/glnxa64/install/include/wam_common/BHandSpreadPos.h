// Generated by gencpp from file wam_common/BHandSpreadPos.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_BHANDSPREADPOS_H
#define WAM_COMMON_MESSAGE_BHANDSPREADPOS_H

#include <ros/service_traits.h>


#include <wam_common/BHandSpreadPosRequest.h>
#include <wam_common/BHandSpreadPosResponse.h>


namespace wam_common
{

struct BHandSpreadPos
{

typedef BHandSpreadPosRequest Request;
typedef BHandSpreadPosResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct BHandSpreadPos
} // namespace wam_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::wam_common::BHandSpreadPos > {
  static const char* value()
  {
    return "718158cfca4f89c6952f799c53697f42";
  }

  static const char* value(const ::wam_common::BHandSpreadPos&) { return value(); }
};

template<>
struct DataType< ::wam_common::BHandSpreadPos > {
  static const char* value()
  {
    return "wam_common/BHandSpreadPos";
  }

  static const char* value(const ::wam_common::BHandSpreadPos&) { return value(); }
};


// service_traits::MD5Sum< ::wam_common::BHandSpreadPosRequest> should match
// service_traits::MD5Sum< ::wam_common::BHandSpreadPos >
template<>
struct MD5Sum< ::wam_common::BHandSpreadPosRequest>
{
  static const char* value()
  {
    return MD5Sum< ::wam_common::BHandSpreadPos >::value();
  }
  static const char* value(const ::wam_common::BHandSpreadPosRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::wam_common::BHandSpreadPosRequest> should match
// service_traits::DataType< ::wam_common::BHandSpreadPos >
template<>
struct DataType< ::wam_common::BHandSpreadPosRequest>
{
  static const char* value()
  {
    return DataType< ::wam_common::BHandSpreadPos >::value();
  }
  static const char* value(const ::wam_common::BHandSpreadPosRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::wam_common::BHandSpreadPosResponse> should match
// service_traits::MD5Sum< ::wam_common::BHandSpreadPos >
template<>
struct MD5Sum< ::wam_common::BHandSpreadPosResponse>
{
  static const char* value()
  {
    return MD5Sum< ::wam_common::BHandSpreadPos >::value();
  }
  static const char* value(const ::wam_common::BHandSpreadPosResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::wam_common::BHandSpreadPosResponse> should match
// service_traits::DataType< ::wam_common::BHandSpreadPos >
template<>
struct DataType< ::wam_common::BHandSpreadPosResponse>
{
  static const char* value()
  {
    return DataType< ::wam_common::BHandSpreadPos >::value();
  }
  static const char* value(const ::wam_common::BHandSpreadPosResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WAM_COMMON_MESSAGE_BHANDSPREADPOS_H