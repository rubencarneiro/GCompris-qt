/* GCompris - PaintItem.qml
 *
 * SPDX-FileCopyrightText: 2014 Bruno Coudoin <bruno.coudoin@gcompris.net>
 *
 * Authors:
 *   Christof Petig and Ingo Konrad (GTK+ version)
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (Qt Quick port)
 *
 *   SPDX-License-Identifier: GPL-3.0-or-later
 */
import QtQuick 2.6
import "simplepaint.js" as Activity
import GCompris 1.0

Item {
    id: paint
    property alias color: rectangle.color
    property double ix
    property double iy
    property int nbx
    property int nby
    property int initialX
    // Warning testing parent here, just to avoid an error at deletion time
    property double r: parent ? Math.min((parent.width - initialX) / nbx / 2, (parent.height - bar.height) / nby / 2) : 0
    property double offsetX: parent ? (initialX + parent.width % (width * nbx)) / 2 : 0
    property double offsetY: parent ? 10 : 0
    x: width * ix + offsetX
    y: height * iy + offsetY
    width: r * 2
    height: r * 2

    Rectangle {
        id: rectangle
        anchors.fill: parent
        border.width: bar.level == 1 ? 1 : 0
        border.color: "black"
    }

    function touched() {
        paint.color = Activity.getColor()
    }
}
