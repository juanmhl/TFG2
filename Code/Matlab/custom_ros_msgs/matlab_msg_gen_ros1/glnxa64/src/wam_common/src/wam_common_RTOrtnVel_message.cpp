// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/RTOrtnVel
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
#include "wam_common/RTOrtnVel.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_RTOrtnVel_common : public MATLABROSMsgInterface<wam_common::RTOrtnVel> {
  public:
    virtual ~wam_common_msg_RTOrtnVel_common(){}
    virtual void copy_from_struct(wam_common::RTOrtnVel* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::RTOrtnVel* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_RTOrtnVel_common::copy_from_struct(wam_common::RTOrtnVel* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //angular
        const matlab::data::TypedArray<float> angular_arr = arr["Angular"];
        size_t nelem = 3;
        	std::copy(angular_arr.begin(), angular_arr.begin()+nelem, msg->angular.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Angular' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Angular' is wrong type; expected a single.");
    }
    try {
        //magnitude
        const matlab::data::TypedArray<float> magnitude_arr = arr["Magnitude"];
        msg->magnitude = magnitude_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Magnitude' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Magnitude' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_RTOrtnVel_common::get_arr(MDFactory_T& factory, const wam_common::RTOrtnVel* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Angular","Magnitude"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/RTOrtnVel");
    // angular
    auto currentElement_angular = (msg + ctr)->angular;
    outArray[ctr]["Angular"] = factory.createArray<wam_common::RTOrtnVel::_angular_type::const_iterator, float>({currentElement_angular.size(),1}, currentElement_angular.begin(), currentElement_angular.end());
    // magnitude
    auto currentElement_magnitude = (msg + ctr)->magnitude;
    outArray[ctr]["Magnitude"] = factory.createScalar(currentElement_magnitude);
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_RTOrtnVel_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_RTOrtnVel_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_RTOrtnVel_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<wam_common::RTOrtnVel,wam_common_msg_RTOrtnVel_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         wam_common_RTOrtnVel_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<wam_common::RTOrtnVel,wam_common::RTOrtnVel::ConstPtr,wam_common_msg_RTOrtnVel_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         wam_common_RTOrtnVel_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<wam_common::RTOrtnVel,wam_common_msg_RTOrtnVel_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_RTOrtnVel_common, MATLABROSMsgInterface<wam_common::RTOrtnVel>)
CLASS_LOADER_REGISTER_CLASS(wam_common_RTOrtnVel_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1