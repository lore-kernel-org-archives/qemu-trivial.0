Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88vs-0001UO-5V
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88vl-0001Nd-Sg
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88vg-0004kH-U3
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:14:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88vS-0004dM-NJ; Fri, 18 Jul 2014 10:14:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7DB8143837;
	Fri, 18 Jul 2014 18:14:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 313EF6BB;
	Fri, 18 Jul 2014 18:09:15 +0400 (MSK)
Received: (nullmailer pid 621 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:06 +0400
Message-Id: <1405692553-564-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 1/8] slirp: Give error message if
	hostfwd_add/remove for unrecognized vlan/stack
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
X-List-Received-Date: Fri, 18 Jul 2014 14:14:43 -0000

From: Peter Maydell <peter.maydell@linaro.org>

If the user specified a (vlan ID, slirp stack name) tuple in a monitor
hostfwd_add/remove command and we can't find it, give the user an
error message rather than silently doing nothing.

This brings this error case in slirp_lookup() into line with the
other two.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/slirp.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/net/slirp.c b/net/slirp.c
index 8fddc03..647039e 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -282,6 +282,7 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *vlan,
         NetClientState *nc;
         nc = net_hub_find_client_by_name(strtol(vlan, NULL, 0), stack);
         if (!nc) {
+            monitor_printf(mon, "unrecognized (vlan-id, stackname) pair\n");
             return NULL;
         }
         if (strcmp(nc->model, "user")) {
-- 
1.7.10.4


