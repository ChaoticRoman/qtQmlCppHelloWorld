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

    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true // [1]
        onClicked: {
            parent.focus = true
            mouse.accepted = false // [1]
        }
    }
    // [1] https://stackoverflow.com/questions/42505727/qt-qml-can-a-mousearea-see-events-but-pass-them-all-to-parent-without-affectin
}
