// Generated by gencpp from file wam_common/WristRotateRequest.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_WRISTROTATEREQUEST_H
#define WAM_COMMON_MESSAGE_WRISTROTATEREQUEST_H


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
struct WristRotateRequest_
{
  typedef WristRotateRequest_<ContainerAllocator> Type;

  WristRotateRequest_()
    : radians(0.0)  {
    }
  WristRotateRequest_(const ContainerAllocator& _alloc)
    : radians(0.0)  {
  (void)_alloc;
    }



   typedef float _radians_type;
  _radians_type radians;





  typedef boost::shared_ptr< ::wam_common::WristRotateRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::WristRotateRequest_<ContainerAllocator> const> ConstPtr;

}; // struct WristRotateRequest_

typedef ::wam_common::WristRotateRequest_<std::allocator<void> > WristRotateRequest;

typedef boost::shared_ptr< ::wam_common::WristRotateRequest > WristRotateRequestPtr;
typedef boost::shared_ptr< ::wam_common::WristRotateRequest const> WristRotateRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::WristRotateRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::WristRotateRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wam_common::WristRotateRequest_<ContainerAllocator1> & lhs, const ::wam_common::WristRotateRequest_<ContainerAllocator2> & rhs)
{
  return lhs.radians == rhs.radians;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wam_common::WristRotateRequest_<ContainerAllocator1> & lhs, const ::wam_common::WristRotateRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::WristRotateRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::WristRotateRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::WristRotateRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::WristRotateRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::WristRotateRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::WristRotateRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::WristRotateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "718158cfca4f89c6952f799c53697f42";
  }

  static const char* value(const ::wam_common::WristRotateRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x718158cfca4f89c6ULL;
  static const uint64_t static_value2 = 0x952f799c53697f42ULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::WristRotateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/WristRotateRequest";
  }

  static const char* value(const ::wam_common::WristRotateRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::WristRotateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 radians\n"
;
  }

  static const char* value(const ::wam_common::WristRotateRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::WristRotateRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.radians);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WristRotateRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::WristRotateRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wam_common::WristRotateRequest_<ContainerAllocator>& v)
  {
    s << indent << "radians: ";
    Printer<float>::stream(s, indent + "  ", v.radians);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_WRISTROTATEREQUEST_H
