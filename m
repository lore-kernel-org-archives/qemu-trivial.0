Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dafjl-0000sO-Lw
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 06:09:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dafjj-0000rE-RX
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 06:09:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dafjj-0000qG-0D
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 06:09:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dafjd-0000fc-Lk; Thu, 27 Jul 2017 06:09:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAE0E12CA25;
	Thu, 27 Jul 2017 10:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BAE0E12CA25
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.str.redhat.com (dhcp-192-189.str.redhat.com
	[10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B2F76F9C1;
	Thu, 27 Jul 2017 10:09:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Kamil Rytarowski <kamil@netbsd.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Date: Thu, 27 Jul 2017 12:09:34 +0200
Message-Id: <1501150174-19431-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 27 Jul 2017 10:09:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Improve the NetBSD regex pattern
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
X-List-Received-Date: Thu, 27 Jul 2017 10:09:44 -0000

Currently get_maintainers.pl claims that the configure script is
maintained by Kamil:

 $ scripts/get_maintainer.pl -f configure
 Kamil Rytarowski <kamil@netbsd.org> (maintainer:NETBSD)
 qemu-devel@nongnu.org (open list:All patches CC here)

This happens because the regex pattern for the NETBSD entry triggers
on everything that contains the keyword "NetBSD". Ease the situation
a little bit by restricting this to "Subject:" lines only, like
we do it in the "trivial patches" section already.

Reported-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2341a..ccee28b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -353,7 +353,7 @@ NETBSD
 L: qemu-devel@nongnu.org
 M: Kamil Rytarowski <kamil@netbsd.org>
 S: Maintained
-K: (?i)NetBSD
+K: ^Subject:.*(?i)NetBSD
=20
 W32, W64
 L: qemu-devel@nongnu.org
--=20
1.8.3.1


