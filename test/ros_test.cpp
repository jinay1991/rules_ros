///
/// @file
/// @copyright Copyright (c) 2020. MIT License.
///
#include <gmock/gmock.h>
#include <gtest/gtest.h>
#include <ros/ros.h>
#include <ros/types.h>
#include <std_msgs/String.h>

namespace
{

class RosPubSubTest : public ::testing::Test
{
  public:
    RosPubSubTest()
        : name_{"chatter"}, node_{"chatter"}, publisher_{node_.advertise<std_msgs::String>(name_, 1000)}, loop_rate_{10}
    {
    }

  protected:
    void SetUp() override {}

    void RunOnce()
    {
        std_msgs::String msg;
        msg.data = "hello world!!\n";
        std::cout << "----\n";
        // ROS_INFO("%s", msg.data.c_str());

        // publisher_.publish(msg);
        // ros::spinOnce();
        // loop_rate_.sleep();
    }

  private:
    const std::string name_;
    ros::NodeHandle node_;
    ros::Publisher publisher_;
    ros::Rate loop_rate_;
};

// TEST_F(RosPubSubTest, GivenPublishedMessage_ExpectSameSubscribed)
// {
//     //     // When
//     //     RunOnce();
// }

}  // namespace

int main(int argc, char** argv)
{
    // ros::init(argc, argv, "chatter");
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
