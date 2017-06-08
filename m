Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIyGK-0008M7-VC
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 10:18:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIyGJ-0008L4-IH
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 10:18:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIyGI-0002OO-LT
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 10:18:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55542)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dIyGE-0002Jn-9M; Thu, 08 Jun 2017 10:18:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8CFBC0010A2;
	Thu,  8 Jun 2017 14:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C8CFBC0010A2
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C8CFBC0010A2
Received: from thh440s.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5385283840;
	Thu,  8 Jun 2017 14:18:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>, Andrew Jones <drjones@redhat.com>
Date: Thu,  8 Jun 2017 16:18:02 +0200
Message-Id: <1496931482-29914-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 08 Jun 2017 14:18:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Makefile: Move balloon.o,
 numa.o and bootdevice.o to common-obj-y
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 14:18:12 -0000

There does not seem to be any target specific code in these files, so
we can put them into "common-obj" instead of "obj" to compile them only
once for all targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile.objs   | 1 +
 Makefile.target | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 0575802..a949502 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -40,6 +40,7 @@ io-obj-y = io/
 
 ifeq ($(CONFIG_SOFTMMU),y)
 common-obj-y = blockdev.o blockdev-nbd.o block/
+common-obj-y += balloon.o numa.o bootdevice.o
 common-obj-y += iothread.o
 common-obj-y += net/
 common-obj-y += qdev-monitor.o device-hotplug.o
diff --git a/Makefile.target b/Makefile.target
index ce8dfe4..da37258 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -139,8 +139,7 @@ endif #CONFIG_BSD_USER
 #########################################################
 # System emulator target
 ifdef CONFIG_SOFTMMU
-obj-y += arch_init.o cpus.o monitor.o gdbstub.o balloon.o ioport.o numa.o
-obj-y += qtest.o bootdevice.o
+obj-y += arch_init.o cpus.o monitor.o gdbstub.o ioport.o qtest.o
 obj-y += hw/
 obj-$(CONFIG_KVM) += kvm-all.o
 obj-y += memory.o cputlb.o
-- 
1.8.3.1


