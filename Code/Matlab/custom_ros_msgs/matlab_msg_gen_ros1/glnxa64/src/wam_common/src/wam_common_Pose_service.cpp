// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_common/PoseRequest
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
#include "wam_common/Pose.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class WAM_COMMON_EXPORT wam_common_msg_PoseRequest_common : public MATLABROSMsgInterface<wam_common::Pose::Request> {
  public:
    virtual ~wam_common_msg_PoseRequest_common(){}
    virtual void copy_from_struct(wam_common::Pose::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::Pose::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_PoseRequest_common::copy_from_struct(wam_common::Pose::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_PoseRequest_common::get_arr(MDFactory_T& factory, const wam_common::Pose::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/PoseRequest");
    }
    return std::move(outArray);
  }
class WAM_COMMON_EXPORT wam_common_msg_PoseResponse_common : public MATLABROSMsgInterface<wam_common::Pose::Response> {
  public:
    virtual ~wam_common_msg_PoseResponse_common(){}
    virtual void copy_from_struct(wam_common::Pose::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_common::Pose::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_common_msg_PoseResponse_common::copy_from_struct(wam_common::Pose::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //pose
        const matlab::data::StructArray pose_arr = arr["Pose"];
        auto msgClassPtr_pose = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
        msgClassPtr_pose->copy_from_struct(&msg->pose,pose_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Pose' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Pose' is wrong type; expected a struct.");
    }
    try {
        //orientMatrix
        const matlab::data::StructArray orientMatrix_arr = arr["OrientMatrix"];
        auto msgClassPtr_orientMatrix = getCommonObject<std_msgs::Float32MultiArray>("std_msgs_msg_Float32MultiArray_common",loader);
        msgClassPtr_orientMatrix->copy_from_struct(&msg->orientMatrix,orientMatrix_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'OrientMatrix' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'OrientMatrix' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_common_msg_PoseResponse_common::get_arr(MDFactory_T& factory, const wam_common::Pose::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Pose","OrientMatrix"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_common/PoseResponse");
    // pose
    auto currentElement_pose = (msg + ctr)->pose;
    auto msgClassPtr_pose = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
    outArray[ctr]["Pose"] = msgClassPtr_pose->get_arr(factory, &currentElement_pose, loader);
    // orientMatrix
    auto currentElement_orientMatrix = (msg + ctr)->orientMatrix;
    auto msgClassPtr_orientMatrix = getCommonObject<std_msgs::Float32MultiArray>("std_msgs_msg_Float32MultiArray_common",loader);
    outArray[ctr]["OrientMatrix"] = msgClassPtr_orientMatrix->get_arr(factory, &currentElement_orientMatrix, loader);
    }
    return std::move(outArray);
  } 
class WAM_COMMON_EXPORT wam_common_Pose_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_common_Pose_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_common_Pose_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::Pose::Request,wam_common_msg_PoseRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<wam_common::Pose::Response,wam_common_msg_PoseResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          wam_common_Pose_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::Pose::Request,wam_common::Pose::Request::ConstPtr,wam_common_msg_PoseRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<wam_common::Pose::Response,wam_common::Pose::Response::ConstPtr,wam_common_msg_PoseResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          wam_common_Pose_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<wam_common::Pose::Request,wam_common::Pose::Response,wam_common_msg_PoseRequest_common,wam_common_msg_PoseResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          wam_common_Pose_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<wam_common::Pose,wam_common::Pose::Request,wam_common::Pose::Response,wam_common_msg_PoseRequest_common,wam_common_msg_PoseResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          wam_common_Pose_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::PoseRequest,wam_common_msg_PoseRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<wam_common::PoseResponse,wam_common_msg_PoseResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_PoseRequest_common, MATLABROSMsgInterface<wam_common::PoseRequest>)
CLASS_LOADER_REGISTER_CLASS(wam_common_msg_PoseResponse_common, MATLABROSMsgInterface<wam_common::PoseResponse>)
CLASS_LOADER_REGISTER_CLASS(wam_common_Pose_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
