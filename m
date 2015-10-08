Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zkdct-0003q8-52
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 15:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEbt-0006FG-VY
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEal-0004it-3W
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:04:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEZn-0002rA-Rd; Thu, 08 Oct 2015 13:01:56 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 821BF40A55;
	Thu,  8 Oct 2015 20:01:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 54897A92;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 11978 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:10 +0300
Message-Id: <91288a58a550be4dc80628456d5e1d2e91424827.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 01/19] Add .dir-locals.el file to configure
	emacs coding style
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
X-List-Received-Date: Thu, 08 Oct 2015 17:05:01 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

Some default emacs setups indent by 2 spaces and uses tabs
which is counter to the QEMU coding style rules. Adding a
.dir-locals.el file in the top level of the GIT repo will
inform emacs about the QEMU coding style, and so assist
contributors in avoiding common style mistakes before
they submit patches.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .dir-locals.el | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .dir-locals.el

diff --git a/.dir-locals.el b/.dir-locals.el
new file mode 100644
index 0000000..3ac0cfc
--- /dev/null
+++ b/.dir-locals.el
@@ -0,0 +1,2 @@
+((c-mode . ((c-file-style . "stroustrup")
+	    (indent-tabs-mode . nil))))
-- 
2.1.4


