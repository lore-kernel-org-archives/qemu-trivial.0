Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hKPxH-0004ue-1Y
	for mharc-qemu-trivial@gnu.org; Sat, 27 Apr 2019 12:13:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKPxE-0004sh-On
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 12:13:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKPxD-0000Ck-Rv
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 12:13:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43664)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hKPxB-0000B8-U1; Sat, 27 Apr 2019 12:13:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1501E308FF0E;
	Sat, 27 Apr 2019 16:13:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6F89382C;
	Sat, 27 Apr 2019 16:13:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Sat, 27 Apr 2019 18:13:22 +0200
Message-Id: <20190427161322.24642-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sat, 27 Apr 2019 16:13:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Makefile: Let the 'clean' rule remove
 qemu-ga.exe on Windows hosts
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
X-List-Received-Date: Sat, 27 Apr 2019 16:13:33 -0000

Commit 48ff7a625b36 added the QEMU Guest Agent tool with the
optional ".exe" suffix for Windows hosts, but forgot to use
this suffix in the 'clean' rule. Calling this rule let a dangling
executable in the build directory.
Correct this by using the proper optional suffix.

Fixes: 48ff7a625b36
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 626a04d305c..07bfa26536a 100644
--- a/Makefile
+++ b/Makefile
@@ -639,7 +639,7 @@ clean:
 		! -path ./roms/edk2/BaseTools/Source/Python/UPT/Dll/sqlite3.dll \
 		-exec rm {} +
 	rm -f $(edk2-decompressed)
-	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga TAGS cscope.* *=
.pod *~ */*~
+	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga$(EXESUF) TAGS c=
scope.* *.pod *~ */*~
 	rm -f fsdev/*.pod scsi/*.pod
 	rm -f qemu-img-cmds.h
 	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
--=20
2.20.1


