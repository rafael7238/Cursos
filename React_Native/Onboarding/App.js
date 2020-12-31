
import React from "react";
import { Image, StyleSheet, Text, View } from "react-native";
import AppIntroSlider from "react-native-app-intro-slider";

const slides = [
  {
    key: "one",
    title: "JUST TRAVEL",
    text:
      "Lorem ipsum dolor sit amet consecte tuer adipsing elit sed diam monum my nibh eusimod eltor",
    image: require("./images/1.png"),
  },
  {
    key: "two",
    title: "TAKE A BREAK",
    text:
      "Lorem ipsum dolor sit amet consecte tuer adipsing elit sed diam monum my nibh eusimod eltor",
    image: require("./images/2.png"),
  },
  {
    key: "three",
    title: "ENJOY YOUR JOURNEY",
    text:
      "Lorem ipsum dolor sit amet consecte tuer adipsing elit sed diam monum my nibh eusimod eltor",
    image: require("./images/3.png"),
  },
  {
    key: "four",
    title: "ENJOY YOUR JOURNEY",
    text:
      "Lorem ipsum dolor sit amet consecte tuer adipsing elit sed diam monum my nibh eusimod eltor",
    image: require("./images/3.png"),
  },
];

export default class App extends React.Component {

  state = { showHomePage: false };
  _renderItem = ({ item }) => {
    return (
      <View style={{ flex: 1, backgroundColor: "#8888" }}>
        <Image
          source={item.image}
          style={{
            resizeMode: "cover",
            height: "70%",
            width: "100%",
          }}
        />
        <Text
          style={{
            paddingTop: 25,
            paddingBottom: 10,
            fontSize: 23,
            fontWeight: "bold",
            color: "#21465b",
            alignSelf: "center",
          }}
        >
          {item.title}
        </Text>

        <Text style={{
          textAlign: "center",
          color: "#b5b5b9",
          fontSize: 15,

          paddingHorizontal: 30
        }}>
          {item.text}
        </Text>
      </View>
    );


  };

  _onDone = () => {
    console.warn("Acabou")
    // User finished the introduction. Show real app through
    // navigation or simply by controlling state
    this.setState({ showRealApp: true });
  }

  render() {
    if (this.showRealApp) {
      return <App />
    } else
      return (
        <AppIntroSlider
          renderItem={this._renderItem}
          data={slides}
          doneLabel="Acessar"
          nextLabel="Próximo"
          prevLabel="Anterior"
          showPrevButton={true}
          activeDotStyle={{
            backgroundColor: "#21465b",
            paddingTop: 10,
            width: 30
          }}
          onDone={this._onDone}
        />

      );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});