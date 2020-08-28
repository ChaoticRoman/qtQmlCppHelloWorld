import QtQuick 2.0

ListView {
    id: list
    width: 200

    delegate: ItemDelegate {
        text: name  // name must be provided by model's items
    }

    spacing: 6

    highlight: Rectangle {
        color: "lightsteelblue"
    }
}
