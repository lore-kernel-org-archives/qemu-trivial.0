Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eM7NH-0000Ld-KS
	for mharc-qemu-trivial@gnu.org; Tue, 05 Dec 2017 02:10:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eM7NF-0000JI-0X
	for qemu-trivial@nongnu.org; Tue, 05 Dec 2017 02:10:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eM7NE-0002YZ-5b
	for qemu-trivial@nongnu.org; Tue, 05 Dec 2017 02:10:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eM7N8-0002Us-7L; Tue, 05 Dec 2017 02:10:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9171DC047B60;
	Tue,  5 Dec 2017 07:10:28 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-124.ams2.redhat.com
	[10.36.116.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6286A840;
	Tue,  5 Dec 2017 07:10:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>
Date: Tue,  5 Dec 2017 08:10:25 +0100
Message-Id: <1512457825-3847-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 05 Dec 2017 07:10:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] hw/ide: Remove duplicated definitions
 from ahci_internal.h
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
X-List-Received-Date: Tue, 05 Dec 2017 07:10:38 -0000

The same definitions can also be found in include/hw/ide/ahci.h
so let's remove these #defines from ahci_internal.h.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Also remove TYPE_ICH9_AHCI as suggested by John

 hw/ide/ahci_internal.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index ce2e818..e3e3ed2 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -311,11 +311,6 @@ struct AHCIPCIState {
     AHCIState ahci;
 };
 
-#define TYPE_ICH9_AHCI "ich9-ahci"
-
-#define ICH_AHCI(obj) \
-    OBJECT_CHECK(AHCIPCIState, (obj), TYPE_ICH9_AHCI)
-
 extern const VMStateDescription vmstate_ahci;
 
 #define VMSTATE_AHCI(_field, _state) {                               \
@@ -375,11 +370,4 @@ void ahci_uninit(AHCIState *s);
 
 void ahci_reset(AHCIState *s);
 
-#define TYPE_SYSBUS_AHCI "sysbus-ahci"
-#define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj), TYPE_SYSBUS_AHCI)
-
-#define TYPE_ALLWINNER_AHCI "allwinner-ahci"
-#define ALLWINNER_AHCI(obj) OBJECT_CHECK(AllwinnerAHCIState, (obj), \
-                       TYPE_ALLWINNER_AHCI)
-
 #endif /* HW_IDE_AHCI_H */
-- 
1.8.3.1


