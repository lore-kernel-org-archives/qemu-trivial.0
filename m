Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlkfU-0003Qn-SW
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 12:39:40 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1QlkfS-0003G4-52
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 12:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1QlkfR-00064j-As
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 12:39:38 -0400
Received: from mout.perfora.net ([74.208.4.194]:55420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1QlkfO-00063p-QB; Tue, 26 Jul 2011 12:39:34 -0400
Received: from localhost.localdomain ([32.97.110.59])
	by mrelay.perfora.net (node=mrus4) with ESMTP (Nemesis)
	id 0McV8y-1R3HY72xUW-00IVOb; Tue, 26 Jul 2011 12:39:33 -0400
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jul 2011 11:39:24 -0500
Message-Id: <1311698364-32395-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <4E2EED1E.6030402@linux.vnet.ibm.com>
References: <4E2EED1E.6030402@linux.vnet.ibm.com>
X-Provags-ID: V02:K0:VwvqjCz7XPoDSeBYGPYQch7grMPbzpQ4oiPJneL1C4C
	PKqvAMinGS8IlpIxmjuory2C6myH1lVoK2k8Rf64CDCiOFfU1P
	NHE4Uw4OT7eLT7jIvZmtCTk2UjHCIyWWJsBHyD9B7NmC3561GB
	Wg++lBS9DydJlDSg+SfkBNfRhTfzo3tY9vzut3uUl71uwDoXkG
	rsUu/Eg/Rh77GXSZ3HGdMfWyGlKFjYnvkkjy2NTYdE=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.208.4.194
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com
Subject: [Qemu-trivial] [PATCH] Makefile: add missing deps on
	$(GENERATED_HEADERS)
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
X-List-Received-Date: Tue, 26 Jul 2011 16:39:39 -0000

This fixes a build issue with make -j6+ due to qapi-generated files
being built before $(GENERATED_HEADERS) have been created.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index daa3aa0..0a31633 100644
--- a/Makefile
+++ b/Makefile
@@ -192,8 +192,10 @@ test-qmp-commands.o: $(addprefix $(qapi-dir)/, test-qapi-types.c test-qapi-types
 test-qmp-commands: test-qmp-commands.o qfloat.o qint.o qdict.o qstring.o qlist.o qbool.o $(qapi-obj-y) error.o osdep.o qemu-malloc.o $(oslib-obj-y) qjson.o json-streamer.o json-lexer.o json-parser.o qerror.o qemu-error.o qemu-tool.o $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o $(qapi-dir)/test-qmp-marshal.o module.o
 
 QGALIB=qga/guest-agent-command-state.o qga/guest-agent-commands.o
+QGALIB_GEN=$(addprefix $(qapi-dir)/, qga-qapi-types.c qga-qapi-types.h qga-qapi-visit.c qga-qmp-marshal.c)
 
-qemu-ga.o: $(addprefix $(qapi-dir)/, qga-qapi-types.c qga-qapi-types.h qga-qapi-visit.c qga-qmp-marshal.c) $(qapi-obj-y)
+$(QGALIB_GEN): $(GENERATED_HEADERS)
+$(QGALIB) qemu-ga.o: $(QGALIB_GEN) $(qapi-obj-y)
 qemu-ga$(EXESUF): qemu-ga.o $(QGALIB) qemu-tool.o qemu-error.o error.o $(oslib-obj-y) $(trace-obj-y) $(block-obj-y) $(qobject-obj-y) $(version-obj-y) $(qapi-obj-y) qemu-timer-common.o qemu-sockets.o module.o qapi/qmp-dispatch.o qapi/qmp-registry.o $(qapi-dir)/qga-qapi-visit.o $(qapi-dir)/qga-qapi-types.o $(qapi-dir)/qga-qmp-marshal.o
 
 QEMULIBS=libhw32 libhw64 libuser libdis libdis-user
-- 
1.7.0.4


