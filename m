Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDTM-0005gX-Eg
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:15:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTG-0005dS-OX
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTE-0003mp-Qb
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDT5-0003iG-6Y; Wed, 15 Jun 2016 12:15:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA4698E3E4;
	Wed, 15 Jun 2016 16:15:02 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUo011275; Wed, 15 Jun 2016 12:15:01 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Date: Wed, 15 Jun 2016 18:14:31 +0200
Message-Id: <1466007277-17525-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 15 Jun 2016 16:15:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/7] coccinelle: add a script to remove
 useless casts
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
X-List-Received-Date: Wed, 15 Jun 2016 16:15:19 -0000

Script from LKML.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/coccinelle/typecast.cocci | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 scripts/coccinelle/typecast.cocci

diff --git a/scripts/coccinelle/typecast.cocci b/scripts/coccinelle/typecast.cocci
new file mode 100644
index 0000000..be2183e
--- /dev/null
+++ b/scripts/coccinelle/typecast.cocci
@@ -0,0 +1,7 @@
+// Remove useless casts
+@@
+type T;
+T v;
+@@
+-	(T *)&v
++	&v
-- 
2.5.5


