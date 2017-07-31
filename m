Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7pl-0004Da-1m
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:21:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pg-00047i-6j
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pf-0006BW-Ay
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7pb-00069B-DN; Mon, 31 Jul 2017 06:21:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 70A1342AC0;
	Mon, 31 Jul 2017 13:21:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4A341B7C;
	Mon, 31 Jul 2017 13:21:44 +0300 (MSK)
Received: (nullmailer pid 5552 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:26 +0300
Message-Id: <b94b330e233368d906e8b66e827a761e67845c51.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/25] tests: add missing dependency to build
 QTEST_QEMU_BINARY
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
X-List-Received-Date: Mon, 31 Jul 2017 10:21:53 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This allow a one liner from fresh repository clone, i.e.:

  ./configure && make -j check-qtest-aarch64

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 98387d3a51..59e536bf0b 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -830,7 +830,7 @@ GCOV_OPTIONS =3D -n $(if $(V),-f,)
 # gtester tests, possibly with verbose output
=20
 .PHONY: $(patsubst %, check-qtest-%, $(QTEST_TARGETS))
-$(patsubst %, check-qtest-%, $(QTEST_TARGETS)): check-qtest-%: $(check-q=
test-y)
+$(patsubst %, check-qtest-%, $(QTEST_TARGETS)): check-qtest-%: subdir-%-=
softmmu $(check-qtest-y)
 	$(if $(CONFIG_GCOV),@rm -f *.gcda */*.gcda */*/*.gcda */*/*/*.gcda,)
 	$(call quiet-command,QTEST_QEMU_BINARY=3D$*-softmmu/qemu-system-$* \
 		QTEST_QEMU_IMG=3Dqemu-img$(EXESUF) \
--=20
2.11.0


