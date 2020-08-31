import QtQuick 2.0

ListView {
    id: list
    width: 200

    highlightMoveDuration: 200

    delegate: ItemDelegate {
        text: nameRole  // name must be provided by model's items
    }

    spacing: 6

    highlight: Rectangle {
        color: "lightsteelblue"
    }
}
