// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/RTJointVel
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
#include "wam_common/RTJointVel.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_RTJointVel_common : public MATLABROSMsgInterface<wam_common::RTJointVel> {
  public:
    virtual ~wam_common_msg_RTJointVel_common(){}
    virtual void copy_from_struct(wam_common::RTJointVel* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::RTJointVel* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_RTJointVel_common::copy_from_struct(wam_common::RTJointVel* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //velocities
        const matlab::data::TypedArray<float> velocities_arr = arr["Velocities"];
        size_t nelem = velocities_arr.getNumberOfElements();
        	msg->velocities.resize(nelem);
        	std::copy(velocities_arr.begin(), velocities_arr.begin()+nelem, msg->velocities.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Velocities' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Velocities' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_RTJointVel_common::get_arr(MDFactory_T& factory, const wam_common::RTJointVel* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Velocities"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/RTJointVel");
    // velocities
    auto currentElement_velocities = (msg + ctr)->velocities;
    outArray[ctr]["Velocities"] = factory.createArray<wam_common::RTJointVel::_velocities_type::const_iterator, float>({currentElement_velocities.size(),1}, currentElement_velocities.begin(), currentElement_velocities.end());
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_RTJointVel_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_RTJointVel_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_RTJointVel_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<wam_common::RTJointVel,wam_common_msg_RTJointVel_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         wam_common_RTJointVel_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<wam_common::RTJointVel,wam_common::RTJointVel::ConstPtr,wam_common_msg_RTJointVel_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         wam_common_RTJointVel_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<wam_common::RTJointVel,wam_common_msg_RTJointVel_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_RTJointVel_common, MATLABROSMsgInterface<wam_common::RTJointVel>)
CLASS_LOADER_REGISTER_CLASS(wam_common_RTJointVel_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1