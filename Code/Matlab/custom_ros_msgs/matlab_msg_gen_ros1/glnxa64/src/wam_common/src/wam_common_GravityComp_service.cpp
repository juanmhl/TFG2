// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/GravityCompRequest
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
#include "wam_common/GravityComp.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_GravityCompRequest_common : public MATLABROSMsgInterface<wam_common::GravityComp::Request> {
  public:
    virtual ~wam_common_msg_GravityCompRequest_common(){}
    virtual void copy_from_struct(wam_common::GravityComp::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::GravityComp::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_GravityCompRequest_common::copy_from_struct(wam_common::GravityComp::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //gravity
        const matlab::data::TypedArray<bool> gravity_arr = arr["Gravity"];
        msg->gravity = gravity_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Gravity' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Gravity' is wrong type; expected a logical.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_GravityCompRequest_common::get_arr(MDFactory_T& factory, const wam_common::GravityComp::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Gravity"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/GravityCompRequest");
    // gravity
    auto currentElement_gravity = (msg + ctr)->gravity;
    outArray[ctr]["Gravity"] = factory.createScalar(static_cast<bool>(currentElement_gravity));
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_GravityCompResponse_common : public MATLABROSMsgInterface<wam_common::GravityComp::Response> {
  public:
    virtual ~wam_common_msg_GravityCompResponse_common(){}
    virtual void copy_from_struct(wam_common::GravityComp::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::GravityComp::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_GravityCompResponse_common::copy_from_struct(wam_common::GravityComp::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_GravityCompResponse_common::get_arr(MDFactory_T& factory, const wam_common::GravityComp::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/GravityCompResponse");
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_GravityComp_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_GravityComp_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_GravityComp_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::GravityComp::Request,wam_common_msg_GravityCompRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::GravityComp::Response,wam_common_msg_GravityCompResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_GravityComp_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::GravityComp::Request,wam_common::GravityComp::Request::ConstPtr,wam_common_msg_GravityCompRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::GravityComp::Response,wam_common::GravityComp::Response::ConstPtr,wam_common_msg_GravityCompResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_GravityComp_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::GravityComp::Request,wam_common::GravityComp::Response,wam_common_msg_GravityCompRequest_common,wam_common_msg_GravityCompResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_GravityComp_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::GravityComp,wam_common::GravityComp::Request,wam_common::GravityComp::Response,wam_common_msg_GravityCompRequest_common,wam_common_msg_GravityCompResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_GravityComp_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::GravityCompRequest,wam_common_msg_GravityCompRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::GravityCompResponse,wam_common_msg_GravityCompResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_GravityCompRequest_common, MATLABROSMsgInterface<wam_common::GravityCompRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_GravityCompResponse_common, MATLABROSMsgInterface<wam_common::GravityCompResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_GravityComp_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
