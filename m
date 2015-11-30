Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a3KUK-0001CA-VL
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2015 04:11:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a3KUI-00017t-7t
	for qemu-trivial@nongnu.org; Mon, 30 Nov 2015 04:11:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a3KUE-0003Ly-5b
	for qemu-trivial@nongnu.org; Mon, 30 Nov 2015 04:11:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a3KU4-0003Ip-5z; Mon, 30 Nov 2015 04:10:56 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 3AE2496C8;
	Mon, 30 Nov 2015 09:10:55 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-67.ams2.redhat.com
	[10.36.112.67])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAU9ArJG018161; Mon, 30 Nov 2015 04:10:54 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 30 Nov 2015 10:10:52 +0100
Message-Id: <1448874652-11648-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v4] bt: check struct sizes
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
X-List-Received-Date: Mon, 30 Nov 2015 09:11:11 -0000

See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
reasons these do not use sizeof, and Coverity caught a mistake in
EVT_ENCRYPT_CHANGE_SIZE.

In addition:

- remove status from create_conn_cancel_cp; the "status" field is only
in rp structs.  Note that this means that the OCF_CREATE_CONN_CANCEL
could never have worked (it would have failed the LENGTH_CHECK), but
I am keeping it anyway.

- remove read_link_quality_cp altogether; it's off by two, BlueZ doesn't
know about it and it seems like a wrong copy of read_link_policy_cp;

- fix inquiry_info which is shorter by one: the kernel has a struct that
is 14 byte long, but not counting the initial num_responses byte which
the kernel parses separately;

- remove extended_inquiry_info altogether, since it's not used and unlike
the other inquiry structs does not have the initial num_responses byte.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/bt.h | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/include/hw/bt.h b/include/hw/bt.h
index cb2a7e6..706869f 100644
--- a/include/hw/bt.h
+++ b/include/hw/bt.h
@@ -504,7 +504,6 @@ typedef struct {
 
 #define OCF_CREATE_CONN_CANCEL		0x0008
 typedef struct {
-    uint8_t	status;
     bdaddr_t	bdaddr;
 } QEMU_PACKED create_conn_cancel_cp;
 #define CREATE_CONN_CANCEL_CP_SIZE 6
@@ -1266,15 +1265,10 @@ typedef struct {
     uint8_t	status;
     uint16_t	handle;
 } QEMU_PACKED reset_failed_contact_counter_rp;
-#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 4
+#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 3
 
 #define OCF_READ_LINK_QUALITY		0x0003
 typedef struct {
-    uint16_t	handle;
-} QEMU_PACKED read_link_quality_cp;
-#define READ_LINK_QUALITY_CP_SIZE 4
-
-typedef struct {
     uint8_t	status;
     uint16_t	handle;
     uint8_t	link_quality;
@@ -1332,7 +1326,7 @@ typedef struct {
     uint8_t	dev_class[3];
     uint16_t	clock_offset;
 } QEMU_PACKED inquiry_info;
-#define INQUIRY_INFO_SIZE 14
+#define INQUIRY_INFO_SIZE 15
 
 #define EVT_CONN_COMPLETE		0x03
 typedef struct {
@@ -1381,7 +1375,7 @@ typedef struct {
     uint16_t	handle;
     uint8_t	encrypt;
 } QEMU_PACKED evt_encrypt_change;
-#define EVT_ENCRYPT_CHANGE_SIZE 5
+#define EVT_ENCRYPT_CHANGE_SIZE 4
 
 #define EVT_CHANGE_CONN_LINK_KEY_COMPLETE	0x09
 typedef struct {
@@ -1629,18 +1623,6 @@ typedef struct {
 } QEMU_PACKED evt_sniff_subrate;
 #define EVT_SNIFF_SUBRATE_SIZE 11
 
-#define EVT_EXTENDED_INQUIRY_RESULT	0x2F
-typedef struct {
-    bdaddr_t	bdaddr;
-    uint8_t	pscan_rep_mode;
-    uint8_t	pscan_period_mode;
-    uint8_t	dev_class[3];
-    uint16_t	clock_offset;
-    int8_t	rssi;
-    uint8_t	data[240];
-} QEMU_PACKED extended_inquiry_info;
-#define EXTENDED_INQUIRY_INFO_SIZE 254
-
 #define EVT_TESTING			0xFE
 
 #define EVT_VENDOR			0xFF
-- 
2.5.0


