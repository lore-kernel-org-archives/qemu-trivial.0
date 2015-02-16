Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNGS8-0001mg-9p
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 02:50:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNGS6-0001jr-4m
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 02:50:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNGS5-0005vI-7B
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 02:50:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YNGRy-0005pL-Pp; Mon, 16 Feb 2015 02:50:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7BA4C42508;
	Mon, 16 Feb 2015 10:50:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6781591B;
	Mon, 16 Feb 2015 10:50:28 +0300 (MSK)
Received: (nullmailer pid 13305 invoked by uid 1000);
	Mon, 16 Feb 2015 07:50:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 16 Feb 2015 10:50:25 +0300
Message-Id: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH] migration/rdma: clean up qemu_rdma_dest_init
	a bit
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
X-List-Received-Date: Mon, 16 Feb 2015 07:50:47 -0000

Do not check for rdma->host being empty twice.  This removes a large
"if" block, so code indentation is changed.  While at it, remove an
ugly goto from the loop, replacing it with a cleaner if logic.  And
finally, there's no need to initialize `ret' variable since is always
has a value.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/rdma.c | 51 ++++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 6bee30c..76af724 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2366,10 +2366,10 @@ err_rdma_source_connect:
 
 static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
 {
-    int ret = -EINVAL, idx;
+    int ret, idx;
     struct rdma_cm_id *listen_id;
     char ip[40] = "unknown";
-    struct rdma_addrinfo *res;
+    struct rdma_addrinfo *res, *e;
     char port_str[16];
 
     for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
@@ -2377,7 +2377,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
         rdma->wr_data[idx].control_curr = NULL;
     }
 
-    if (rdma->host == NULL) {
+    if (!rdma->host || !rdma->host[0]) {
         ERROR(errp, "RDMA host is not set!");
         rdma->error_state = -EINVAL;
         return -1;
@@ -2400,40 +2400,33 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
     snprintf(port_str, 16, "%d", rdma->port);
     port_str[15] = '\0';
 
-    if (rdma->host && strcmp("", rdma->host)) {
-        struct rdma_addrinfo *e;
+    ret = rdma_getaddrinfo(rdma->host, port_str, NULL, &res);
+    if (ret < 0) {
+        ERROR(errp, "could not rdma_getaddrinfo address %s", rdma->host);
+        goto err_dest_init_bind_addr;
+    }
 
-        ret = rdma_getaddrinfo(rdma->host, port_str, NULL, &res);
-        if (ret < 0) {
-            ERROR(errp, "could not rdma_getaddrinfo address %s", rdma->host);
-            goto err_dest_init_bind_addr;
+    for (e = res; e != NULL; e = e->ai_next) {
+        inet_ntop(e->ai_family,
+            &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
+        trace_qemu_rdma_dest_init_trying(rdma->host, ip);
+        ret = rdma_bind_addr(listen_id, e->ai_dst_addr);
+        if (ret) {
+            continue;
         }
-
-        for (e = res; e != NULL; e = e->ai_next) {
-            inet_ntop(e->ai_family,
-                &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
-            trace_qemu_rdma_dest_init_trying(rdma->host, ip);
-            ret = rdma_bind_addr(listen_id, e->ai_dst_addr);
-            if (!ret) {
-                if (e->ai_family == AF_INET6) {
-                    ret = qemu_rdma_broken_ipv6_kernel(errp, listen_id->verbs);
-                    if (ret) {
-                        continue;
-                    }
-                }
-                    
-                goto listen;
+        if (e->ai_family == AF_INET6) {
+            ret = qemu_rdma_broken_ipv6_kernel(errp, listen_id->verbs);
+            if (ret) {
+                continue;
             }
         }
+        break; 
+    }
 
+    if (!e) {
         ERROR(errp, "Error: could not rdma_bind_addr!");
         goto err_dest_init_bind_addr;
-    } else {
-        ERROR(errp, "migration host and port not specified!");
-        ret = -EINVAL;
-        goto err_dest_init_bind_addr;
     }
-listen:
 
     rdma->listen_id = listen_id;
     qemu_rdma_dump_gid("dest_init", listen_id);
-- 
2.1.4


