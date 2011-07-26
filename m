Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlilW-00018k-Ss
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 10:37:46 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1QlilV-00018d-1N
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:37:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1QlilT-0005gH-UK
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:37:45 -0400
Received: from e37.co.us.ibm.com ([32.97.110.158]:35975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1QlilT-0005gD-Nq; Tue, 26 Jul 2011 10:37:43 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e37.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6QEYaOV024286;
	Tue, 26 Jul 2011 08:34:36 -0600
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	p6QEbWH9145692; Tue, 26 Jul 2011 08:37:33 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id p6QEbJU8032429; Tue, 26 Jul 2011 08:37:19 -0600
Received: from [9.59.241.154] (d941e-10.watson.ibm.com [9.59.241.154])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6QEbHHG032100; Tue, 26 Jul 2011 08:37:18 -0600
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, aliguori@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Jul 2011 10:33:50 -0400
Message-ID: <1311690830.7898.7.camel@d941e-10>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 (2.32.2-1.fc14) 
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.110.158
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Makefile: Fix parallel building after a
	clean tree
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
X-List-Received-Date: Tue, 26 Jul 2011 14:37:45 -0000

This patch fixes a compilation error when building qemu after 'make clean'
by parallel building using 'make -j6' for example. A dependency seems to be missing.

  GEN   qemu-options.def
  GEN   trace.h
  GEN   qapi-generated/qga-qapi-types.h
  GEN   qapi-generated/qga-qapi-visit.h
  GEN   qapi-generated/qga-qmp-marshal.c
  CC    qga/guest-agent-command-state.o
  CC    qga/guest-agent-commands.o
  GEN   trace.c
  GEN   qemu-img-cmds.h
cc1: error: qapi-generated: No such file or directory [-Werror]
cc1: all warnings being treated as errors


Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
 Makefile |    2 ++
 1 file changed, 2 insertions(+)

Index: qemu-git/Makefile
===================================================================
--- qemu-git.orig/Makefile
+++ qemu-git/Makefile
@@ -192,6 +192,8 @@ test-qmp-commands.o: $(addprefix $(qapi-
 test-qmp-commands: test-qmp-commands.o qfloat.o qint.o qdict.o qstring.o qlist.o qbool.o $(qapi-obj-y) error.o osdep.o qemu-malloc.o $(oslib-obj-y) qjson.o json-streamer.o json-lexer.o json-parser.o qerror.o qemu-error.o qemu-tool.o $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o $(qapi-dir)/test-qmp-marshal.o module.o
 
 QGALIB=qga/guest-agent-command-state.o qga/guest-agent-commands.o
+$(QGALIB): qemu-ga.o
+
 
 qemu-ga.o: $(addprefix $(qapi-dir)/, qga-qapi-types.c qga-qapi-types.h qga-qapi-visit.c qga-qmp-marshal.c) $(qapi-obj-y)
 qemu-ga$(EXESUF): qemu-ga.o $(QGALIB) qemu-tool.o qemu-error.o error.o $(oslib-obj-y) $(trace-obj-y) $(block-obj-y) $(qobject-obj-y) $(version-obj-y) $(qapi-obj-y) qemu-timer-common.o qemu-sockets.o module.o qapi/qmp-dispatch.o qapi/qmp-registry.o $(qapi-dir)/qga-qapi-visit.o $(qapi-dir)/qga-qapi-types.o $(qapi-dir)/qga-qmp-marshal.o


