Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iX1M0-00009p-5k
	for mharc-qemu-trivial@gnu.org; Tue, 19 Nov 2019 06:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1iX1Ly-00005c-CV
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 06:07:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1iX1Lx-0006bv-E7
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 06:07:26 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:42962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
 id 1iX1Lr-0006VF-Mi; Tue, 19 Nov 2019 06:07:21 -0500
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3597A2E14AB;
 Tue, 19 Nov 2019 14:07:14 +0300 (MSK)
Received: from iva4-c987840161f8.qloud-c.yandex.net
 (iva4-c987840161f8.qloud-c.yandex.net [2a02:6b8:c0c:3da5:0:640:c987:8401])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 VO2TDAzMyt-7DJqCYZQ; Tue, 19 Nov 2019 14:07:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1574161634; bh=HrCcSpLJG9L8gXmV5hNBmH/yRn0z5OXCyYhqzp8ItS0=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=k0pGrV5tS39Xb6YzVgZ4T30m7ZNbBmgx5/vL/J9hGr/3PrXtkDcVIgh6spfrkIjHc
 P4pTcBf76yfAAPGjaROS4h1UUSGyaP+HrXTOT2Fsx9goKQXnjjiZjNSZ7HJHduTWGm
 BDCSO5TV7UElkK+qVtu0hVBo9sad2Nlv/jbeBWiE=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:408:a563:bec5:6346:ec71])
 by iva4-c987840161f8.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 92QNE4iRjf-7DWqLRrr; Tue, 19 Nov 2019 14:07:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] monitor: Remove unused define
Date: Tue, 19 Nov 2019 14:07:09 +0300
Message-Id: <20191119110709.13827-1-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.45.199.163
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2019 11:07:27 -0000

Remove the definition of QMP_ACCEPT_UNKNOWNS as it is unused since
refactoring 5c678ee8d940

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
---
 monitor/misc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 3baa15f3bf..6680734ea1 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -106,9 +106,6 @@ struct MonFdset {
     QLIST_ENTRY(MonFdset) next;
 };
=20
-/* QMP checker flags */
-#define QMP_ACCEPT_UNKNOWNS 1
-
 /* Protects mon_fdsets */
 static QemuMutex mon_fdsets_lock;
 static QLIST_HEAD(, MonFdset) mon_fdsets;
--=20
2.24.0


