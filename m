Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPRPL-0000vs-7G
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jun 2017 06:38:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dPRPJ-0000uV-3t
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 06:38:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dPRPI-00080Z-8M
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 06:38:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1dPRPC-0007xm-2l; Mon, 26 Jun 2017 06:38:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04839C054C5A;
	Mon, 26 Jun 2017 10:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 04839C054C5A
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=berrange@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 04839C054C5A
Received: from t460.redhat.com (ovpn-117-191.ams2.redhat.com [10.36.117.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F489627DB;
	Mon, 26 Jun 2017 10:37:58 +0000 (UTC)
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Date: Mon, 26 Jun 2017 11:37:56 +0100
Message-Id: <20170626103756.22974-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 26 Jun 2017 10:38:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] sockets: avoid formatting buffer that may
 not be NUL terminated
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
X-List-Received-Date: Mon, 26 Jun 2017 10:38:14 -0000

The 'sun_path' field in the sockaddr_un struct is not required
to be NUL termianted, so when reporting an error, we must use
the separate 'path' variable which is guaranteed terminated.

Fixes a bug spotted by coverity that was introduced in

  commit ad9579aaa16d5b385922d49edac2c96c79bcfb62
  Author: Daniel P. Berrange <berrange@redhat.com>
  Date:   Thu May 25 16:53:00 2017 +0100

    sockets: improve error reporting if UNIX socket path is too long

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 util/qemu-sockets.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 51bf279..37d386f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -930,7 +930,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     strncpy(un.sun_path, path, sizeof(un.sun_path));
 
     if (bind(sock, (struct sockaddr*) &un, sizeof(un)) < 0) {
-        error_setg_errno(errp, errno, "Failed to bind socket to %s", un.sun_path);
+        error_setg_errno(errp, errno, "Failed to bind socket to %s", path);
         goto err;
     }
     if (listen(sock, 1) < 0) {
-- 
2.9.3


