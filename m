Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gosu4-0000tc-J2
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 11:39:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gosu2-0000ro-9P
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 11:39:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gosu1-0002X3-JL
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 11:39:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gostx-0002Ue-MR; Wed, 30 Jan 2019 11:39:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0680550BB;
	Wed, 30 Jan 2019 16:39:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-210.ams2.redhat.com [10.36.116.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DEE6608C1;
	Wed, 30 Jan 2019 16:39:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed, 30 Jan 2019 17:39:42 +0100
Message-Id: <1548866382-14488-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 30 Jan 2019 16:39:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/ppc: Don't include m48t59.h if it is not
 necessary
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
X-List-Received-Date: Wed, 30 Jan 2019 16:39:55 -0000

These files don't use anything from m48t59.h, so no need to include
this header here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ppc/mac_newworld.c | 1 -
 hw/ppc/mac_oldworld.c | 1 -
 hw/ppc/ppc.c          | 2 --
 hw/ppc/ppc_booke.c    | 1 -
 4 files changed, 5 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index bb19eab..f1c8400 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -53,7 +53,6 @@
 #include "hw/ppc/mac.h"
 #include "hw/input/adb.h"
 #include "hw/ppc/mac_dbdma.h"
-#include "hw/timer/m48t59.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 817f70e..98d531d 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -30,7 +30,6 @@
 #include "hw/ppc/ppc.h"
 #include "mac.h"
 #include "hw/input/adb.h"
-#include "hw/timer/m48t59.h"
 #include "sysemu/sysemu.h"
 #include "net/net.h"
 #include "hw/isa/isa.h"
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 98b409f..cffdc39 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -30,10 +30,8 @@
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpus.h"
-#include "hw/timer/m48t59.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
-#include "hw/loader.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "trace.h"
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 23bcf1b..4f11e00 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -28,7 +28,6 @@
 #include "hw/ppc/ppc.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
-#include "hw/timer/m48t59.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_ppc.h"
-- 
1.8.3.1


