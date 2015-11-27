Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2NGj-0003eg-GW
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 12:57:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2NGg-0003b4-SP
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:57:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2NGf-0001Bj-Ke
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:57:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a2NGb-0001B6-H4; Fri, 27 Nov 2015 12:57:05 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 0FF6971;
	Fri, 27 Nov 2015 17:57:05 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-19.ams2.redhat.com
	[10.36.112.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tARHv2PE006859; Fri, 27 Nov 2015 12:57:03 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Nov 2015 18:57:02 +0100
Message-Id: <1448647022-8379-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH v2] bt: check struct sizes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Nov 2015 17:57:12 -0000

See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
reasons these do not use sizeof, and Coverity caught a mistake in
EVT_ENCRYPT_CHANGE_SIZE.

Note other sizes that seem wrong or inconsistent with the kernel header.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/bt.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/bt.h b/include/hw/bt.h
index cb2a7e6..bc32807 100644
--- a/include/hw/bt.h
+++ b/include/hw/bt.h
@@ -507,6 +507,7 @@ typedef struct {
     uint8_t	status;
     bdaddr_t	bdaddr;
 } QEMU_PACKED create_conn_cancel_cp;
+/* FIXME: 6 or 7? Kernel doesn't have status??  */
 #define CREATE_CONN_CANCEL_CP_SIZE 6
 
 typedef struct {
@@ -1266,12 +1267,13 @@ typedef struct {
     uint8_t	status;
     uint16_t	handle;
 } QEMU_PACKED reset_failed_contact_counter_rp;
-#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 4
+#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 3
 
 #define OCF_READ_LINK_QUALITY		0x0003
 typedef struct {
     uint16_t	handle;
 } QEMU_PACKED read_link_quality_cp;
+/* FIXME: 2 or 4?? */
 #define READ_LINK_QUALITY_CP_SIZE 4
 
 typedef struct {
@@ -1332,6 +1334,7 @@ typedef struct {
     uint8_t	dev_class[3];
     uint16_t	clock_offset;
 } QEMU_PACKED inquiry_info;
+/* FIXME: 15 or 14??  Kernel doesn't have num_responses.  */
 #define INQUIRY_INFO_SIZE 14
 
 #define EVT_CONN_COMPLETE		0x03
@@ -1381,7 +1384,7 @@ typedef struct {
     uint16_t	handle;
     uint8_t	encrypt;
 } QEMU_PACKED evt_encrypt_change;
-#define EVT_ENCRYPT_CHANGE_SIZE 5
+#define EVT_ENCRYPT_CHANGE_SIZE 4
 
 #define EVT_CHANGE_CONN_LINK_KEY_COMPLETE	0x09
 typedef struct {
@@ -1570,6 +1573,7 @@ typedef struct {
     uint16_t	clock_offset;
     int8_t	rssi;
 } QEMU_PACKED inquiry_info_with_rssi;
+/* FIXME: 15 or 14??  Kernel doesn't have num_responses.  */
 #define INQUIRY_INFO_WITH_RSSI_SIZE 15
 typedef struct {
     uint8_t	num_responses;
@@ -1581,6 +1585,7 @@ typedef struct {
     uint16_t	clock_offset;
     int8_t	rssi;
 } QEMU_PACKED inquiry_info_with_rssi_and_pscan_mode;
+/* FIXME: 16 or 15??  Kernel doesn't have num_responses.  */
 #define INQUIRY_INFO_WITH_RSSI_AND_PSCAN_MODE_SIZE 16
 
 #define EVT_READ_REMOTE_EXT_FEATURES_COMPLETE	0x23
@@ -1639,6 +1644,7 @@ typedef struct {
     int8_t	rssi;
     uint8_t	data[240];
 } QEMU_PACKED extended_inquiry_info;
+/* FIXME: 254 or 255??  Should there be num_responses here too?  */
 #define EXTENDED_INQUIRY_INFO_SIZE 254
 
 #define EVT_TESTING			0xFE
-- 
2.5.0


