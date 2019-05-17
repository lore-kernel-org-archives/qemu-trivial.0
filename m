Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRhf4-0003z0-1Z
	for mharc-qemu-trivial@gnu.org; Fri, 17 May 2019 14:32:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hRhf2-0003xi-1O
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 14:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hRhf1-000613-70
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 14:32:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48398)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hRhez-0005v5-7P; Fri, 17 May 2019 14:32:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD413308218D;
	Fri, 17 May 2019 18:32:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABFDB5D9CD;
	Fri, 17 May 2019 18:32:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 310B811385E4; Fri, 17 May 2019 20:32:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 17 May 2019 20:32:46 +0200
Message-Id: <20190517183246.11933-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 17 May 2019 18:32:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: Fix spelling of sdl-image in
 --help
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
X-List-Received-Date: Fri, 17 May 2019 18:32:53 -0000

Fixes: a442fe2f2b2f20e7be0934277e9400b844b11999
Cc: qemu-trivial@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index d2fc346302..cef51b2a0b 100755
--- a/configure
+++ b/configure
@@ -1745,7 +1745,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   gcrypt          libgcrypt cryptography support
   auth-pam        PAM access control
   sdl             SDL UI
-  sdl_image       SDL Image support for icons
+  sdl-image       SDL Image support for icons
   gtk             gtk UI
   vte             vte support for the gtk UI
   curses          curses UI
-- 
2.17.2


