Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlvSm-000192-Ci
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jul 2019 09:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51415)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan@weilnetz.de>) id 1hlvSk-0000zs-6T
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 09:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan@weilnetz.de>) id 1hlvSj-0001zn-9y
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 09:19:46 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:40766
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan@weilnetz.de>)
 id 1hlvSh-0001qL-A2; Fri, 12 Jul 2019 09:19:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 456ACDB8610;
 Fri, 12 Jul 2019 15:19:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id n-s2BzO9AzIU; Fri, 12 Jul 2019 15:19:38 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 9AB3BDB8602;
 Fri, 12 Jul 2019 15:19:38 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 93A5946004F; Fri, 12 Jul 2019 15:19:38 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Like Xu <like.xu@linux.intel.com>, Stefan Weil <sw@weilnetz.de>
Date: Fri, 12 Jul 2019 15:19:27 +0200
Message-Id: <20190712131927.15091-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH] Remove old global variable smp_cpus
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
X-List-Received-Date: Fri, 12 Jul 2019 13:19:47 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/sysemu/sysemu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 984c439ac9..9b849cb770 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -103,7 +103,6 @@ extern const char *keyboard_layout;
 extern int win2k_install_hack;
 extern int alt_grab;
 extern int ctrl_grab;
-extern int smp_cpus;
 extern unsigned int max_cpus;
 extern int cursor_hide;
 extern int graphic_rotate;
--=20
2.20.1


