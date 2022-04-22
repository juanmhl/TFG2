// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for wam_msgs/Location
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
#include "wam_msgs/Location.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class WAM_MSGS_EXPORT wam_msgs_msg_Location_common : public MATLABROSMsgInterface<wam_msgs::Location> {
  public:
    virtual ~wam_msgs_msg_Location_common(){}
    virtual void copy_from_struct(wam_msgs::Location* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const wam_msgs::Location* msg, MultiLibLoader loader, size_t size = 1);
};
  void wam_msgs_msg_Location_common::copy_from_struct(wam_msgs::Location* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //header
        const matlab::data::StructArray header_arr = arr["Header"];
        auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
        msgClassPtr_header->copy_from_struct(&msg->header,header_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Header' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Header' is wrong type; expected a struct.");
    }
    try {
        //columna1_orientation
        const matlab::data::StructArray columna1_orientation_arr = arr["Columna1Orientation"];
        auto msgClassPtr_columna1_orientation = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
        msgClassPtr_columna1_orientation->copy_from_struct(&msg->columna1_orientation,columna1_orientation_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Columna1Orientation' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Columna1Orientation' is wrong type; expected a struct.");
    }
    try {
        //columna2_orientation
        const matlab::data::StructArray columna2_orientation_arr = arr["Columna2Orientation"];
        auto msgClassPtr_columna2_orientation = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
        msgClassPtr_columna2_orientation->copy_from_struct(&msg->columna2_orientation,columna2_orientation_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Columna2Orientation' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Columna2Orientation' is wrong type; expected a struct.");
    }
    try {
        //columna3_orientation
        const matlab::data::StructArray columna3_orientation_arr = arr["Columna3Orientation"];
        auto msgClassPtr_columna3_orientation = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
        msgClassPtr_columna3_orientation->copy_from_struct(&msg->columna3_orientation,columna3_orientation_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Columna3Orientation' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Columna3Orientation' is wrong type; expected a struct.");
    }
    try {
        //columna4_position
        const matlab::data::StructArray columna4_position_arr = arr["Columna4Position"];
        auto msgClassPtr_columna4_position = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
        msgClassPtr_columna4_position->copy_from_struct(&msg->columna4_position,columna4_position_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Columna4Position' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Columna4Position' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T wam_msgs_msg_Location_common::get_arr(MDFactory_T& factory, const wam_msgs::Location* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Columna1Orientation","Columna2Orientation","Columna3Orientation","Columna4Position"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("wam_msgs/Location");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // columna1_orientation
    auto currentElement_columna1_orientation = (msg + ctr)->columna1_orientation;
    auto msgClassPtr_columna1_orientation = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
    outArray[ctr]["Columna1Orientation"] = msgClassPtr_columna1_orientation->get_arr(factory, &currentElement_columna1_orientation, loader);
    // columna2_orientation
    auto currentElement_columna2_orientation = (msg + ctr)->columna2_orientation;
    auto msgClassPtr_columna2_orientation = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
    outArray[ctr]["Columna2Orientation"] = msgClassPtr_columna2_orientation->get_arr(factory, &currentElement_columna2_orientation, loader);
    // columna3_orientation
    auto currentElement_columna3_orientation = (msg + ctr)->columna3_orientation;
    auto msgClassPtr_columna3_orientation = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
    outArray[ctr]["Columna3Orientation"] = msgClassPtr_columna3_orientation->get_arr(factory, &currentElement_columna3_orientation, loader);
    // columna4_position
    auto currentElement_columna4_position = (msg + ctr)->columna4_position;
    auto msgClassPtr_columna4_position = getCommonObject<geometry_msgs::Point>("geometry_msgs_msg_Point_common",loader);
    outArray[ctr]["Columna4Position"] = msgClassPtr_columna4_position->get_arr(factory, &currentElement_columna4_position, loader);
    }
    return std::move(outArray);
  } 
class WAM_MSGS_EXPORT wam_msgs_Location_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~wam_msgs_Location_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          wam_msgs_Location_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<wam_msgs::Location,wam_msgs_msg_Location_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         wam_msgs_Location_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<wam_msgs::Location,wam_msgs::Location::ConstPtr,wam_msgs_msg_Location_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         wam_msgs_Location_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<wam_msgs::Location,wam_msgs_msg_Location_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(wam_msgs_msg_Location_common, MATLABROSMsgInterface<wam_msgs::Location>)
CLASS_LOADER_REGISTER_CLASS(wam_msgs_Location_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1