// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/BHandGraspPosRequest
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
#include "wam_common/BHandGraspPos.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_BHandGraspPosRequest_common : public MATLABROSMsgInterface<wam_common::BHandGraspPos::Request> {
  public:
    virtual ~wam_common_msg_BHandGraspPosRequest_common(){}
    virtual void copy_from_struct(wam_common::BHandGraspPos::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::BHandGraspPos::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_BHandGraspPosRequest_common::copy_from_struct(wam_common::BHandGraspPos::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //radians
        const matlab::data::TypedArray<float> radians_arr = arr["Radians"];
        msg->radians = radians_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Radians' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Radians' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_BHandGraspPosRequest_common::get_arr(MDFactory_T& factory, const wam_common::BHandGraspPos::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Radians"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/BHandGraspPosRequest");
    // radians
    auto currentElement_radians = (msg + ctr)->radians;
    outArray[ctr]["Radians"] = factory.createScalar(currentElement_radians);
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_BHandGraspPosResponse_common : public MATLABROSMsgInterface<wam_common::BHandGraspPos::Response> {
  public:
    virtual ~wam_common_msg_BHandGraspPosResponse_common(){}
    virtual void copy_from_struct(wam_common::BHandGraspPos::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::BHandGraspPos::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_BHandGraspPosResponse_common::copy_from_struct(wam_common::BHandGraspPos::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_BHandGraspPosResponse_common::get_arr(MDFactory_T& factory, const wam_common::BHandGraspPos::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/BHandGraspPosResponse");
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_BHandGraspPos_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_BHandGraspPos_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_BHandGraspPos_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::BHandGraspPos::Request,wam_common_msg_BHandGraspPosRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::BHandGraspPos::Response,wam_common_msg_BHandGraspPosResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_BHandGraspPos_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::BHandGraspPos::Request,wam_common::BHandGraspPos::Request::ConstPtr,wam_common_msg_BHandGraspPosRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::BHandGraspPos::Response,wam_common::BHandGraspPos::Response::ConstPtr,wam_common_msg_BHandGraspPosResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_BHandGraspPos_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::BHandGraspPos::Request,wam_common::BHandGraspPos::Response,wam_common_msg_BHandGraspPosRequest_common,wam_common_msg_BHandGraspPosResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_BHandGraspPos_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::BHandGraspPos,wam_common::BHandGraspPos::Request,wam_common::BHandGraspPos::Response,wam_common_msg_BHandGraspPosRequest_common,wam_common_msg_BHandGraspPosResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_BHandGraspPos_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::BHandGraspPosRequest,wam_common_msg_BHandGraspPosRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::BHandGraspPosResponse,wam_common_msg_BHandGraspPosResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_BHandGraspPosRequest_common, MATLABROSMsgInterface<wam_common::BHandGraspPosRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_BHandGraspPosResponse_common, MATLABROSMsgInterface<wam_common::BHandGraspPosResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_BHandGraspPos_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
