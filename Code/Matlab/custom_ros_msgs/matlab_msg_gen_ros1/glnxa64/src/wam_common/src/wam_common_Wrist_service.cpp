// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/WristRequest
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
#include "wam_common/Wrist.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_WristRequest_common : public MATLABROSMsgInterface<wam_common::Wrist::Request> {
  public:
    virtual ~wam_common_msg_WristRequest_common(){}
    virtual void copy_from_struct(wam_common::Wrist::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::Wrist::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_WristRequest_common::copy_from_struct(wam_common::Wrist::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_WristRequest_common::get_arr(MDFactory_T& factory, const wam_common::Wrist::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/WristRequest");
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_WristResponse_common : public MATLABROSMsgInterface<wam_common::Wrist::Response> {
  public:
    virtual ~wam_common_msg_WristResponse_common(){}
    virtual void copy_from_struct(wam_common::Wrist::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::Wrist::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_WristResponse_common::copy_from_struct(wam_common::Wrist::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //jp
        const matlab::data::TypedArray<float> jp_arr = arr["Jp"];
        msg->jp = jp_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Jp' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Jp' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_WristResponse_common::get_arr(MDFactory_T& factory, const wam_common::Wrist::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Jp"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/WristResponse");
    // jp
    auto currentElement_jp = (msg + ctr)->jp;
    outArray[ctr]["Jp"] = factory.createScalar(currentElement_jp);
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_Wrist_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_Wrist_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_Wrist_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::Wrist::Request,wam_common_msg_WristRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::Wrist::Response,wam_common_msg_WristResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_Wrist_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::Wrist::Request,wam_common::Wrist::Request::ConstPtr,wam_common_msg_WristRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::Wrist::Response,wam_common::Wrist::Response::ConstPtr,wam_common_msg_WristResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_Wrist_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::Wrist::Request,wam_common::Wrist::Response,wam_common_msg_WristRequest_common,wam_common_msg_WristResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_Wrist_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::Wrist,wam_common::Wrist::Request,wam_common::Wrist::Response,wam_common_msg_WristRequest_common,wam_common_msg_WristResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_Wrist_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::WristRequest,wam_common_msg_WristRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::WristResponse,wam_common_msg_WristResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_WristRequest_common, MATLABROSMsgInterface<wam_common::WristRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_WristResponse_common, MATLABROSMsgInterface<wam_common::WristResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_Wrist_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
