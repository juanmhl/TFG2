// Generated by gencpp from file wam_common/JointMoveRequest.msg
// DO NOT EDIT!


#ifndef WAM_COMMON_MESSAGE_JOINTMOVEREQUEST_H
#define WAM_COMMON_MESSAGE_JOINTMOVEREQUEST_H


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
struct JointMoveRequest_
{
  typedef JointMoveRequest_<ContainerAllocator> Type;

  JointMoveRequest_()
    : joints()  {
    }
  JointMoveRequest_(const ContainerAllocator& _alloc)
    : joints(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _joints_type;
  _joints_type joints;





  typedef boost::shared_ptr< ::wam_common::JointMoveRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wam_common::JointMoveRequest_<ContainerAllocator> const> ConstPtr;

}; // struct JointMoveRequest_

typedef ::wam_common::JointMoveRequest_<std::allocator<void> > JointMoveRequest;

typedef boost::shared_ptr< ::wam_common::JointMoveRequest > JointMoveRequestPtr;
typedef boost::shared_ptr< ::wam_common::JointMoveRequest const> JointMoveRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wam_common::JointMoveRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wam_common::JointMoveRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wam_common::JointMoveRequest_<ContainerAllocator1> & lhs, const ::wam_common::JointMoveRequest_<ContainerAllocator2> & rhs)
{
  return lhs.joints == rhs.joints;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wam_common::JointMoveRequest_<ContainerAllocator1> & lhs, const ::wam_common::JointMoveRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wam_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wam_common::JointMoveRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wam_common::JointMoveRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::JointMoveRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wam_common::JointMoveRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::JointMoveRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wam_common::JointMoveRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wam_common::JointMoveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e2a0e438b445b98def0f0ba6a2a85f58";
  }

  static const char* value(const ::wam_common::JointMoveRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe2a0e438b445b98dULL;
  static const uint64_t static_value2 = 0xef0f0ba6a2a85f58ULL;
};

template<class ContainerAllocator>
struct DataType< ::wam_common::JointMoveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wam_common/JointMoveRequest";
  }

  static const char* value(const ::wam_common::JointMoveRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wam_common::JointMoveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] joints\n"
;
  }

  static const char* value(const ::wam_common::JointMoveRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wam_common::JointMoveRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.joints);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct JointMoveRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wam_common::JointMoveRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wam_common::JointMoveRequest_<ContainerAllocator>& v)
  {
    s << indent << "joints[]" << std::endl;
    for (size_t i = 0; i < v.joints.size(); ++i)
    {
      s << indent << "  joints[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.joints[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // WAM_COMMON_MESSAGE_JOINTMOVEREQUEST_H