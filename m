Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kJZ-0006RP-9N
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 01:57:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJT-0006CS-5a
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJS-0000Kb-1M
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kJN-0000ID-E2; Fri, 04 Dec 2015 01:57:45 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0812140687;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CEA0BAAF;
	Fri,  4 Dec 2015 09:57:42 +0300 (MSK)
Received: (nullmailer pid 7971 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:40 +0300
Message-Id: <98475746b357f6c048caf9e001998d8a0618b2e4.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 9/9] bt: check struct sizes
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
X-List-Received-Date: Fri, 04 Dec 2015 06:57:52 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
reasons these do not use sizeof, and Coverity caught a mistake in
EVT_ENCRYPT_CHANGE_SIZE.

In addition:

- remove status from create_conn_cancel_cp; the "status" field is only
in rp structs.  Note that this means that the OCF_CREATE_CONN_CANCEL
could never have worked (it would have failed the LENGTH_CHECK), but
I am keeping it anyway.

- OCF_READ_LINK_QUALITY similarly could never have worked, but I am
fixing read_link_quality_cp anyway.

- fix inquiry_info which is shorter by one: the kernel has a struct that
is 14 byte long, but not counting the initial num_responses byte which
the kernel parses separately;

- remove extended_inquiry_info altogether, since it's not used and unlike
the other inquiry structs does not have the initial num_responses byte.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/bt.h | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/include/hw/bt.h b/include/hw/bt.h
index cb2a7e6..c7c7909 100644
--- a/include/hw/bt.h
+++ b/include/hw/bt.h
@@ -504,7 +504,6 @@ typedef struct {
 
 #define OCF_CREATE_CONN_CANCEL		0x0008
 typedef struct {
-    uint8_t	status;
     bdaddr_t	bdaddr;
 } QEMU_PACKED create_conn_cancel_cp;
 #define CREATE_CONN_CANCEL_CP_SIZE 6
@@ -1266,13 +1265,13 @@ typedef struct {
     uint8_t	status;
     uint16_t	handle;
 } QEMU_PACKED reset_failed_contact_counter_rp;
-#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 4
+#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 3
 
 #define OCF_READ_LINK_QUALITY		0x0003
 typedef struct {
     uint16_t	handle;
 } QEMU_PACKED read_link_quality_cp;
-#define READ_LINK_QUALITY_CP_SIZE 4
+#define READ_LINK_QUALITY_CP_SIZE 2
 
 typedef struct {
     uint8_t	status;
@@ -1332,7 +1331,7 @@ typedef struct {
     uint8_t	dev_class[3];
     uint16_t	clock_offset;
 } QEMU_PACKED inquiry_info;
-#define INQUIRY_INFO_SIZE 14
+#define INQUIRY_INFO_SIZE 15
 
 #define EVT_CONN_COMPLETE		0x03
 typedef struct {
@@ -1381,7 +1380,7 @@ typedef struct {
     uint16_t	handle;
     uint8_t	encrypt;
 } QEMU_PACKED evt_encrypt_change;
-#define EVT_ENCRYPT_CHANGE_SIZE 5
+#define EVT_ENCRYPT_CHANGE_SIZE 4
 
 #define EVT_CHANGE_CONN_LINK_KEY_COMPLETE	0x09
 typedef struct {
@@ -1629,18 +1628,6 @@ typedef struct {
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
2.1.4


