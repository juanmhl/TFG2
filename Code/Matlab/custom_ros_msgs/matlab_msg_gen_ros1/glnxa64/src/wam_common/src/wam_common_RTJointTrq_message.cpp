// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/RTJointTrq
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
#include "wam_common/RTJointTrq.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_RTJointTrq_common : public MATLABROSMsgInterface<wam_common::RTJointTrq> {
  public:
    virtual ~wam_common_msg_RTJointTrq_common(){}
    virtual void copy_from_struct(wam_common::RTJointTrq* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::RTJointTrq* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_RTJointTrq_common::copy_from_struct(wam_common::RTJointTrq* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //torques
        const matlab::data::TypedArray<float> torques_arr = arr["Torques"];
        size_t nelem = torques_arr.getNumberOfElements();
        	msg->torques.resize(nelem);
        	std::copy(torques_arr.begin(), torques_arr.begin()+nelem, msg->torques.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Torques' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Torques' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_RTJointTrq_common::get_arr(MDFactory_T& factory, const wam_common::RTJointTrq* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Torques"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/RTJointTrq");
    // torques
    auto currentElement_torques = (msg + ctr)->torques;
    outArray[ctr]["Torques"] = factory.createArray<wam_common::RTJointTrq::_torques_type::const_iterator, float>({currentElement_torques.size(),1}, currentElement_torques.begin(), currentElement_torques.end());
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_RTJointTrq_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_RTJointTrq_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_RTJointTrq_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<wam_common::RTJointTrq,wam_common_msg_RTJointTrq_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         wam_common_RTJointTrq_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<wam_common::RTJointTrq,wam_common::RTJointTrq::ConstPtr,wam_common_msg_RTJointTrq_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         wam_common_RTJointTrq_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<wam_common::RTJointTrq,wam_common_msg_RTJointTrq_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_RTJointTrq_common, MATLABROSMsgInterface<wam_common::RTJointTrq>)
CLASS_LOADER_REGISTER_CLASS(wam_common_RTJointTrq_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1