Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdx1o-0005HN-BV
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jul 2018 08:18:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdx1l-0005F5-Kb
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 08:18:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdx1k-0004EK-NJ
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 08:18:25 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:53842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdx1g-0003N6-4n; Fri, 13 Jul 2018 08:18:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 1A0C8169C2D;
	Fri, 13 Jul 2018 14:17:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L2_E_pzBwU5h; Fri, 13 Jul 2018 14:17:36 +0200 (CEST)
Received: from ub-blade-01.bib.uni-mannheim.de
	(ub-blade-01.bib.uni-mannheim.de [134.155.36.5])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPS id EA55D169C22;
	Fri, 13 Jul 2018 14:17:35 +0200 (CEST)
Received: from stweil by ub-blade-01.bib.uni-mannheim.de with local (Exim 4.89)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdx0x-0001b0-Py; Fri, 13 Jul 2018 14:17:35 +0200
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Date: Fri, 13 Jul 2018 14:17:27 +0200
Message-Id: <20180713121727.6095-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 134.155.96.80
Subject: [Qemu-trivial] [PATCH v2] docs: Fix some typos (most found by
 codespell)
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
X-List-Received-Date: Fri, 13 Jul 2018 12:18:26 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v2: Rebased, so the recently applied fixes are no longer included.

 docs/COLO-FT.txt            | 2 +-
 docs/interop/vhost-user.txt | 4 ++--
 docs/replay.txt             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index d7c7dcda8f..70cfb9ce7d 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -104,7 +104,7 @@ Primary side.
 COLO Proxy:
 Delivers packets to Primary and Seconday, and then compare the responses from
 both side. Then decide whether to start a checkpoint according to some rules.
-Please refer to docs/colo-proxy.txt for more informations.
+Please refer to docs/colo-proxy.txt for more information.
 
 Note:
 HeartBeat has not been implemented yet, so you need to trigger failover process
diff --git a/docs/interop/vhost-user.txt b/docs/interop/vhost-user.txt
index f59667f498..c2194711d9 100644
--- a/docs/interop/vhost-user.txt
+++ b/docs/interop/vhost-user.txt
@@ -666,12 +666,12 @@ Master message types
       Equivalent ioctl: VHOST_SET_VRING_ENDIAN
       Master payload: vring state description
 
-      Set the endianess of a VQ for legacy devices. Little-endian is indicated
+      Set the endianness of a VQ for legacy devices. Little-endian is indicated
       with state.num set to 0 and big-endian is indicated with state.num set
       to 1. Other values are invalid.
       This request should be sent only when VHOST_USER_PROTOCOL_F_CROSS_ENDIAN
       has been negotiated.
-      Backends that negotiated this feature should handle both endianesses
+      Backends that negotiated this feature should handle both endiannesses
       and expect this message once (per VQ) during device configuration
       (ie. before the master starts the VQ).
 
diff --git a/docs/replay.txt b/docs/replay.txt
index 2e21e9ccb0..3497585f5a 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -320,7 +320,7 @@ Here is the list of events that are written into the log:
    async event id from the following list:
      - REPLAY_ASYNC_EVENT_BH. Bottom-half callback. This event synchronizes
        callbacks that affect virtual machine state, but normally called
-       asyncronously.
+       asynchronously.
        Argument: 8-byte operation id.
      - REPLAY_ASYNC_EVENT_INPUT. Input device event. Contains
        parameters of keyboard and mouse input operations
-- 
2.11.0


