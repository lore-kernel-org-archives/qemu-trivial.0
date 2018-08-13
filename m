Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fpBO9-0004v0-QU
	for mharc-qemu-trivial@gnu.org; Mon, 13 Aug 2018 07:51:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fpBO7-0004tj-JW
	for qemu-trivial@nongnu.org; Mon, 13 Aug 2018 07:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fpBO6-0006E0-Rd
	for qemu-trivial@nongnu.org; Mon, 13 Aug 2018 07:51:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53260 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fpBO1-00068F-Os; Mon, 13 Aug 2018 07:51:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD387402333A;
	Mon, 13 Aug 2018 11:51:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-219.ams2.redhat.com [10.36.116.219])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D07BD112D167;
	Mon, 13 Aug 2018 11:51:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Harald Hoyer <harald@redhat.com>,
	qemu-trivial@nongnu.org
Date: Mon, 13 Aug 2018 13:51:44 +0200
Message-Id: <1534161104-8253-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 13 Aug 2018 11:51:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 13 Aug 2018 11:51:48 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] qemu-options: Fix bad "macaddr" property in
 the documentation
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
X-List-Received-Date: Mon, 13 Aug 2018 11:51:56 -0000

When using the "-device" option, the property is called "mac".
"macaddr" is only used for the legacy "-net nic" option.

Reported-by: Harald Hoyer <harald@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index b1bf0f4..3495531 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2345,7 +2345,7 @@ qemu-system-i386 linux.img \
                  -netdev socket,id=n2,mcast=230.0.0.1:1234
 # launch yet another QEMU instance on same "bus"
 qemu-system-i386 linux.img \
-                 -device e1000,netdev=n3,macaddr=52:54:00:12:34:58 \
+                 -device e1000,netdev=n3,mac=52:54:00:12:34:58 \
                  -netdev socket,id=n3,mcast=230.0.0.1:1234
 @end example
 
-- 
1.8.3.1


