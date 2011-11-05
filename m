Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMbSZ-0002r4-Ik
	for mharc-qemu-trivial@gnu.org; Sat, 05 Nov 2011 04:18:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbSX-0002q7-NG
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbSG-0001Q8-NB
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:18:37 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:59340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbSG-0001Q0-C1
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:18:20 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 10238839
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 16:16:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=from:to
	:subject:date:message-id; s=rsa1024; bh=Ru3CKGIWPsjufK2giqCD4+mb
	PL0=; b=XN0FPHniHeKja+I7MQj3KSjsRRDmUJ5qk6/DfAVOlixhCUCy1GrifIuN
	4VZ48/65L6VxlsttKhHjRJe4d7WpADYUucFuQO0JDKanbnBVSW2V8hw2GjP2t/g1
	QWisr1nuALb8bvvq63g5xvOz690s0G+D8P30bsUrUSaJlCt9o2E=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 0B59C838
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 16:16:33 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA58IJ1A039369
	for qemu-trivial@nongnu.org; Sat, 5 Nov 2011 16:18:19 +0800 (CST)
	(envelope-from chenwj)
From: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Date: Sat,  5 Nov 2011 16:18:19 +0800
Message-Id: <1320481099-39231-1-git-send-email-chenwj@iis.sinica.edu.tw>
X-Mailer: git-send-email 1.7.3.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH 2/2] linux-user/main.c: Add option to
	user-mode emulation so that user can specify log file name
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
X-List-Received-Date: Sat, 05 Nov 2011 08:18:38 -0000

  Add an option so that user can specify the log file name they want.

Signed-off-by: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
---
 linux-user/main.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index d1bbc57..c275c0b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -45,6 +45,7 @@ int gdbstub_port;
 envlist_t *envlist;
 const char *cpu_model;
 unsigned long mmap_min_addr;
+extern const char *logfilename;
 #if defined(CONFIG_USE_GUEST_BASE)
 unsigned long guest_base;
 int have_guest_base;
@@ -2945,6 +2946,11 @@ static void handle_arg_log(const char *arg)
     cpu_set_log(mask);
 }
 
+static void handle_arg_log_filename(const char *arg)
+{
+    logfilename = arg;
+}
+
 static void handle_arg_set_env(const char *arg)
 {
     char *r, *p, *token;
@@ -3125,6 +3131,8 @@ struct qemu_argument arg_table[] = {
 #endif
     {"d",          "QEMU_LOG",         true,  handle_arg_log,
      "options",    "activate log"},
+    {"D",          "QEMU_LOG_FILENAME", true, handle_arg_log_filename,
+     "filename",   "specify log file name"},
     {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
      "pagesize",   "set the host page size to 'pagesize'"},
     {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
-- 
1.7.3.5


