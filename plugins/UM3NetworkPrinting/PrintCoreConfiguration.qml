import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import UM 1.2 as UM


Item
{
    id: extruderInfo
    property var printCoreConfiguration

    width: Math.round(parent.width / 2)
    height: childrenRect.height

    Item
    {
        id: extruderCircle
        width: 30
        height: 30
        Rectangle
        {
            anchors.fill: parent
            radius: Math.round(width / 2)
            border.width: 1
            border.color: "black"
        }

        Label
        {
            anchors.centerIn: parent
            font: UM.Theme.getFont("default_bold")
            text: printCoreConfiguration.position + 1
        }
    }

    Label
    {
        id: materialLabel
        text: printCoreConfiguration.activeMaterial != null ? printCoreConfiguration.activeMaterial.name : ":("
        elide: Text.ElideRight
        width: parent.width
        font: UM.Theme.getFont("default_bold")
        anchors.left: extruderCircle.right
        anchors.leftMargin: UM.Theme.getSize("default_margin").height
    }

    Label
    {
        id: printCoreLabel
        text: printCoreConfiguration.hotendID
        anchors.top: materialLabel.bottom
        elide: Text.ElideRight
        width: parent.width
        anchors.left: extruderCircle.right
        anchors.leftMargin: UM.Theme.getSize("default_margin").height
    }
}
