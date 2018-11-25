Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR1NT-0000Bg-W4
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 15:51:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1NQ-000074-9E
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1NP-0005eL-CU
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:51:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1NM-0005Z8-Md; Sun, 25 Nov 2018 15:51:32 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E5A5307D864;
	Sun, 25 Nov 2018 20:51:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 343A95C1B2;
	Sun, 25 Nov 2018 20:51:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 25 Nov 2018 21:49:38 +0100
Message-Id: <20181125205000.10324-4-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 25 Nov 2018 20:51:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-3.1 03/25] MAINTAINERS: Add missing
 entries to the X86 section (AMD SEV)
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
X-List-Received-Date: Sun, 25 Nov 2018 20:51:37 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae12323647..3b9996ab2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -300,8 +300,10 @@ F: target/i386/
 F: tests/tcg/i386/
 F: tests/tcg/x86_64/
 F: hw/i386/
+F: include/sysemu/sev.h
 F: disas/i386.c
 F: docs/qemu-cpu-models.texi
+F: docs/amd-memory-encryption.txt
 T: git https://github.com/ehabkost/qemu.git x86-next
=20
 Xtensa
--=20
2.17.2


