Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4C5D-0000xD-7P
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:33:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C59-0000rj-T7
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C58-00021h-Vi
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4C53-0001vz-RA; Mon, 16 Oct 2017 16:33:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 84F9040D2E;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7EE37AF8;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: (nullmailer pid 12315 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:30 +0300
Message-Id: <439e91af8f24c308e753b9417d6c599d6007595a.1508185933.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 03/14] gitignore: ignore check-qlit test
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
X-List-Received-Date: Mon, 16 Oct 2017 20:33:52 -0000

From: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>

test introduced in 382176b4d78e070d119af8e0dcd00884c11bbec2

Signed-off-by: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index cf6d99c91e..53cb2efaee 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -6,6 +6,7 @@ check-qdict
 check-qnum
 check-qjson
 check-qlist
+check-qlit
 check-qnull
 check-qstring
 check-qom-interface
--=20
2.11.0


