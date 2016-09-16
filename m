Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktei-0004NR-5S
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteb-0004FX-Gm
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteZ-0007vm-PE
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bkteS-0007le-5S; Fri, 16 Sep 2016 09:58:00 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20D2E552C9;
	Fri, 16 Sep 2016 13:56:22 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHk3024127; Fri, 16 Sep 2016 09:56:20 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:55:52 +0200
Message-Id: <1474034177-17663-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 16 Sep 2016 13:56:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 01/26] coccinelle: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:14 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/coccinelle/exit.cocci | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 scripts/coccinelle/exit.cocci

diff --git a/scripts/coccinelle/exit.cocci b/scripts/coccinelle/exit.cocci
new file mode 100644
index 0000000..73386c0
--- /dev/null
+++ b/scripts/coccinelle/exit.cocci
@@ -0,0 +1,12 @@
+// replace exit(0) by exit(EXIT_SUCCESS)
+//         exit(1) by exit(EXIT_FAILURE)
+
+@@
+@@
+(
+- exit(0)
++ exit(EXIT_SUCCESS)
+|
+- exit(1)
++ exit(EXIT_FAILURE)
+)
-- 
2.5.5


