Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWsRV-0003cY-GF
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 19:32:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWsRR-0003Zm-E6
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 19:32:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWsRQ-0007Js-Rl
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 19:31:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gWsRK-0007CK-H5; Tue, 11 Dec 2018 19:31:50 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4CFABDCD;
	Wed, 12 Dec 2018 00:31:49 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D5751019625;
	Wed, 12 Dec 2018 00:31:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Tue, 11 Dec 2018 22:31:47 -0200
Message-Id: <20181212003147.29604-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 12 Dec 2018 00:31:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] virt: Fix broken indentation
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
X-List-Received-Date: Wed, 12 Dec 2018 00:32:00 -0000

I introduced indentation using tabs instead of spaces in another
commit.  Peter reported the problem, and I failed to fix that
before sending my pull request.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 951597607696 ("virt: Eliminate separate instance_init functions")
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 17f1b49d11..5b678237b7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1854,7 +1854,7 @@ static const TypeInfo virt_machine_info = {
     .instance_size = sizeof(VirtMachineState),
     .class_size    = sizeof(VirtMachineClass),
     .class_init    = virt_machine_class_init,
-	.instance_init = virt_instance_init,
+    .instance_init = virt_instance_init,
     .interfaces = (InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
          { }
-- 
2.18.0.rc1.1.g3f1ff2140


