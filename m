Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eazNh-0005rF-8F
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jan 2018 02:40:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eazNe-0005oi-Nf
	for qemu-trivial@nongnu.org; Mon, 15 Jan 2018 02:40:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eazNd-0004Xl-KT
	for qemu-trivial@nongnu.org; Mon, 15 Jan 2018 02:40:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eazNV-0004IY-Cv; Mon, 15 Jan 2018 02:40:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F68213A4E;
	Mon, 15 Jan 2018 07:40:20 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-134.ams2.redhat.com
	[10.36.116.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE99B60C97;
	Mon, 15 Jan 2018 07:40:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Mon, 15 Jan 2018 08:40:17 +0100
Message-Id: <1516002017-4981-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 15 Jan 2018 07:40:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-doc: Get rid of "vlan=X" example in the
 documentation
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
X-List-Received-Date: Mon, 15 Jan 2018 07:40:31 -0000

The vlan concept is marked as deprecated, so we should not use
this for examples in the documentation anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 130016c..d0c8b06 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2257,8 +2257,8 @@ qemu-system-i386 linux.img -net nic -net tap
 #launch a QEMU instance with two NICs, each one connected
 #to a TAP device
 qemu-system-i386 linux.img \
-                 -net nic,vlan=0 -net tap,vlan=0,ifname=tap0 \
-                 -net nic,vlan=1 -net tap,vlan=1,ifname=tap1
+        -netdev tap,id=nd0,ifname=tap0 -device e1000,netdev=nd0 \
+        -netdev tap,id=nd1,ifname=tap1 -device rtl8139,netdev=nd1
 @end example
 
 @example
-- 
1.8.3.1


