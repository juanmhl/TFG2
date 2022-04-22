// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/ChangeMinirobotRequest
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
#include "wam_common/ChangeMinirobot.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_ChangeMinirobotRequest_common : public MATLABROSMsgInterface<wam_common::ChangeMinirobot::Request> {
  public:
    virtual ~wam_common_msg_ChangeMinirobotRequest_common(){}
    virtual void copy_from_struct(wam_common::ChangeMinirobot::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::ChangeMinirobot::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_ChangeMinirobotRequest_common::copy_from_struct(wam_common::ChangeMinirobot::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //minirobot
        const matlab::data::TypedArray<float> minirobot_arr = arr["Minirobot"];
        msg->minirobot = minirobot_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Minirobot' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Minirobot' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_ChangeMinirobotRequest_common::get_arr(MDFactory_T& factory, const wam_common::ChangeMinirobot::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Minirobot"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/ChangeMinirobotRequest");
    // minirobot
    auto currentElement_minirobot = (msg + ctr)->minirobot;
    outArray[ctr]["Minirobot"] = factory.createScalar(currentElement_minirobot);
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_ChangeMinirobotResponse_common : public MATLABROSMsgInterface<wam_common::ChangeMinirobot::Response> {
  public:
    virtual ~wam_common_msg_ChangeMinirobotResponse_common(){}
    virtual void copy_from_struct(wam_common::ChangeMinirobot::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::ChangeMinirobot::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_ChangeMinirobotResponse_common::copy_from_struct(wam_common::ChangeMinirobot::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_ChangeMinirobotResponse_common::get_arr(MDFactory_T& factory, const wam_common::ChangeMinirobot::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/ChangeMinirobotResponse");
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_ChangeMinirobot_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_ChangeMinirobot_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_ChangeMinirobot_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::ChangeMinirobot::Request,wam_common_msg_ChangeMinirobotRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::ChangeMinirobot::Response,wam_common_msg_ChangeMinirobotResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_ChangeMinirobot_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::ChangeMinirobot::Request,wam_common::ChangeMinirobot::Request::ConstPtr,wam_common_msg_ChangeMinirobotRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::ChangeMinirobot::Response,wam_common::ChangeMinirobot::Response::ConstPtr,wam_common_msg_ChangeMinirobotResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_ChangeMinirobot_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::ChangeMinirobot::Request,wam_common::ChangeMinirobot::Response,wam_common_msg_ChangeMinirobotRequest_common,wam_common_msg_ChangeMinirobotResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_ChangeMinirobot_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::ChangeMinirobot,wam_common::ChangeMinirobot::Request,wam_common::ChangeMinirobot::Response,wam_common_msg_ChangeMinirobotRequest_common,wam_common_msg_ChangeMinirobotResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_ChangeMinirobot_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::ChangeMinirobotRequest,wam_common_msg_ChangeMinirobotRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::ChangeMinirobotResponse,wam_common_msg_ChangeMinirobotResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_ChangeMinirobotRequest_common, MATLABROSMsgInterface<wam_common::ChangeMinirobotRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_ChangeMinirobotResponse_common, MATLABROSMsgInterface<wam_common::ChangeMinirobotResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_ChangeMinirobot_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
