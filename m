Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHvL-00069a-Pt
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:34:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvI-00064y-6N
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvH-00035I-B2
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHv9-0002t9-Sd; Sun, 20 May 2018 02:34:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DDDAB410E4;
	Sun, 20 May 2018 09:34:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BDB6E10C9;
	Sun, 20 May 2018 09:15:13 +0300 (MSK)
Received: (nullmailer pid 7402 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:15:02 +0300
Message-Id: <aec0d0e11812c602866c9fa044847f1e7b1e7dff.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/22] qemu-options: Allow -no-user-config
 again
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
X-List-Received-Date: Sun, 20 May 2018 06:34:29 -0000

From: Michal Privoznik <mprivozn@redhat.com>

After 1217d6ca2bf28c0febe1bd7d5b3fa912bbf6af2a we error out
explicitly if an unknown -option was passed on the command line.
However, we are doing two pass command line option parsing. In
the first pass we just look for -no-user-config or -nodefconfig
being present which determines whether we load user config or
not. Then in the second pass we finally parse everything else
throwing an error if an unsupported -option was found. Problem is
that in the second pass -no-user-config and -nodefconfig are not
handled explicitly which makes us throw the unsupported option
error.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/vl.c b/vl.c
index 3b39bbd7a8..d5836c65ae 100644
--- a/vl.c
+++ b/vl.c
@@ -4011,6 +4011,10 @@ int main(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
+            case QEMU_OPTION_nodefconfig:
+            case QEMU_OPTION_nouserconfig:
+                /* Nothing to be parsed here. Especially, do not error o=
ut below. */
+                break;
             default:
                 if (os_parse_cmd_args(popt->index, optarg)) {
                     error_report("Option not supported in this build");
--=20
2.11.0


