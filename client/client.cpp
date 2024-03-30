#include <unistd.h>
#include <memory>
#include <iostream>
#include <string>
#include "CommonAPI/CommonAPI.hpp"
#include "v1/com/ford/rnd/MLTypes.hpp"
#include "v1/com/ford/rnd/MLProxy.hpp"
#include "v1/com/ford/rnd/SmartMLProxy.hpp"

using ::v1::com::ford::rnd::MLProxy;
using ::v1::com::ford::rnd::MLProxyDefault;
using ::v1::com::ford::rnd::SmartMLProxy;
using ::v1::com::ford::rnd::SmartMLProxyDefault;
using ::v1::com::ford::rnd::ML;
using ::v1::com::ford::rnd::MLTypes;

std::ostream& operator<<(std::ostream& out, const MLTypes::Person& person) {
  return out << "Person(" << person.getId() << ", " << person.getName() << ")\n";
}

std::ostream& operator<<(std::ostream& out, const MLTypes::Staff& staff) {
  for (auto person : staff) {
    out << person;
  }
  return out;
}

std::ostream& operator<<(std::ostream& out, const MLTypes::Countries& countries) {
  for (auto country : countries) {
    out << country.first << " -> " << country.second << std::endl;
  }
  return out;
}

int main() {
  std::string domain = "local";
  std::string instance = "com.ford.rnd.ML";
  std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get();
  std::shared_ptr<MLProxyDefault> myProxy = runtime->buildProxy < MLProxy
      > (domain, instance);

  if (!myProxy) {
    std::cout << "Could not build proxy\n";
    return 1;
  }

  std::cout << "Checking availability!\n";
  while (!myProxy->isAvailable()) {
    usleep(10);
  }
  std::cout << "Available...\n";

  myProxy->getNameAttribute().getChangedEvent().subscribe(
      [](const std::string& value) {
        std::cout << "Name is changed: " << value << std::endl;
      });

  myProxy->getGetOutEvent().subscribe([](const std::string& value) {
    std::cout << "GetOut! " << value << std::endl;
  });

  CommonAPI::CallStatus callStatus;
  std::string returnMessage;
  myProxy->sayHello("Bob", callStatus, returnMessage);
  std::cout << "Got message: " << returnMessage << std::endl;

  uint64_t count = 0;
  myProxy->howMuch(callStatus, count);
  std::cout << "Cost: " << count << std::endl;

  std::string nameval;
  myProxy->getNameAttribute().getValue(callStatus, nameval);
  std::cout << "Name: " << nameval << std::endl;

  myProxy->getNameAttribute().setValue("Kate", callStatus, nameval);
  std::cout << "Name: " << nameval << std::endl;

  ML::DeviceType deviceType;
  myProxy->getDeviceType(callStatus, deviceType);
  std::cout << "Device type: " << deviceType << std::endl;

  MLTypes::ConnectionType connType;
  myProxy->getConnectionType(callStatus, connType);
  std::cout << "Connection type: " << connType << std::endl;

  MLTypes::Person person;
  myProxy->getLastPerson(callStatus, person);
  std::cout << "Last person: " << person << std::endl;

  MLTypes::Staff staff;
  myProxy->getStaff("Taxoft", callStatus, staff);
  std::cout << "Staff: " << staff << std::endl;

  MLTypes::Countries countries;
  myProxy->getCountries(callStatus, countries);
  std::cout << "Countries: " << countries << std::endl;

  std::string s_instance = "com.ford.rnd.SmartML";
  std::shared_ptr<SmartMLProxyDefault> mySProxy = runtime->buildProxy
      < SmartMLProxy > (domain, s_instance);

  if (!mySProxy) {
    std::cout << "Could not build smart proxy\n";
    return 1;
  }

  std::cout << "Checking availability!\n";
  while (!mySProxy->isAvailable()) {
    usleep(10);
  }
  std::cout << "Available...\n";

  mySProxy->sayHello("Katy", callStatus, returnMessage);
  std::cout << "Got message: " << returnMessage << std::endl;

  mySProxy->getGetOutEvent().subscribe([](const std::string& value) {
    std::cout << "Smart GetOut! " << value << std::endl;
  });

  mySProxy->getThrowOutEvent().subscribe([](const std::string& value) {
    std::cout << "ThrowOut! " << value << std::endl;
  });

  mySProxy->howMuch(callStatus, count);
  std::cout << "Cost: " << count << std::endl;

  int16_t timeout = 3;
  mySProxy->ping(timeout, callStatus);

  sleep(5);

  return 0;
}
