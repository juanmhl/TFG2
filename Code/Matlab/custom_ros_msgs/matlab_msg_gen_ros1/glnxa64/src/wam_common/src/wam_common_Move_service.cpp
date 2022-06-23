// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/MoveRequest
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
#include "wam_common/Move.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_MoveRequest_common : public MATLABROSMsgInterface<wam_common::Move::Request> {
  public:
    virtual ~wam_common_msg_MoveRequest_common(){}
    virtual void copy_from_struct(wam_common::Move::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::Move::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_MoveRequest_common::copy_from_struct(wam_common::Move::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //position
        const matlab::data::StructArray position_arr = arr["Position"];
        auto msgClassPtr_position = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
        msgClassPtr_position->copy_from_struct(&msg->position,position_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Position' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Position' is wrong type; expected a struct.");
    }
    try {
        //orientation
        const matlab::data::StructArray orientation_arr = arr["Orientation"];
        auto msgClassPtr_orientation = getCommonObject<std_msgs::Float32MultiArray>("std_msgs_msg_Float32MultiArray_common",loader);
        msgClassPtr_orientation->copy_from_struct(&msg->orientation,orientation_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Orientation' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Orientation' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_MoveRequest_common::get_arr(MDFactory_T& factory, const wam_common::Move::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Position","Orientation"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/MoveRequest");
    // position
    auto currentElement_position = (msg + ctr)->position;
    auto msgClassPtr_position = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
    outArray[ctr]["Position"] = msgClassPtr_position->get_arr(factory, &currentElement_position, loader);
    // orientation
    auto currentElement_orientation = (msg + ctr)->orientation;
    auto msgClassPtr_orientation = getCommonObject<std_msgs::Float32MultiArray>("std_msgs_msg_Float32MultiArray_common",loader);
    outArray[ctr]["Orientation"] = msgClassPtr_orientation->get_arr(factory, &currentElement_orientation, loader);
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_MoveResponse_common : public MATLABROSMsgInterface<wam_common::Move::Response> {
  public:
    virtual ~wam_common_msg_MoveResponse_common(){}
    virtual void copy_from_struct(wam_common::Move::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::Move::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_MoveResponse_common::copy_from_struct(wam_common::Move::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_MoveResponse_common::get_arr(MDFactory_T& factory, const wam_common::Move::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/MoveResponse");
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_Move_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_Move_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_Move_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::Move::Request,wam_common_msg_MoveRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::Move::Response,wam_common_msg_MoveResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_Move_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::Move::Request,wam_common::Move::Request::ConstPtr,wam_common_msg_MoveRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::Move::Response,wam_common::Move::Response::ConstPtr,wam_common_msg_MoveResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_Move_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::Move::Request,wam_common::Move::Response,wam_common_msg_MoveRequest_common,wam_common_msg_MoveResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_Move_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::Move,wam_common::Move::Request,wam_common::Move::Response,wam_common_msg_MoveRequest_common,wam_common_msg_MoveResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_Move_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::MoveRequest,wam_common_msg_MoveRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::MoveResponse,wam_common_msg_MoveResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_MoveRequest_common, MATLABROSMsgInterface<wam_common::MoveRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_MoveResponse_common, MATLABROSMsgInterface<wam_common::MoveResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_Move_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
