// Generated by gencpp from file wam_common/RTJointPos.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_RTJOINTPOS_H
#define WAM_COMMON_MESSAGE_RTJOINTPOS_H


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
struct RTJointPos_
{
  typedef RTJointPos_<ContainerAllocator> Type;

  RTJointPos_()
    : joints()
    , rate_limits()  {
    }
  RTJointPos_(const ContainerAllocator& _alloc)
    : joints(_alloc)
    , rate_limits(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _joints_type;
  _joints_type joints;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _rate_limits_type;
  _rate_limits_type rate_limits;





  typedef boost::shared_ptr< ::wam_common::RTJointPos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::RTJointPos_<ContainerAllocator> const> ConstPtr;

}; // struct RTJointPos_

typedef ::wam_common::RTJointPos_<std::allocator<void> > RTJointPos;

typedef boost::shared_ptr< ::wam_common::RTJointPos > RTJointPosPtr;
typedef boost::shared_ptr< ::wam_common::RTJointPos const> RTJointPosConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::RTJointPos_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::RTJointPos_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wam_common::RTJointPos_<ContainerAllocator1> & lhs, const ::wam_common::RTJointPos_<ContainerAllocator2> & rhs)
{
  return lhs.joints == rhs.joints &&
    lhs.rate_limits == rhs.rate_limits;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wam_common::RTJointPos_<ContainerAllocator1> & lhs, const ::wam_common::RTJointPos_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::RTJointPos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::RTJointPos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::RTJointPos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::RTJointPos_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::RTJointPos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::RTJointPos_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::RTJointPos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6db71b8c4d3c870c701b3f89e85b7a36";
  }

  static const char* value(const ::wam_common::RTJointPos_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6db71b8c4d3c870cULL;
  static const uint64_t static_value2 = 0x701b3f89e85b7a36ULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::RTJointPos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/RTJointPos";
  }

  static const char* value(const ::wam_common::RTJointPos_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::RTJointPos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] joints\n"
"float32[] rate_limits\n"
;
  }

  static const char* value(const ::wam_common::RTJointPos_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::RTJointPos_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.joints);
      stream.next(m.rate_limits);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RTJointPos_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::RTJointPos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wam_common::RTJointPos_<ContainerAllocator>& v)
  {
    s << indent << "joints[]" << std::endl;
    for (size_t i = 0; i < v.joints.size(); ++i)
    {
      s << indent << "  joints[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.joints[i]);
    }
    s << indent << "rate_limits[]" << std::endl;
    for (size_t i = 0; i < v.rate_limits.size(); ++i)
    {
      s << indent << "  rate_limits[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.rate_limits[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_RTJOINTPOS_H
