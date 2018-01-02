Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eWPNg-0000P5-Uc
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jan 2018 11:25:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eWPNf-0000O5-Dd
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 11:25:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eWPNe-0003cp-LG
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 11:25:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eWPNZ-0003ZP-90; Tue, 02 Jan 2018 11:25:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A60B13AB1;
	Tue,  2 Jan 2018 16:25:28 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-192-189.str.redhat.com
	[10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F390A5D964;
	Tue,  2 Jan 2018 16:25:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org
Date: Tue,  2 Jan 2018 17:25:26 +0100
Message-Id: <1514910326-31234-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 02 Jan 2018 16:25:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add qemu-binfmt-conf.sh script
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
X-List-Received-Date: Tue, 02 Jan 2018 16:25:36 -0000

qemu-binfmt-conf.sh is used for the Linux usermode emulation, so
let's add this file to that section in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 73a5555..e92618f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1713,6 +1713,7 @@ R: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: linux-user/
 F: default-configs/*-linux-user.mak
+F: scripts/qemu-binfmt-conf.sh
 
 Tiny Code Generator (TCG)
 -------------------------
-- 
1.8.3.1


