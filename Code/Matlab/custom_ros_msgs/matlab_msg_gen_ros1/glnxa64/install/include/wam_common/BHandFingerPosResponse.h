// Generated by gencpp from file wam_common/BHandFingerPosResponse.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_BHANDFINGERPOSRESPONSE_H
#define WAM_COMMON_MESSAGE_BHANDFINGERPOSRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace wam_common
{
template <class ContainerAllocator>
struct BHandFingerPosResponse_
{
  typedef BHandFingerPosResponse_<ContainerAllocator> Type;

  BHandFingerPosResponse_()
    {
    }
  BHandFingerPosResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> const> ConstPtr;

}; // struct BHandFingerPosResponse_

typedef ::wam_common::BHandFingerPosResponse_<std::allocator<void> > BHandFingerPosResponse;

typedef boost::shared_ptr< ::wam_common::BHandFingerPosResponse > BHandFingerPosResponsePtr;
typedef boost::shared_ptr< ::wam_common::BHandFingerPosResponse const> BHandFingerPosResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::BHandFingerPosResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::wam_common::BHandFingerPosResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/BHandFingerPosResponse";
  }

  static const char* value(const ::wam_common::BHandFingerPosResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::wam_common::BHandFingerPosResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BHandFingerPosResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::BHandFingerPosResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::wam_common::BHandFingerPosResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_BHANDFINGERPOSRESPONSE_H
