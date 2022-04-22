// Generated by gencpp from file wam_common/PoseRequest.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_POSEREQUEST_H
#define WAM_COMMON_MESSAGE_POSEREQUEST_H


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
struct PoseRequest_
{
  typedef PoseRequest_<ContainerAllocator> Type;

  PoseRequest_()
    {
    }
  PoseRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::wam_common::PoseRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::PoseRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PoseRequest_

typedef ::wam_common::PoseRequest_<std::allocator<void> > PoseRequest;

typedef boost::shared_ptr< ::wam_common::PoseRequest > PoseRequestPtr;
typedef boost::shared_ptr< ::wam_common::PoseRequest const> PoseRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::PoseRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::PoseRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::PoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::PoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::PoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::PoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::PoseRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::PoseRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::PoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::wam_common::PoseRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::PoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/PoseRequest";
  }

  static const char* value(const ::wam_common::PoseRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::PoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::wam_common::PoseRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::PoseRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PoseRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::PoseRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::wam_common::PoseRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_POSEREQUEST_H
