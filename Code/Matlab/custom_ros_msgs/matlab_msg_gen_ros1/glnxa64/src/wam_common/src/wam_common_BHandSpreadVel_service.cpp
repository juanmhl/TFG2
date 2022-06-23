// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/BHandSpreadVelRequest
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
#include "wam_common/BHandSpreadVel.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_BHandSpreadVelRequest_common : public MATLABROSMsgInterface<wam_common::BHandSpreadVel::Request> {
  public:
    virtual ~wam_common_msg_BHandSpreadVelRequest_common(){}
    virtual void copy_from_struct(wam_common::BHandSpreadVel::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::BHandSpreadVel::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_BHandSpreadVelRequest_common::copy_from_struct(wam_common::BHandSpreadVel::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //velocity
        const matlab::data::TypedArray<float> velocity_arr = arr["Velocity"];
        msg->velocity = velocity_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Velocity' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Velocity' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_BHandSpreadVelRequest_common::get_arr(MDFactory_T& factory, const wam_common::BHandSpreadVel::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Velocity"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/BHandSpreadVelRequest");
    // velocity
    auto currentElement_velocity = (msg + ctr)->velocity;
    outArray[ctr]["Velocity"] = factory.createScalar(currentElement_velocity);
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_BHandSpreadVelResponse_common : public MATLABROSMsgInterface<wam_common::BHandSpreadVel::Response> {
  public:
    virtual ~wam_common_msg_BHandSpreadVelResponse_common(){}
    virtual void copy_from_struct(wam_common::BHandSpreadVel::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::BHandSpreadVel::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_BHandSpreadVelResponse_common::copy_from_struct(wam_common::BHandSpreadVel::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_BHandSpreadVelResponse_common::get_arr(MDFactory_T& factory, const wam_common::BHandSpreadVel::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/BHandSpreadVelResponse");
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_BHandSpreadVel_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_BHandSpreadVel_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_BHandSpreadVel_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::BHandSpreadVel::Request,wam_common_msg_BHandSpreadVelRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::BHandSpreadVel::Response,wam_common_msg_BHandSpreadVelResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_BHandSpreadVel_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::BHandSpreadVel::Request,wam_common::BHandSpreadVel::Request::ConstPtr,wam_common_msg_BHandSpreadVelRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::BHandSpreadVel::Response,wam_common::BHandSpreadVel::Response::ConstPtr,wam_common_msg_BHandSpreadVelResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_BHandSpreadVel_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::BHandSpreadVel::Request,wam_common::BHandSpreadVel::Response,wam_common_msg_BHandSpreadVelRequest_common,wam_common_msg_BHandSpreadVelResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_BHandSpreadVel_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::BHandSpreadVel,wam_common::BHandSpreadVel::Request,wam_common::BHandSpreadVel::Response,wam_common_msg_BHandSpreadVelRequest_common,wam_common_msg_BHandSpreadVelResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_BHandSpreadVel_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::BHandSpreadVelRequest,wam_common_msg_BHandSpreadVelRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::BHandSpreadVelResponse,wam_common_msg_BHandSpreadVelResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_BHandSpreadVelRequest_common, MATLABROSMsgInterface<wam_common::BHandSpreadVelRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_BHandSpreadVelResponse_common, MATLABROSMsgInterface<wam_common::BHandSpreadVelResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_BHandSpreadVel_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
