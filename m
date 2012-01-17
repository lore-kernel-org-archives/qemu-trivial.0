Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rn81I-0006Ks-SH
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2012 07:20:08 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Rn81B-0005z7-Ac
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2012 07:20:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Rn815-00056W-Bm
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2012 07:20:01 -0500
Received: from mout.web.de ([212.227.15.4]:53801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1Rn813-000562-AC; Tue, 17 Jan 2012 07:19:53 -0500
Received: from localhost.localdomain ([195.135.221.2]) by smtp.web.de
	(mrweb002) with ESMTPA (Nemesis) id 0MP08F-1Rhufy1Z6V-0062Xi;
	Tue, 17 Jan 2012 13:19:33 +0100
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
To: qemu-devel@nongnu.org
Date: Tue, 17 Jan 2012 13:17:38 +0100
Message-Id: <1326802658-12898-1-git-send-email-andreas.faerber@web.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:zxTaPi5KVTMebZ49qch2i7HzZWddeBJNCYH5O4CPeg5
	ZhG0XeLEea0O6NyGXxFYod2BD8MsVlRVGz23Mbhwl9p5N5fbGf
	FKfQeuUeMdpa+W4uh2kd32bs59/HKhBLnueUcUhT4caC9m2H70
	7KfN3ECQgPbnLFTC6efxFXhoVNKAtcahVoQtiZhHGzb1+NWMNl
	TLPLA304uPTK2iEKewI2g==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.15.4
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] Makefile: Remove generated headers on clean
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
X-List-Received-Date: Tue, 17 Jan 2012 12:20:07 -0000

Running `make distclean' followed by a new out-of-tree build would fail
due to stale generated QMP headers in the tree.

Commit 611b727374ad76fb0078ea65bc1387194913980e (Makefile: remove more
generated files on clean) made sure generated sources are removed.

Also remove generated headers introduced in commit
e3193601c84558c303b1773379da76fce80c0a56 (qapi: use middle mode in QMP
server).

Signed-off-by: Andreas Färber <andreas.faerber@web.de>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Luiz Capitulino <lcapitulino@redhat.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index d356f07..917fb9b 100644
--- a/Makefile
+++ b/Makefile
@@ -213,6 +213,7 @@ clean:
 	rm -f trace.c trace.h trace.c-timestamp trace.h-timestamp
 	rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
 	rm -f trace-dtrace.h trace-dtrace.h-timestamp
+	rm -f $(GENERATED_HEADERS)
 	rm -f $(GENERATED_SOURCES)
 	rm -rf $(qapi-dir)
 	$(MAKE) -C tests/tcg clean
-- 
1.7.7


