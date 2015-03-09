Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV1W4-0003N2-KQ
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 13:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vx-00037K-3G
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vs-0005lQ-GH
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:49 -0400
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:57019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vs-0005kw-3T
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:44 -0400
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:30:42 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:30:41 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4C1A51B0805F; 
	Mon,  9 Mar 2015 17:31:01 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29HUfTM8978824; Mon, 9 Mar 2015 17:30:41 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t29HUeDm025053; Mon, 9 Mar 2015 11:30:41 -0600
Received: from oc7435384737.ibm.com (sig-9-81-34-230.evts.uk.ibm.com
	[9.81.34.230])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t29HUF7p024224; Mon, 9 Mar 2015 11:30:40 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Mar 2015 18:30:11 +0100
Message-Id: <1425922215-20819-5-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030917-0013-0000-0000-0000033BBE50
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Cc: Luiz Capitulino <lcapitulino@redhat.com>, qemu-devel@nongnu.org,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 4/8] monitor: Remove unused functions
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
X-List-Received-Date: Mon, 09 Mar 2015 17:30:54 -0000

The functions ringbuf_read_completion() and monitor_get_rs()
are not used anywhere anymore, so let's remove them.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Luiz Capitulino <lcapitulino@redhat.com>
---
 hmp.h                     |    1 -
 include/monitor/monitor.h |    1 -
 monitor.c                 |   13 -------------
 3 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/hmp.h b/hmp.h
index 81177b2..0c96e9a 100644
--- a/hmp.h
+++ b/hmp.h
@@ -106,7 +106,6 @@ void set_link_completion(ReadLineState *rs, int nb_args, const char *str);
 void netdev_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void ringbuf_write_completion(ReadLineState *rs, int nb_args, const char *str);
-void ringbuf_read_completion(ReadLineState *rs, int nb_args, const char *str);
 void watchdog_action_completion(ReadLineState *rs, int nb_args,
                                 const char *str);
 void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1c06bed..df67d56 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -47,7 +47,6 @@ typedef void (MonitorCompletion)(void *opaque, QObject *ret_data);
 
 void monitor_set_error(Monitor *mon, QError *qerror);
 void monitor_read_command(Monitor *mon, int show_prompt);
-ReadLineState *monitor_get_rs(Monitor *mon);
 int monitor_read_password(Monitor *mon, ReadLineFunc *readline_func,
                           void *opaque);
 
diff --git a/monitor.c b/monitor.c
index c86a89e..18d7f23 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4385,14 +4385,6 @@ static void ringbuf_completion(ReadLineState *rs, const char *str)
     qapi_free_ChardevInfoList(start);
 }
 
-void ringbuf_read_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    if (nb_args != 2) {
-        return;
-    }
-    ringbuf_completion(rs, str);
-}
-
 void ringbuf_write_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     if (nb_args != 2) {
@@ -5370,11 +5362,6 @@ static void bdrv_password_cb(void *opaque, const char *password,
     monitor_read_command(mon, 1);
 }
 
-ReadLineState *monitor_get_rs(Monitor *mon)
-{
-    return mon->rs;
-}
-
 int monitor_read_bdrv_key_start(Monitor *mon, BlockDriverState *bs,
                                 BlockCompletionFunc *completion_cb,
                                 void *opaque)
-- 
1.7.1


