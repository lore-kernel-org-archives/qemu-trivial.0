Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ0L-0002j4-1M
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:55:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0I-0002fT-7G
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0H-0000iH-7j
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ0B-0000dD-EM; Sat, 10 Feb 2018 02:55:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 23F0440C55;
	Sat, 10 Feb 2018 10:55:14 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9FA1A758;
	Sat, 10 Feb 2018 10:55:15 +0300 (MSK)
Received: (nullmailer pid 22796 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 10 Feb 2018 10:55:00 +0300
Message-Id: <57bf554cf4f486d2e89860cf285cc8502ef61d63.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] =?utf-8?q?=5BPULL_05/17=5D_mailmap=3A_set_preferre?=
 =?utf-8?q?d_spelling_for_Daniel_Berrang=C3=A9?=
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
X-List-Received-Date: Sat, 10 Feb 2018 07:55:23 -0000

From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index ee81ac801e..cf689b9ec9 100644
--- a/.mailmap
+++ b/.mailmap
@@ -18,3 +18,7 @@ malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c=
8c-71466251a162>
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
+#
+# Also list preferred name forms where people have changed their
+# git author config
+Daniel P. Berrang=C3=A9 <berrange@redhat.com>
--=20
2.11.0


