Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNiGm-0005rH-3M
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 04:47:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNiGj-0005r7-OF
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:47:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNiGi-0007nk-Cx
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:47:01 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:42654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNiGh-0007n8-7o
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:47:00 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 5B9AFB62;
	Tue,  8 Nov 2011 17:44:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=5BtOmqHGesjnxEFChA5aBrL1o8U=; b=NrqsDvm2YnvU4/waMZV1
	vXrp4/sImwAD4brKWmmxi7xR2kg2AnIG4RSRqu5x/2Ii+BynCQVZfGjAwhruKzax
	Adkx6a768nLgp/HwlIzYgx/muZ0uxu9ArlM089q6V/vy4KcKtpYN0xaBQKLIxGp8
	ciqIYRaS46A6FK+nIUUWz7g=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 50C5EB61;
	Tue,  8 Nov 2011 17:44:56 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA89kimV046332;
	Tue, 8 Nov 2011 17:46:44 +0800 (CST) (envelope-from chenwj)
Date: Tue, 8 Nov 2011 17:46:44 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20111108094644.GA44893@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: riku.voipio@iki.fi
Subject: [Qemu-trivial] [PATCH] linux-user/main.c: Add option to user-mode
 emulation so that user can specify log file name
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
X-List-Received-Date: Tue, 08 Nov 2011 09:47:03 -0000

  QEMU linux user-mode's default log file name is "/tmp/qemu.log". In order to
change the log file name, user need to modify the source code then recompile
QEMU. This patch allow user use "-D logfile" option to specify the log file
name.

Signed-off-by: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
---
 linux-user/main.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index d1bbc57..95d689e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -2945,6 +2945,11 @@ static void handle_arg_log(const char *arg)
     cpu_set_log(mask);
 }
 
+static void handle_arg_log_filename(const char *arg)
+{
+    cpu_set_log_filename(arg);
+}
+
 static void handle_arg_set_env(const char *arg)
 {
     char *r, *p, *token;
@@ -3125,6 +3130,8 @@ struct qemu_argument arg_table[] = {
 #endif
     {"d",          "QEMU_LOG",         true,  handle_arg_log,
      "options",    "activate log"},
+    {"D",          "QEMU_LOG_FILENAME", true, handle_arg_log_filename,
+     "logfile",     "override default logfile location"},
     {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
      "pagesize",   "set the host page size to 'pagesize'"},
     {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
-- 
1.7.3.4

