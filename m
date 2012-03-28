Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCsmx-0008Jg-HI
	for mharc-qemu-trivial@gnu.org; Wed, 28 Mar 2012 09:19:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCsmn-0008Ir-Ic
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:19:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCsmi-0006TV-BF
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:19:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCsmi-0006TG-33
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:19:32 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2SDJUvj004170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <qemu-trivial@nongnu.org>; Wed, 28 Mar 2012 09:19:30 -0400
Received: from garlic.tlv.redhat.com (spice-ovirt.tlv.redhat.com [10.35.4.71])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id q2SDJTQD013565
	for <qemu-trivial@nongnu.org>; Wed, 28 Mar 2012 09:19:30 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-trivial@nongnu.org
Date: Wed, 28 Mar 2012 15:19:28 +0200
Message-Id: <1332940768-23755-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Makefile.target: add stp dependency on
	trace-events
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
X-List-Received-Date: Wed, 28 Mar 2012 13:19:47 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 Makefile.target |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.target b/Makefile.target
index 44b2e83..9f3c100 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -58,7 +58,7 @@ else
 TARGET_TYPE=system
 endif
 
-$(QEMU_PROG).stp:
+$(QEMU_PROG).stp: $(SRC_PATH)/trace-events
 	$(call quiet-command,sh $(SRC_PATH)/scripts/tracetool \
 		--$(TRACE_BACKEND) \
 		--binary $(bindir)/$(QEMU_PROG) \
-- 
1.7.9.3


