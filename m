Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dh8aI-0007Ya-FX
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 02:10:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dh8aG-0007XX-RZ
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 02:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dh8aF-0003XH-ME
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 02:10:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dh8a9-0003Sn-B0; Mon, 14 Aug 2017 02:10:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02C0053215;
	Mon, 14 Aug 2017 06:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 02C0053215
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-101.ams2.redhat.com
	[10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6754478016;
	Mon, 14 Aug 2017 06:10:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, KONRAD Frederic <fred.konrad@greensocs.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Aug 2017 08:10:29 +0200
Message-Id: <1502691029-11112-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 14 Aug 2017 06:10:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.10] hw/misc/mmio_interface: Return
 after error_setg() to avoid crash
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
X-List-Received-Date: Mon, 14 Aug 2017 06:10:41 -0000

QEMU currently abort()s if the user tries to specify the mmio_interface
device without parameters:

x86_64-softmmu/qemu-system-x86_64 -nographic -device mmio_interface
qemu-system-x86_64: /home/thuth/devel/qemu/util/error.c:57: error_setv:
 Assertion `*errp == ((void *)0)' failed.
Aborted (core dumped)

This happens because the realize function is trying to set the errp
twice in this case. After setting an error, the realize function
should immediately return instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/mmio_interface.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/mmio_interface.c b/hw/misc/mmio_interface.c
index 6f004d2..da154e5 100644
--- a/hw/misc/mmio_interface.c
+++ b/hw/misc/mmio_interface.c
@@ -63,10 +63,12 @@ static void mmio_interface_realize(DeviceState *dev, Error **errp)
 
     if (!s->host_ptr) {
         error_setg(errp, "host_ptr property must be set");
+        return;
     }
 
     if (!s->subregion) {
         error_setg(errp, "subregion property must be set");
+        return;
     }
 
     memory_region_init_ram_ptr(&s->ram_mem, OBJECT(s), "ram",
-- 
1.8.3.1


