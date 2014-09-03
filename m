Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4Am-0001w6-GV
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:36:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Af-0001iD-SN
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:36:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Ab-0005fm-Gj
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:35:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4AL-0005bC-EG; Wed, 03 Sep 2014 02:35:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 645E14075F;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 451E46DF;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: (nullmailer pid 1622 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:35 +0400
Message-Id: <1409726135-1547-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/10] slirp: Honour vlan/stack in
	hostfwd_remove commands
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
X-List-Received-Date: Wed, 03 Sep 2014 06:36:02 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The hostfwd_add and hostfwd_remove monitor commands allow the user
to optionally specify a vlan/stack tuple. hostfwd_add honours this,
but hostfwd_remove does not (it looks up the tuple but then ignores
the SlirpState it has looked up and always uses the first stack
in the list anyway). Correct this to honour what the user requested.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/slirp.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 647039e..c171119 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -345,8 +345,7 @@ void net_slirp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 
     host_port = atoi(p);
 
-    err = slirp_remove_hostfwd(QTAILQ_FIRST(&slirp_stacks)->slirp, is_udp,
-                               host_addr, host_port);
+    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
 
     monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
                    err ? "not found" : "removed");
-- 
1.7.10.4


