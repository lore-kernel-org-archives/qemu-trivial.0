Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vkv3S-00011P-MH
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2013 07:14:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Vkv3K-0000oh-5k
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 07:14:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Vkv3D-0000Qd-UM
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 07:14:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Vkv31-0000OA-Cb; Mon, 25 Nov 2013 07:13:51 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAPCDnVm016932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 25 Nov 2013 07:13:50 -0500
Received: from blackfin.pond.sub.org (ovpn-116-103.ams2.redhat.com
	[10.36.116.103])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rAPCDk8A029071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Nov 2013 07:13:48 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9F6C5200CD; Mon, 25 Nov 2013 13:08:18 +0100 (CET)
From: armbru@redhat.com
To: qemu-devel@nongnu.org
Date: Mon, 25 Nov 2013 13:08:18 +0100
Message-Id: <1385381298-3335-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] trace-events: Clean up after removal of old
	usb-host code
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
X-List-Received-Date: Mon, 25 Nov 2013 12:14:16 -0000

From: Markus Armbruster <armbru@redhat.com>

Commit b5613fd neglected to drop the trace events along with the code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 trace-events | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/trace-events b/trace-events
index 8695e9e..14c7c92 100644
--- a/trace-events
+++ b/trace-events
@@ -427,45 +427,32 @@ usb_uas_tmf_abort_task(int addr, uint16_t tag, uint16_t task_tag) "dev %d, tag 0
 usb_uas_tmf_logical_unit_reset(int addr, uint16_t tag, int lun) "dev %d, tag 0x%x, lun %d"
 usb_uas_tmf_unsupported(int addr, uint16_t tag, uint32_t function) "dev %d, tag 0x%x, function 0x%x"
 
-# hw/usb/host-linux.c
 # hw/usb/host-libusb.c
 usb_host_open_started(int bus, int addr) "dev %d:%d"
 usb_host_open_success(int bus, int addr) "dev %d:%d"
 usb_host_open_failure(int bus, int addr) "dev %d:%d"
-usb_host_disconnect(int bus, int addr) "dev %d:%d"
 usb_host_close(int bus, int addr) "dev %d:%d"
 usb_host_attach_kernel(int bus, int addr, int interface) "dev %d:%d, if %d"
 usb_host_detach_kernel(int bus, int addr, int interface) "dev %d:%d, if %d"
 usb_host_set_address(int bus, int addr, int config) "dev %d:%d, address %d"
 usb_host_set_config(int bus, int addr, int config) "dev %d:%d, config %d"
 usb_host_set_interface(int bus, int addr, int interface, int alt) "dev %d:%d, interface %d, alt %d"
-usb_host_claim_interfaces(int bus, int addr, int config, int nif) "dev %d:%d, config %d, nif %d"
 usb_host_claim_interface(int bus, int addr, int config, int interface) "dev %d:%d, config %d, if %d"
-usb_host_release_interfaces(int bus, int addr) "dev %d:%d"
 usb_host_release_interface(int bus, int addr, int interface) "dev %d:%d, if %d"
 usb_host_req_control(int bus, int addr, void *p, int req, int value, int index) "dev %d:%d, packet %p, req 0x%x, value %d, index %d"
 usb_host_req_data(int bus, int addr, void *p, int in, int ep, int size) "dev %d:%d, packet %p, in %d, ep %d, size %d"
 usb_host_req_complete(int bus, int addr, void *p, int status, int length) "dev %d:%d, packet %p, status %d, length %d"
 usb_host_req_emulated(int bus, int addr, void *p, int status) "dev %d:%d, packet %p, status %d"
 usb_host_req_canceled(int bus, int addr, void *p) "dev %d:%d, packet %p"
-usb_host_urb_submit(int bus, int addr, void *aurb, int length, int more) "dev %d:%d, aurb %p, length %d, more %d"
-usb_host_urb_complete(int bus, int addr, void *aurb, int status, int length, int more) "dev %d:%d, aurb %p, status %d, length %d, more %d"
-usb_host_urb_canceled(int bus, int addr, void *aurb) "dev %d:%d, aurb %p"
-usb_host_ep_set_halt(int bus, int addr, int ep) "dev %d:%d, ep %d"
-usb_host_ep_clear_halt(int bus, int addr, int ep) "dev %d:%d, ep %d"
 usb_host_iso_start(int bus, int addr, int ep) "dev %d:%d, ep %d"
 usb_host_iso_stop(int bus, int addr, int ep) "dev %d:%d, ep %d"
 usb_host_iso_out_of_bufs(int bus, int addr, int ep) "dev %d:%d, ep %d"
-usb_host_iso_many_urbs(int bus, int addr, int count) "dev %d:%d, count %d"
 usb_host_reset(int bus, int addr) "dev %d:%d"
 usb_host_auto_scan_enabled(void)
 usb_host_auto_scan_disabled(void)
-usb_host_claim_port(int bus, int hub, int port) "bus %d, hub addr %d, port %d"
-usb_host_parse_device(int bus, int addr, int vendor, int product) "dev %d:%d, id %04x:%04x"
 usb_host_parse_config(int bus, int addr, int value, int active) "dev %d:%d, value %d, active %d"
 usb_host_parse_interface(int bus, int addr, int num, int alt, int active) "dev %d:%d, num %d, alt %d, active %d"
 usb_host_parse_endpoint(int bus, int addr, int ep, const char *dir, const char *type, int active) "dev %d:%d, ep %d, %s, %s, active %d"
-usb_host_parse_unknown(int bus, int addr, int len, int type) "dev %d:%d, len %d, type %d"
 usb_host_parse_error(int bus, int addr, const char *errmsg) "dev %d:%d, msg %s"
 
 # hw/scsi/scsi-bus.c
-- 
1.8.1.4


