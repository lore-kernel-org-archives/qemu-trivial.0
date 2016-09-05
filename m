Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bgxaO-0004Rj-Ly
	for mharc-qemu-trivial@gnu.org; Mon, 05 Sep 2016 13:21:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bgxaM-0004Qc-TQ
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 13:21:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bgxaL-0005rC-SK
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 13:21:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bgxaH-0005qb-D3; Mon, 05 Sep 2016 13:21:25 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 757B683F3A;
	Mon,  5 Sep 2016 17:21:24 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-6-221.ams2.redhat.com
	[10.36.6.221])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u85HLMX6021422; Mon, 5 Sep 2016 13:21:23 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Corey Minyard <cminyard@mvista.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Mon,  5 Sep 2016 18:21:19 +0100
Message-Id: <1473096079-1310-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 05 Sep 2016 17:21:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ipmi: fix build config variable name for
 ipmi_bmc_extern.o
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
X-List-Received-Date: Mon, 05 Sep 2016 17:21:31 -0000

The original commit:

  commit 67aa56fc03bea44ccf384ea400515a8a58844a50
  Author: Corey Minyard <cminyard@mvista.com>
  Date:   Thu Dec 17 12:50:06 2015 -0600

    ipmi: Add an external connection simulation interface

defined a new variable CONFIG_IPMI_EXTERN, but then went
on to mistakely use the pre-existing CONFIG_IPMI_LOCAL
variable.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 hw/ipmi/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ipmi/Makefile.objs b/hw/ipmi/Makefile.objs
index a90318d..1b422bb 100644
--- a/hw/ipmi/Makefile.objs
+++ b/hw/ipmi/Makefile.objs
@@ -1,5 +1,5 @@
 common-obj-$(CONFIG_IPMI) += ipmi.o
 common-obj-$(CONFIG_IPMI_LOCAL) += ipmi_bmc_sim.o
-common-obj-$(CONFIG_IPMI_LOCAL) += ipmi_bmc_extern.o
+common-obj-$(CONFIG_IPMI_EXTERN) += ipmi_bmc_extern.o
 common-obj-$(CONFIG_ISA_IPMI_KCS) += isa_ipmi_kcs.o
 common-obj-$(CONFIG_ISA_IPMI_BT) += isa_ipmi_bt.o
-- 
2.7.4


