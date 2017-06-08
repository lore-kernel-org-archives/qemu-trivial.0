Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIxLH-0005yF-26
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 09:19:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIxLE-0005w2-Bf
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIxLB-0003PL-3H
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:19:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39400)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dIxL1-0003Hk-QH; Thu, 08 Jun 2017 09:18:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A3277D4ED;
	Thu,  8 Jun 2017 13:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8A3277D4ED
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8A3277D4ED
Received: from thh440s.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB56592200;
	Thu,  8 Jun 2017 13:18:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Juan Quintela <quintela@redhat.com>, Andrew Jones <drjones@redhat.com>
Date: Thu,  8 Jun 2017 15:18:54 +0200
Message-Id: <1496927934-21815-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 08 Jun 2017 13:18:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/cpu: core.c can be compiled as common
 object
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
X-List-Received-Date: Thu, 08 Jun 2017 13:19:13 -0000

There does not seem to be any target specific code in core.c, so we can
put it into "common-obj" instead of "obj" to compile it only once for
all targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/Makefile.objs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/cpu/Makefile.objs b/hw/cpu/Makefile.objs
index 942a4bb..cd52d20 100644
--- a/hw/cpu/Makefile.objs
+++ b/hw/cpu/Makefile.objs
@@ -2,5 +2,4 @@ obj-$(CONFIG_ARM11MPCORE) += arm11mpcore.o
 obj-$(CONFIG_REALVIEW) += realview_mpcore.o
 obj-$(CONFIG_A9MPCORE) += a9mpcore.o
 obj-$(CONFIG_A15MPCORE) += a15mpcore.o
-obj-y += core.o
-
+common-obj-y += core.o
-- 
1.8.3.1


