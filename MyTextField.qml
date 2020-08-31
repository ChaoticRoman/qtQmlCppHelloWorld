import QtQuick 2.0
import QtQuick.Controls 2.12

TextField {
    font.pointSize: 20
    anchors.margins: 12

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.selectAll();
            parent.focus=true;
        }
    }
}
