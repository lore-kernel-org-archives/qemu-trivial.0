Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08Pw-0008OY-W7
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:09:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pq-0008BF-NZ
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pm-00052d-O9
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08Pe-0004vU-4O; Wed, 03 Jun 2015 09:08:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DEFF54079E;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C04EDA4F;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: (nullmailer pid 27418 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:23 +0300
Message-Id: <b8981dc9aae25fa79e5f35609e63f50f078a572d.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Krempa <pkrempa@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/30] util: socket: Add missing localaddr and
	localport option for DGRAM socket
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
X-List-Received-Date: Wed, 03 Jun 2015 13:09:11 -0000

From: Peter Krempa <pkrempa@redhat.com>

The 'socket_optslist' structure does not contain the 'localaddr' and
'localport' options that are parsed in case you are creating a
'connect' type UDP character device.

I've noticed it happening after commit f43e47dbf6de24db20ec9b588bb6cc762
made qemu abort() after seeing the invalid option.

A minimal reproducer for the case is:
$ qemu-system-x86_64 -chardev udp,id=charrng0,host=127.0.0.1,port=1234,localaddr=,localport=1234
qemu-system-x86_64: -chardev udp,id=charrng0,host=127.0.0.1,port=1234,localaddr=,localport=1234: Invalid parameter 'localaddr'
Aborted (core dumped)

Prior to the commit mentioned above the error would be printed but the
value for localaddr and localport was simply ignored. I did not go
through the code to find out when it was broken.

Add the two fields so that the options can again be parsed correctly and
qemu doesn't abort().

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1220252

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 22c8c4c..f9ad34e 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -45,6 +45,12 @@ QemuOptsList socket_optslist = {
             .name = "port",
             .type = QEMU_OPT_STRING,
         },{
+            .name = "localaddr",
+            .type = QEMU_OPT_STRING,
+        },{
+            .name = "localport",
+            .type = QEMU_OPT_STRING,
+        },{
             .name = "to",
             .type = QEMU_OPT_NUMBER,
         },{
-- 
2.1.4


