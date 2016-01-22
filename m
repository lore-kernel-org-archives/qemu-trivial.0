Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aMfcY-0002Dq-Gu
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jan 2016 12:35:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aMfcW-0002DJ-Hv
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 12:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aMfcT-0007Df-CV
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 12:35:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aMfcT-0007DX-4h
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 12:35:33 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 6B2D24C522;
	Fri, 22 Jan 2016 17:35:31 +0000 (UTC)
Received: from dhcp-1-180.lcy.redhat.com (dhcp-1-180.lcy.redhat.com
	[10.32.224.180])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0MHZTNh001566; Fri, 22 Jan 2016 12:35:30 -0500
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-deve@nongnu.org
Date: Fri, 22 Jan 2016 17:35:25 +0000
Message-Id: <1453484125-4064-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Sean Bruno <sbruno@freebsd.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] char: fix parameter name / type in BSD
	codepath
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
X-List-Received-Date: Fri, 22 Jan 2016 17:35:37 -0000

The BSD impl of qemu_chr_open_pp_fd had mis-declared
its parameter type as ChardevBackend instead of
ChardevCommon. It had also mistakenly used the variable
name 'common' instead of 'backend'.

Tested-by: Sean Bruno <sbruno@freebsd.org>
Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 qemu-char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index e133f4f..aa2e660 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1835,12 +1835,12 @@ static int pp_ioctl(CharDriverState *chr, int cmd, void *arg)
 }
 
 static CharDriverState *qemu_chr_open_pp_fd(int fd,
-                                            ChardevBackend *backend,
+                                            ChardevCommon *backend,
                                             Error **errp)
 {
     CharDriverState *chr;
 
-    chr = qemu_chr_alloc(common, errp);
+    chr = qemu_chr_alloc(backend, errp);
     if (!chr) {
         return NULL;
     }
-- 
2.5.0


