Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9mn8-0003ko-2W
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 20:19:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S9mn5-0003bb-39
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 20:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S9mn3-00063V-Cu
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 20:19:06 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:45761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1S9mmc-0005yK-TX; Mon, 19 Mar 2012 20:18:39 -0400
Received: by ggnj2 with SMTP id j2so6912254ggn.4
	for <multiple recipients>; Mon, 19 Mar 2012 17:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ww4a8TCRzxG5Zu9w04kTpd2iCHgC6N2GFmsjmKz3ibc=;
	b=wqPUgADPpm3HLBGnxjD1PW0Gfb12ZWNutH6XDSYmil/jblv/TxijpECYHYCkzDiepX
	WdGuj80Ivw4ljh7mbcJw1EGvKIoNQghZcq3YcdOOLFy0ect7W08qUtp6qlsYSVs0kt5c
	cXPiFs6hiMiiAkP1KtnZqzAx08CJ+2EeqzoM7c4rlbT0WO4VLgl0piV/0xW2AQ8K8eLr
	y0Ado2OfZ2Ex/XpP5EHwIW87aFaU9nhCYqOUZG1APrxTgCDBFJhd8vjKNcPIefjapphm
	yXM3qFXQYuxaKGlLvtMP6q8DZTPdjApSsmVTqmvj1NVuW8EKotoCJxLWCX+xI6VyWjuk
	iyeQ==
Received: by 10.60.1.4 with SMTP id 4mr15770120oei.28.1332202716769;
	Mon, 19 Mar 2012 17:18:36 -0700 (PDT)
Received: from localhost.localdomain ([32.97.110.59])
	by mx.google.com with ESMTPS id g4sm11295540oeg.5.2012.03.19.17.18.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 17:18:36 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Mar 2012 19:18:25 -0500
Message-Id: <1332202706-25061-2-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 2/3] qapi: remove print statements from
	test-qmp-commands
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
X-List-Received-Date: Tue, 20 Mar 2012 00:19:08 -0000

This is necessary for nicer make check integration.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 test-qmp-commands.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/test-qmp-commands.c b/test-qmp-commands.c
index fa5a7bd..60cbf01 100644
--- a/test-qmp-commands.c
+++ b/test-qmp-commands.c
@@ -46,7 +46,6 @@ static void test_dispatch_cmd(void)
     resp = qmp_dispatch(QOBJECT(req));
     assert(resp != NULL);
     assert(!qdict_haskey(qobject_to_qdict(resp), "error"));
-    g_print("\nresp: %s\n", qstring_get_str(qobject_to_json(resp)));
 
     qobject_decref(resp);
     QDECREF(req);
@@ -63,7 +62,6 @@ static void test_dispatch_cmd_error(void)
     resp = qmp_dispatch(QOBJECT(req));
     assert(resp != NULL);
     assert(qdict_haskey(qobject_to_qdict(resp), "error"));
-    g_print("\nresp: %s\n", qstring_get_str(qobject_to_json_pretty(resp)));
 
     qobject_decref(resp);
     QDECREF(req);
@@ -92,7 +90,6 @@ static void test_dispatch_cmd_io(void)
     resp = qmp_dispatch(QOBJECT(req));
     assert(resp != NULL);
     assert(!qdict_haskey(qobject_to_qdict(resp), "error"));
-    g_print("\nresp: %s\n", qstring_get_str(qobject_to_json_pretty(resp)));
 
     qobject_decref(resp);
     QDECREF(req);
-- 
1.7.4.1


