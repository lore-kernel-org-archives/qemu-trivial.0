Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30MM-000872-C0
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:13:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30MK-00084U-CN
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30MI-0002x3-BC
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:13:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30MC-0002t8-ME; Wed, 18 May 2016 08:13:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 669FE417A3;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 738C2ADB;
	Wed, 18 May 2016 15:06:10 +0300 (MSK)
Received: (nullmailer pid 12388 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:05:59 +0300
Message-Id: <37a3e630d90c50226c167d7a0540d2b4a1f91c07.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/13] vl: fix comment about when parsing cpu
 definitions
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
X-List-Received-Date: Wed, 18 May 2016 12:13:53 -0000

From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>

machine->init() was replaced with machine_class->init()
in 958db90cd54823c33345000c995453a8c9b7a005.

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 5fd22cb..e789ce7 100644
--- a/vl.c
+++ b/vl.c
@@ -4083,7 +4083,7 @@ int main(int argc, char **argv, char **envp)
     /* Init CPU def lists, based on config
      * - Must be called after all the qemu_read_config_file() calls
      * - Must be called before list_cpus()
-     * - Must be called before machine->init()
+     * - Must be called before machine_class->init()
      */
     cpudef_init();
 
-- 
2.1.4


