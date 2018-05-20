Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHvK-00068K-Qv
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:34:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvF-00061B-C2
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvE-00033E-FX
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHv9-0002t8-Sj; Sun, 20 May 2018 02:34:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B0364111F;
	Sun, 20 May 2018 09:34:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 715D710C5;
	Sun, 20 May 2018 09:15:13 +0300 (MSK)
Received: (nullmailer pid 7360 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-trivial@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:14:51 +0300
Message-Id: <f7c922ed3d8e3cb54febbdc594ce9f4400e0d290.1526796813.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 05/22] HACKING: document preference for g_new
 instead of g_malloc
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
X-List-Received-Date: Sun, 20 May 2018 06:34:26 -0000

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

This patch documents the preference for g_new instead of g_malloc. The
reasons were adapted from commit b45c03f585ea9bb1af76c73e82195418c294919d=
.

Discussion in QEMU's mailing list:
  http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg03238.html

Cc: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 HACKING | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/HACKING b/HACKING
index 4125c97d8d..0fc3e0fc04 100644
--- a/HACKING
+++ b/HACKING
@@ -118,6 +118,15 @@ Please note that g_malloc will exit on allocation fa=
ilure, so there
 is no need to test for failure (as you would have to with malloc).
 Calling g_malloc with a zero size is valid and will return NULL.
=20
+Prefer g_new(T, n) instead of g_malloc(sizeof(T) * n) for the following
+reasons:
+
+  a. It catches multiplication overflowing size_t;
+  b. It returns T * instead of void *, letting compiler catch more type
+     errors.
+
+Declarations like T *v =3D g_malloc(sizeof(*v)) are acceptable, though.
+
 Memory allocated by qemu_memalign or qemu_blockalign must be freed with
 qemu_vfree, since breaking this will cause problems on Win32.
=20
--=20
2.11.0


