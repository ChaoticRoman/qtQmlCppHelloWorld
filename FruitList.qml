import QtQuick 2.0

ListView {
    width: 180; height: 200

    model: FruitListModel {}

    delegate: Text {
        text: name
    }
}
