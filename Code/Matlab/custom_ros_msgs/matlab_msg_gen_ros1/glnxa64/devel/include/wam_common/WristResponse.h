// Generated by gencpp from file wam_common/WristResponse.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_WRISTRESPONSE_H
#define WAM_COMMON_MESSAGE_WRISTRESPONSE_H


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
struct WristResponse_
{
  typedef WristResponse_<ContainerAllocator> Type;

  WristResponse_()
    : jp(0.0)  {
    }
  WristResponse_(const ContainerAllocator& _alloc)
    : jp(0.0)  {
  (void)_alloc;
    }



   typedef float _jp_type;
  _jp_type jp;





  typedef boost::shared_ptr< ::wam_common::WristResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::WristResponse_<ContainerAllocator> const> ConstPtr;

}; // struct WristResponse_

typedef ::wam_common::WristResponse_<std::allocator<void> > WristResponse;

typedef boost::shared_ptr< ::wam_common::WristResponse > WristResponsePtr;
typedef boost::shared_ptr< ::wam_common::WristResponse const> WristResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::WristResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::WristResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wam_common::WristResponse_<ContainerAllocator1> & lhs, const ::wam_common::WristResponse_<ContainerAllocator2> & rhs)
{
  return lhs.jp == rhs.jp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wam_common::WristResponse_<ContainerAllocator1> & lhs, const ::wam_common::WristResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::WristResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::WristResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::WristResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::WristResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::WristResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::WristResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::WristResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f86fdbd3e330ea48b43168fdd8a60964";
  }

  static const char* value(const ::wam_common::WristResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf86fdbd3e330ea48ULL;
  static const uint64_t static_value2 = 0xb43168fdd8a60964ULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::WristResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/WristResponse";
  }

  static const char* value(const ::wam_common::WristResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::WristResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 jp\n"
"\n"
;
  }

  static const char* value(const ::wam_common::WristResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::WristResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.jp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WristResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::WristResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wam_common::WristResponse_<ContainerAllocator>& v)
  {
    s << indent << "jp: ";
    Printer<float>::stream(s, indent + "  ", v.jp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_WRISTRESPONSE_H