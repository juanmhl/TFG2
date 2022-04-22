// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/BHandFingerVelRequest
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
#include "wam_common/BHandFingerVel.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_BHandFingerVelRequest_common : public MATLABROSMsgInterface<wam_common::BHandFingerVel::Request> {
  public:
    virtual ~wam_common_msg_BHandFingerVelRequest_common(){}
    virtual void copy_from_struct(wam_common::BHandFingerVel::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::BHandFingerVel::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_BHandFingerVelRequest_common::copy_from_struct(wam_common::BHandFingerVel::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //velocity
        const matlab::data::TypedArray<float> velocity_arr = arr["Velocity"];
        size_t nelem = 3;
        	std::copy(velocity_arr.begin(), velocity_arr.begin()+nelem, msg->velocity.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Velocity' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Velocity' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_BHandFingerVelRequest_common::get_arr(MDFactory_T& factory, const wam_common::BHandFingerVel::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Velocity"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/BHandFingerVelRequest");
    // velocity
    auto currentElement_velocity = (msg + ctr)->velocity;
    outArray[ctr]["Velocity"] = factory.createArray<wam_common::BHandFingerVel::Request::_velocity_type::const_iterator, float>({currentElement_velocity.size(),1}, currentElement_velocity.begin(), currentElement_velocity.end());
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_BHandFingerVelResponse_common : public MATLABROSMsgInterface<wam_common::BHandFingerVel::Response> {
  public:
    virtual ~wam_common_msg_BHandFingerVelResponse_common(){}
    virtual void copy_from_struct(wam_common::BHandFingerVel::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::BHandFingerVel::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_BHandFingerVelResponse_common::copy_from_struct(wam_common::BHandFingerVel::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_BHandFingerVelResponse_common::get_arr(MDFactory_T& factory, const wam_common::BHandFingerVel::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/BHandFingerVelResponse");
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_BHandFingerVel_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_BHandFingerVel_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_BHandFingerVel_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::BHandFingerVel::Request,wam_common_msg_BHandFingerVelRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::BHandFingerVel::Response,wam_common_msg_BHandFingerVelResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_BHandFingerVel_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::BHandFingerVel::Request,wam_common::BHandFingerVel::Request::ConstPtr,wam_common_msg_BHandFingerVelRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::BHandFingerVel::Response,wam_common::BHandFingerVel::Response::ConstPtr,wam_common_msg_BHandFingerVelResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_BHandFingerVel_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::BHandFingerVel::Request,wam_common::BHandFingerVel::Response,wam_common_msg_BHandFingerVelRequest_common,wam_common_msg_BHandFingerVelResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_BHandFingerVel_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::BHandFingerVel,wam_common::BHandFingerVel::Request,wam_common::BHandFingerVel::Response,wam_common_msg_BHandFingerVelRequest_common,wam_common_msg_BHandFingerVelResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_BHandFingerVel_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::BHandFingerVelRequest,wam_common_msg_BHandFingerVelRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::BHandFingerVelResponse,wam_common_msg_BHandFingerVelResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_BHandFingerVelRequest_common, MATLABROSMsgInterface<wam_common::BHandFingerVelRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_BHandFingerVelResponse_common, MATLABROSMsgInterface<wam_common::BHandFingerVelResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_BHandFingerVel_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
