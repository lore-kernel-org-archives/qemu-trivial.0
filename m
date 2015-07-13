Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEYCE-00074b-M7
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 03:30:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZEYC8-00071T-Fg
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 03:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZEYC7-0000cz-Mb
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 03:30:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1ZEYBz-0000aP-HM; Mon, 13 Jul 2015 03:30:23 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 80DB5B8BAD;
	Mon, 13 Jul 2015 07:30:22 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6D7UL9t001374; Mon, 13 Jul 2015 03:30:21 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 7000880B8B; Mon, 13 Jul 2015 09:30:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jul 2015 09:30:17 +0200
Message-Id: <1436772617-2490-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] virtio-input: enable on non-linux hosts
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
X-List-Received-Date: Mon, 13 Jul 2015 07:30:37 -0000

As we include a copy of the linux input layer header file in the qemu
source tree (include/standard-headers/linux/input.h) the virtio-input
bits (except pass-through) should build and work just fine on non-linux
hosts too.  Tweak Makefile accordingly.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/Makefile.objs b/hw/input/Makefile.objs
index 624ba7e..7715d72 100644
--- a/hw/input/Makefile.objs
+++ b/hw/input/Makefile.objs
@@ -8,9 +8,9 @@ common-obj-$(CONFIG_STELLARIS_INPUT) += stellaris_input.o
 common-obj-$(CONFIG_TSC2005) += tsc2005.o
 common-obj-$(CONFIG_VMMOUSE) += vmmouse.o
 
-ifeq ($(CONFIG_LINUX),y)
 common-obj-$(CONFIG_VIRTIO) += virtio-input.o
 common-obj-$(CONFIG_VIRTIO) += virtio-input-hid.o
+ifeq ($(CONFIG_LINUX),y)
 common-obj-$(CONFIG_VIRTIO) += virtio-input-host.o
 endif
 
-- 
1.8.3.1


