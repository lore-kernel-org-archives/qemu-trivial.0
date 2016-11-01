Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1cit-00014d-8N
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 13:19:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c1ciq-00012a-Pj
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c1cip-0006Tm-PU
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:19:40 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:47043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c1cil-0006Rr-97; Tue, 01 Nov 2016 13:19:35 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id F41C511810AA;
	Tue,  1 Nov 2016 18:19:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id JOXaV0JjImiF; Tue,  1 Nov 2016 18:19:31 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id B261A11810A3;
	Tue,  1 Nov 2016 18:19:31 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 89D70460072; Tue,  1 Nov 2016 18:19:31 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Stefan Weil <sw@weilnetz.de>
Date: Tue,  1 Nov 2016 18:19:27 +0100
Message-Id: <20161101171927.25684-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH] docs: Fix typos found by codespell
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
X-List-Received-Date: Tue, 01 Nov 2016 17:19:42 -0000

Fix also some indefinite articles.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I still don't understand the comment in docs/colo-proxy.txt.

Stefan

 docs/COLO-FT.txt    | 2 +-
 docs/colo-proxy.txt | 2 +-
 qemu-doc.texi       | 2 +-
 qemu-options.hx     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 6282938..043b14a 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -102,7 +102,7 @@ Primary side.
 COLO Proxy:
 Delivers packets to Primary and Seconday, and then compare the responses from
 both side. Then decide whether to start a checkpoint according to some rules.
-Please refer to docs/colo-proxy.txt for more informations.
+Please refer to docs/colo-proxy.txt for more information.
 
 Note:
 HeartBeat has not been implemented yet, so you need to trigger failover process
diff --git a/docs/colo-proxy.txt b/docs/colo-proxy.txt
index 76767cb..6c8cca5 100644
--- a/docs/colo-proxy.txt
+++ b/docs/colo-proxy.txt
@@ -158,7 +158,7 @@ secondary.
 
 == Usage ==
 
-Here, we use demo ip and port discribe more clearly.
+Here, we use demo ip and port describe more clearly.
 Primary(ip:3.3.3.3):
 -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
 -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 023c140..691acf9 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1037,7 +1037,7 @@ qemu-system-i386 -iscsi initiator-name=iqn.qemu.test:my-initiator \
 @node disk_images_gluster
 @subsection GlusterFS disk images
 
-GlusterFS is an user space distributed file system.
+GlusterFS is a user space distributed file system.
 
 You can boot from the GlusterFS disk image with the command:
 @example
diff --git a/qemu-options.hx b/qemu-options.hx
index 95332cc..df5e4e7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2589,7 +2589,7 @@ qemu-system-i386 --drive file=sheepdog://192.0.2.1:30000/MyVirtualMachine
 See also @url{http://http://www.osrg.net/sheepdog/}.
 
 @item GlusterFS
-GlusterFS is an user space distributed file system.
+GlusterFS is a user space distributed file system.
 QEMU supports the use of GlusterFS volumes for hosting VM disk images using
 TCP, Unix Domain Sockets and RDMA transport protocols.
 
-- 
2.10.1


