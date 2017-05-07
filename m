Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GUj-0004NH-QB
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:20:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUh-0004KE-7J
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUg-00036j-Gd
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GUc-00034i-2p; Sun, 07 May 2017 03:20:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 23C2C40482;
	Sun,  7 May 2017 10:20:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7BEA1434;
	Sun,  7 May 2017 10:02:30 +0300 (MSK)
Received: (nullmailer pid 26542 invoked by uid 1000);
	Sun, 07 May 2017 07:02:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: KONRAD Frederic <fred.konrad@greensocs.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:05 +0300
Message-Id: <2d812d6dff5267d80c54125f15a090539573d29e.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/23] ppc_booke: drop useless assignment
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
X-List-Received-Date: Sun, 07 May 2017 07:20:40 -0000

From: KONRAD Frederic <fred.konrad@greensocs.com>

The tb_env variable is set two lines above. So just drop the double assignment.

Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/ppc_booke.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 60baffaf1d..23bcf1b138 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -282,7 +282,6 @@ void store_booke_tcr(CPUPPCState *env, target_ulong val)
     ppc_tb_t *tb_env = env->tb_env;
     booke_timer_t *booke_timer = tb_env->opaque;
 
-    tb_env = env->tb_env;
     env->spr[SPR_BOOKE_TCR] = val;
     kvmppc_set_tcr(cpu);
 
-- 
2.11.0


