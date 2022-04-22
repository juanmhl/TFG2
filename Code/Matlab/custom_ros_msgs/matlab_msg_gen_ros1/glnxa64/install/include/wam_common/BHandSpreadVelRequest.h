// Generated by gencpp from file wam_common/BHandSpreadVelRequest.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_BHANDSPREADVELREQUEST_H
#define WAM_COMMON_MESSAGE_BHANDSPREADVELREQUEST_H


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
struct BHandSpreadVelRequest_
{
  typedef BHandSpreadVelRequest_<ContainerAllocator> Type;

  BHandSpreadVelRequest_()
    : velocity(0.0)  {
    }
  BHandSpreadVelRequest_(const ContainerAllocator& _alloc)
    : velocity(0.0)  {
  (void)_alloc;
    }



   typedef float _velocity_type;
  _velocity_type velocity;





  typedef boost::shared_ptr< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> const> ConstPtr;

}; // struct BHandSpreadVelRequest_

typedef ::wam_common::BHandSpreadVelRequest_<std::allocator<void> > BHandSpreadVelRequest;

typedef boost::shared_ptr< ::wam_common::BHandSpreadVelRequest > BHandSpreadVelRequestPtr;
typedef boost::shared_ptr< ::wam_common::BHandSpreadVelRequest const> BHandSpreadVelRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator1> & lhs, const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator2> & rhs)
{
  return lhs.velocity == rhs.velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator1> & lhs, const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e4ff88b32504f688719a85e0753f63ce";
  }

  static const char* value(const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe4ff88b32504f688ULL;
  static const uint64_t static_value2 = 0x719a85e0753f63ceULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/BHandSpreadVelRequest";
  }

  static const char* value(const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 velocity \n"
;
  }

  static const char* value(const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BHandSpreadVelRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::BHandSpreadVelRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wam_common::BHandSpreadVelRequest_<ContainerAllocator>& v)
  {
    s << indent << "velocity: ";
    Printer<float>::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_BHANDSPREADVELREQUEST_H
