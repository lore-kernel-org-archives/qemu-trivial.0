Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4RvQ-0002PH-J6
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 11:05:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvJ-0002M4-TA
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvH-0004fm-Uv
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:33 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:51461)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h4RvA-0004Mq-A6; Thu, 14 Mar 2019 11:05:26 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MdwRi-1gVw753iSc-00b61y; Thu, 14 Mar 2019 16:05:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Stefano Garzarella <sgarzare@redhat.com>,
	Eric Blake <eblake@redhat.com>
Date: Thu, 14 Mar 2019 16:04:53 +0100
Message-Id: <20190314150454.15960-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314150454.15960-1-laurent@vivier.eu>
References: <20190314150454.15960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QOzHV2Z0jql5HMXU4ECXNmO2puJkC22XGj7botvetuJwvSmHVv7
	Ld5dK6GjyC64yi60q4kCUfVmqRjZPEpsU1+De2dGkFnPpnduOXCg04FvKiPio5XWFJd0xfS
	R8d8LXfHD7sAomk6Ij9Fes6iWNqzkNN4wxJXNwNMhxhpNyyUaLkpQvboUdYhvSQOfCaue5G
	KwElc540ICvMgufgVmQYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4NtJuCq56Yc=:Hy5MCW9w7UKMByiw//Sk0i
	J23F8Bikf8b+XJjsMRTfrEjhtev480T6YB4OomoeeMovzjBgms74049032OkW+5ctQAKn2Qln
	EnWCIRkluZHhsfsjEbf7Sjnjqfj7vXvitY4/ecppvptkZRivLcJmvZeBHrC+zgpIAhJkVXeAJ
	/Z76lGFRCgdy1tyq5ys95SyCsQGM/YY//1vRE2m53ShYgwqdUy1TNrfB1t7PA64FfytF/nVTC
	EN8M+zhiZAH43Qrsk5saYKWnIBCC75EpeTfHxLQ0wqgQQwxBbNMLylkx0hspdUHaXdsVBcQEC
	5wHdLdIJcrKKeLT30SmGlsLQGZ5CM7GjrR+fcDj9zP9+Q7l/SvgnXhqGKuin147sTKvEErErW
	goxsjYwgLdw6yhjqqkaNVZ+Up4Rdds2W3cjvmAJaaz2D1xFn1D78MeF7OW4bV7EoSAnzhYNBD
	7tw1PWJ7PbYRT1qrMNRX9wDUHi4SKvMMArrDXuMPLs0Ex2PCO/kUUzrqfHuBGP1Shfm4bwdvM
	JGniSLP5Bz44Gb6dUXKAMCGSp6UOqsZrmVBgq7VhV5+HneVoRuMWO8378yivNvcTCOIHCqajn
	ZVHiMWhC6LwNdJuVSW4IfetqC4a//cE8nnqi0Dl/E1uHTGnjN4fE6WDeVuUVvPaAyWrFzoVBp
	Z6dQKHPWXo8gWlTWtiurz1x8kasMbq/hPwgeg9eLtajo+4Qco5tsTc4WUDGmUq/mUGVA8V/+x
	7OUJ+HKhlId5+F5tCOoEQA58T7XSNI6xzlEueA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 2/3] .gitignore: ignore docs/built created for
 in-tree builds
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
X-List-Received-Date: Thu, 14 Mar 2019 15:05:39 -0000

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 1290e6711 creates 'docs/built' for in-tree builds of
Sphinx manuals but did not ignore it.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190314104622.101715-2-sgarzare@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 42d2d473559d..8f782218044e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -120,6 +120,7 @@
 /pc-bios/optionrom/kvmvapic.img
 /pc-bios/s390-ccw/s390-ccw.elf
 /pc-bios/s390-ccw/s390-ccw.img
+/docs/built
 /docs/interop/qemu-ga-qapi.texi
 /docs/interop/qemu-ga-ref.html
 /docs/interop/qemu-ga-ref.info*
-- 
2.20.1


