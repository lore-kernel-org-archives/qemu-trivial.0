Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1crPOc-0000zH-5H
	for mharc-qemu-trivial@gnu.org; Fri, 24 Mar 2017 09:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1crOlC-0005Zu-3V
	for qemu-trivial@nongnu.org; Fri, 24 Mar 2017 08:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1crOlB-0002xG-7N
	for qemu-trivial@nongnu.org; Fri, 24 Mar 2017 08:56:06 -0400
Received: from greensocs.com ([193.104.36.180]:39486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>)
	id 1crOl6-0002t5-6Z; Fri, 24 Mar 2017 08:56:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9373E426B3C;
	Fri, 24 Mar 2017 13:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1490360157;
	bh=dliATcUzAcMQwYiPBornjhDVssEpEDDc9TwzRxb/f4s=;
	h=From:To:Cc:Subject:Date;
	b=aZ54sq2yhGspZ8X5F/sypg9qBvx6cO/hh512zyxjDYyZHQ13+Prov64L4wI5sAsVN
	Kkc6f3iQrsL3Mhj6s/sciKAxVpaSCQyjEI31+nOJo3WRsA5QYAi9SB3xv/JCI2VB2q
	iTM39pabH7RkM25Q1FsRLZzQ7CX0lxP2Lb1sm5vs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeMQ0FhQVWsl; Fri, 24 Mar 2017 13:55:56 +0100 (CET)
Received: from corsair.home (bd231-7-88-127-3-24.fbx.proxad.net [88.127.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	(Authenticated sender: fred.konrad@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 80781426B38;
	Fri, 24 Mar 2017 13:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1490360156;
	bh=dliATcUzAcMQwYiPBornjhDVssEpEDDc9TwzRxb/f4s=;
	h=From:To:Cc:Subject:Date;
	b=kh8nU8sFABvLPeT+9t7l/f2UP/8RjBeBILodSV3RY9T8dXTwMfdnEoJKY+kQCVewL
	StVQRL6JsTQL6ZRe1BqzWK3ZQPa8wB2FmgwJo501+xbgJ6UJNSPcJYxkhqkIpr4ykf
	Tv4zdhQYvhY/rDfoNqJmuzePM36Xjzpy+7JkEb98=
From: fred.konrad@greensocs.com
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: fred.konrad@greensocs.com
Date: Fri, 24 Mar 2017 13:55:47 +0100
Message-Id: <1490360147-26450-1-git-send-email-fred.konrad@greensocs.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 24 Mar 2017 09:36:49 -0400
Subject: [Qemu-trivial] [PATCH] ppc_booke: drop useless assignment
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
X-List-Received-Date: Fri, 24 Mar 2017 12:56:07 -0000

From: KONRAD Frederic <fred.konrad@greensocs.com>

The tb_env variable is set two lines above. So just drop the double assignment.

Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
---
 hw/ppc/ppc_booke.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 60baffa..23bcf1b 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -282,7 +282,6 @@ void store_booke_tcr(CPUPPCState *env, target_ulong val)
     ppc_tb_t *tb_env = env->tb_env;
     booke_timer_t *booke_timer = tb_env->opaque;
 
-    tb_env = env->tb_env;
     env->spr[SPR_BOOKE_TCR] = val;
     kvmppc_set_tcr(cpu);
 
-- 
1.8.3.1


