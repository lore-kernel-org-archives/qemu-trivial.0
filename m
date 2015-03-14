Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWei5-0002ux-Gc
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 01:34:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWei0-0002oN-2e
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 01:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWehj-0002zZ-Cx
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 01:34:00 -0400
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:35382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWehj-0002xW-28
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 01:33:43 -0400
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 05:33:40 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 05:33:37 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id EACD6219004D; 
	Sat, 14 Mar 2015 05:33:26 +0000 (GMT)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E5Xae77930278; Sat, 14 Mar 2015 05:33:36 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E5XaS4025289; Fri, 13 Mar 2015 23:33:36 -0600
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E5XZ7i025274; Fri, 13 Mar 2015 23:33:35 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Date: Sat, 14 Mar 2015 06:33:35 +0100
Message-Id: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031405-0013-0000-0000-0000034D577A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] hw/usb: Include USB files only if necessary
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
X-List-Received-Date: Sat, 14 Mar 2015 05:34:03 -0000

Boards that do not include an USB controller should not provide
USB devices. However, when running "qemu-system-s390x -device help"
for example, there's still a usb-hub, usb-kbd, usb-mouse and
usb-tablet in the list of "supported" devices. Let's fix that
by compiling and linking the USB files only if it's really
necessary.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
---
 default-configs/arm-softmmu.mak |    1 +
 default-configs/usb.mak         |    1 +
 hw/usb/Makefile.objs            |    8 ++++----
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 87d4e34..a767e4b 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -32,6 +32,7 @@ CONFIG_DS1338=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_PFLASH_CFI02=y
 CONFIG_MICRODRIVE=y
+CONFIG_USB=y
 CONFIG_USB_MUSB=y
 CONFIG_USB_EHCI_SYSBUS=y
 CONFIG_PLATFORM_BUS=y
diff --git a/default-configs/usb.mak b/default-configs/usb.mak
index 73d8489..f4b8568 100644
--- a/default-configs/usb.mak
+++ b/default-configs/usb.mak
@@ -1,3 +1,4 @@
+CONFIG_USB=y
 CONFIG_USB_TABLET_WACOM=y
 CONFIG_USB_STORAGE_BOT=y
 CONFIG_USB_STORAGE_UAS=y
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 0ccd477..c514831 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -1,6 +1,6 @@
 # usb subsystem core
-common-obj-y += core.o combined-packet.o bus.o desc.o desc-msos.o
-common-obj-y += libhw.o
+common-obj-y += core.o bus.o libhw.o
+common-obj-$(CONFIG_USB) +=  combined-packet.o desc.o desc-msos.o
 
 # usb host adapters
 common-obj-$(CONFIG_USB_UHCI) += hcd-uhci.o
@@ -11,8 +11,8 @@ common-obj-$(CONFIG_USB_XHCI) += hcd-xhci.o
 common-obj-$(CONFIG_USB_MUSB) += hcd-musb.o
 
 # emulated usb devices
-common-obj-y += dev-hub.o
-common-obj-y += dev-hid.o
+common-obj-$(CONFIG_USB) += dev-hub.o
+common-obj-$(CONFIG_USB) += dev-hid.o
 common-obj-$(CONFIG_USB_TABLET_WACOM) += dev-wacom.o
 common-obj-$(CONFIG_USB_STORAGE_BOT)  += dev-storage.o
 common-obj-$(CONFIG_USB_STORAGE_UAS)  += dev-uas.o
-- 
1.7.1


