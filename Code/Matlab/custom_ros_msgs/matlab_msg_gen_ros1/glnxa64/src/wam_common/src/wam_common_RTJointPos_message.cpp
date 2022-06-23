// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/RTJointPos
#include "boost/date_time.hpp"
#include "boost/shared_array.hpp"
#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable : 4244)
#pragma warning(disable : 4265)
#pragma warning(disable : 4458)
#pragma warning(disable : 4100)
#pragma warning(disable : 4127)
#pragma warning(disable : 4267)
#pragma warning(disable : 4068)
#pragma warning(disable : 4245)
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wredundant-decls"
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Wdelete-non-virtual-dtor"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wshadow"
#endif //_MSC_VER
#include "ros/ros.h"
#include "wam_common/RTJointPos.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_RTJointPos_common : public MATLABROSMsgInterface<wam_common::RTJointPos> {
  public:
    virtual ~wam_common_msg_RTJointPos_common(){}
    virtual void copy_from_struct(wam_common::RTJointPos* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::RTJointPos* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_RTJointPos_common::copy_from_struct(wam_common::RTJointPos* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //joints
        const matlab::data::TypedArray<float> joints_arr = arr["Joints"];
        size_t nelem = joints_arr.getNumberOfElements();
        	msg->joints.resize(nelem);
        	std::copy(joints_arr.begin(), joints_arr.begin()+nelem, msg->joints.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Joints' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Joints' is wrong type; expected a single.");
    }
    try {
        //rate_limits
        const matlab::data::TypedArray<float> rate_limits_arr = arr["RateLimits"];
        size_t nelem = rate_limits_arr.getNumberOfElements();
        	msg->rate_limits.resize(nelem);
        	std::copy(rate_limits_arr.begin(), rate_limits_arr.begin()+nelem, msg->rate_limits.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'RateLimits' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'RateLimits' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_RTJointPos_common::get_arr(MDFactory_T& factory, const wam_common::RTJointPos* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Joints","RateLimits"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/RTJointPos");
    // joints
    auto currentElement_joints = (msg + ctr)->joints;
    outArray[ctr]["Joints"] = factory.createArray<wam_common::RTJointPos::_joints_type::const_iterator, float>({currentElement_joints.size(),1}, currentElement_joints.begin(), currentElement_joints.end());
    // rate_limits
    auto currentElement_rate_limits = (msg + ctr)->rate_limits;
    outArray[ctr]["RateLimits"] = factory.createArray<wam_common::RTJointPos::_rate_limits_type::const_iterator, float>({currentElement_rate_limits.size(),1}, currentElement_rate_limits.begin(), currentElement_rate_limits.end());
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_RTJointPos_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_RTJointPos_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_RTJointPos_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<wam_common::RTJointPos,wam_common_msg_RTJointPos_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         wam_common_RTJointPos_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<wam_common::RTJointPos,wam_common::RTJointPos::ConstPtr,wam_common_msg_RTJointPos_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         wam_common_RTJointPos_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<wam_common::RTJointPos,wam_common_msg_RTJointPos_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_RTJointPos_common, MATLABROSMsgInterface<wam_common::RTJointPos>)
CLASS_LOADER_REGISTER_CLASS(wam_common_RTJointPos_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1