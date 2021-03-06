// Generated by gencpp from file wam_common/CouplingWamRequest.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_COUPLINGWAMREQUEST_H
#define WAM_COMMON_MESSAGE_COUPLINGWAMREQUEST_H


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
struct CouplingWamRequest_
{
  typedef CouplingWamRequest_<ContainerAllocator> Type;

  CouplingWamRequest_()
    : couplingCamera(false)
    , couplingIlumination(false)  {
    }
  CouplingWamRequest_(const ContainerAllocator& _alloc)
    : couplingCamera(false)
    , couplingIlumination(false)  {
  (void)_alloc;
    }



   typedef uint8_t _couplingCamera_type;
  _couplingCamera_type couplingCamera;

   typedef uint8_t _couplingIlumination_type;
  _couplingIlumination_type couplingIlumination;





  typedef boost::shared_ptr< ::wam_common::CouplingWamRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::CouplingWamRequest_<ContainerAllocator> const> ConstPtr;

}; // struct CouplingWamRequest_

typedef ::wam_common::CouplingWamRequest_<std::allocator<void> > CouplingWamRequest;

typedef boost::shared_ptr< ::wam_common::CouplingWamRequest > CouplingWamRequestPtr;
typedef boost::shared_ptr< ::wam_common::CouplingWamRequest const> CouplingWamRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::CouplingWamRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::CouplingWamRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wam_common::CouplingWamRequest_<ContainerAllocator1> & lhs, const ::wam_common::CouplingWamRequest_<ContainerAllocator2> & rhs)
{
  return lhs.couplingCamera == rhs.couplingCamera &&
    lhs.couplingIlumination == rhs.couplingIlumination;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wam_common::CouplingWamRequest_<ContainerAllocator1> & lhs, const ::wam_common::CouplingWamRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::CouplingWamRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::CouplingWamRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::CouplingWamRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "673873b0d5bf0a07d3f41369f70ccd47";
  }

  static const char* value(const ::wam_common::CouplingWamRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x673873b0d5bf0a07ULL;
  static const uint64_t static_value2 = 0xd3f41369f70ccd47ULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/CouplingWamRequest";
  }

  static const char* value(const ::wam_common::CouplingWamRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool couplingCamera\n"
"bool couplingIlumination\n"
;
  }

  static const char* value(const ::wam_common::CouplingWamRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.couplingCamera);
      stream.next(m.couplingIlumination);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CouplingWamRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::CouplingWamRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wam_common::CouplingWamRequest_<ContainerAllocator>& v)
  {
    s << indent << "couplingCamera: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.couplingCamera);
    s << indent << "couplingIlumination: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.couplingIlumination);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_COUPLINGWAMREQUEST_H
