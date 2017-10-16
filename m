Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CE0-0006iu-PQ
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDy-0006fi-CA
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDx-0006TY-Ie
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CDs-0006Pg-Su; Mon, 16 Oct 2017 16:42:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 027AB40D0A;
	Mon, 16 Oct 2017 23:42:51 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D3779C29;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: (nullmailer pid 12323 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:34 +0300
Message-Id: <429cc0d31f5a5063caedc4567b97999c7191374e.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/14] os-posix: Drop misleading comment
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
X-List-Received-Date: Mon, 16 Oct 2017 20:42:59 -0000

From: Markus Armbruster <armbru@redhat.com>

Comments explaining why we include a header tend to go bad.  This
one's almost comical: not only doesn't qemu-options.hx use
MAP_POPULATE anymore (since commit ef36fa1, v2.0.0, 2013), even the
include it applies to got moved away in commit 02d0e09 (v2.7.0).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 os-posix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/os-posix.c b/os-posix.c
index 92e9d85215..b9c2343b1e 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -25,7 +25,6 @@
=20
 #include "qemu/osdep.h"
 #include <sys/wait.h>
-/*needed for MAP_POPULATE before including qemu-options.h */
 #include <pwd.h>
 #include <grp.h>
 #include <libgen.h>
--=20
2.11.0


