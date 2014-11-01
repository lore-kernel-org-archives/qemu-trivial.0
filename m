Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkNq9-00073J-BR
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 21:50:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNq1-0006tY-U5
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNpv-00028n-33
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:45 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:18673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XkNpu-00024D-3l; Fri, 31 Oct 2014 21:50:39 -0400
Received: from 172.24.2.119 (EHLO szxeml462-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWL33055; Sat, 01 Nov 2014 09:50:35 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml462-hub.china.huawei.com
	(10.82.67.205) with Microsoft SMTP Server id 14.3.158.1; Sat, 1 Nov 2014
	09:50:25 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 1 Nov 2014 09:50:02 +0800
Message-ID: <1414806603-22556-4-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.54543C6C.0002, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fcbc382ba93c227ba538426cc2d99fbe
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: pbonzini@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 3/4] qemu-char: convert some open functions
	to use Error API
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
X-List-Received-Date: Sat, 01 Nov 2014 01:50:50 -0000

Convert several Character backend open functions to use the Error API.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qemu-char.c | 52 +++++++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 42b1d8f..52379cc 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1077,7 +1077,7 @@ static CharDriverState *qemu_chr_open_fd(int fd_in, int fd_out)
     return chr;
 }
 
-static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
+static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts, Error **errp)
 {
     int fd_in, fd_out;
     char filename_in[CHR_MAX_FILENAME_SIZE];
@@ -1085,7 +1085,7 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
     const char *filename = opts->device;
 
     if (filename == NULL || strlen(filename) == 0) {
-        fprintf(stderr, "chardev: pipe: no filename given\n");
+        error_setg(errp, "chardev: pipe: no filename given");
         return NULL;
     }
 
@@ -1145,17 +1145,17 @@ static void qemu_chr_close_stdio(struct CharDriverState *chr)
     fd_chr_close(chr);
 }
 
-static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
+static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts, Error **errp)
 {
     CharDriverState *chr;
 
     if (is_daemonized()) {
-        error_report("cannot use stdio with -daemonize");
+        error_setg(errp, "cannot use stdio with -daemonize");
         return NULL;
     }
 
     if (stdio_in_use) {
-        error_report("cannot use stdio by multiple character devices");
+        error_setg(errp, "cannot use stdio by multiple character devices");
         exit(1);
     }
 
@@ -1393,8 +1393,8 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
     ret->pty = g_strdup(pty_name);
     ret->has_pty = true;
 
-    fprintf(stderr, "char device redirected to %s (label %s)\n",
-            pty_name, id);
+    error_report("char device redirected to %s (label %s)",
+                 pty_name, id);
 
     s = g_malloc0(sizeof(PtyCharDriver));
     chr->opaque = s;
@@ -2062,11 +2062,11 @@ static int win_chr_pipe_poll(void *opaque)
     return 0;
 }
 
-static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
+static void win_chr_pipe_init(CharDriverState *chr, const char *filename,
+                              Error **errp)
 {
     WinCharState *s = chr->opaque;
     OVERLAPPED ov;
-    int ret;
     DWORD size;
     char openname[CHR_MAX_FILENAME_SIZE];
 
@@ -2074,12 +2074,12 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
 
     s->hsend = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hsend) {
-        fprintf(stderr, "Failed CreateEvent\n");
+        error_setg(errp, "Failed CreateEvent");
         goto fail;
     }
     s->hrecv = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hrecv) {
-        fprintf(stderr, "Failed CreateEvent\n");
+        error_setg(errp, "Failed CreateEvent");
         goto fail;
     }
 
@@ -2089,7 +2089,7 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
                               PIPE_WAIT,
                               MAXCONNECT, NSENDBUF, NRECVBUF, NTIMEOUT, NULL);
     if (s->hcom == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed CreateNamedPipe (%lu)\n", GetLastError());
+        error_setg(errp, "Failed CreateNamedPipe (%lu)", GetLastError());
         s->hcom = NULL;
         goto fail;
     }
@@ -2098,13 +2098,13 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
     ov.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
     ret = ConnectNamedPipe(s->hcom, &ov);
     if (ret) {
-        fprintf(stderr, "Failed ConnectNamedPipe\n");
+        error_setg(errp, "Failed ConnectNamedPipe");
         goto fail;
     }
 
     ret = GetOverlappedResult(s->hcom, &ov, &size, TRUE);
     if (!ret) {
-        fprintf(stderr, "Failed GetOverlappedResult\n");
+        error_setg(errp, "Failed GetOverlappedResult");
         if (ov.hEvent) {
             CloseHandle(ov.hEvent);
             ov.hEvent = NULL;
@@ -2117,19 +2117,19 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
         ov.hEvent = NULL;
     }
     qemu_add_polling_cb(win_chr_pipe_poll, chr);
-    return 0;
+    return;
 
  fail:
     win_chr_close(chr);
-    return -1;
 }
 
 
-static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
+static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts, Error **errp)
 {
     const char *filename = opts->device;
     CharDriverState *chr;
     WinCharState *s;
+    Error *local_err = NULL;
 
     chr = qemu_chr_alloc();
     s = g_malloc0(sizeof(WinCharState));
@@ -2137,9 +2137,11 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
     chr->chr_write = win_chr_write;
     chr->chr_close = win_chr_close;
 
-    if (win_chr_pipe_init(chr, filename) < 0) {
+    win_chr_pipe_init(chr, filename, &local_err);
+    if (local_err) {
         g_free(s);
         g_free(chr);
+        error_propagate(errp, local_err);
         return NULL;
     }
     return chr;
@@ -2299,7 +2301,7 @@ static void win_stdio_close(CharDriverState *chr)
     g_free(chr);
 }
 
-static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
+static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts, Error **errp)
 {
     CharDriverState   *chr;
     WinStdioCharState *stdio;
@@ -2311,7 +2313,7 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
 
     stdio->hStdIn = GetStdHandle(STD_INPUT_HANDLE);
     if (stdio->hStdIn == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "cannot open stdio: invalid handle\n");
+        error_setg(errp, "cannot open stdio: invalid handle");
         exit(1);
     }
 
@@ -2324,7 +2326,7 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
     if (is_console) {
         if (qemu_add_wait_object(stdio->hStdIn,
                                  win_stdio_wait_func, chr)) {
-            fprintf(stderr, "qemu_add_wait_object: failed\n");
+            error_setg(errp, "qemu_add_wait_object: failed");
         }
     } else {
         DWORD   dwId;
@@ -2337,12 +2339,12 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
         if (stdio->hInputThread == INVALID_HANDLE_VALUE
             || stdio->hInputReadyEvent == INVALID_HANDLE_VALUE
             || stdio->hInputDoneEvent == INVALID_HANDLE_VALUE) {
-            fprintf(stderr, "cannot create stdio thread or event\n");
+            error_setg(errp, "cannot create stdio thread or event");
             exit(1);
         }
         if (qemu_add_wait_object(stdio->hInputReadyEvent,
                                  win_stdio_thread_wait_func, chr)) {
-            fprintf(stderr, "qemu_add_wait_object: failed\n");
+            error_setg(errp, "qemu_add_wait_object: failed");
         }
     }
 
@@ -4209,7 +4211,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
         chr = qmp_chardev_open_parallel(backend->parallel, errp);
         break;
     case CHARDEV_BACKEND_KIND_PIPE:
-        chr = qemu_chr_open_pipe(backend->pipe);
+        chr = qemu_chr_open_pipe(backend->pipe, errp);
         break;
     case CHARDEV_BACKEND_KIND_SOCKET:
         chr = qmp_chardev_open_socket(backend->socket, errp);
@@ -4246,7 +4248,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
         chr = chr_testdev_init();
         break;
     case CHARDEV_BACKEND_KIND_STDIO:
-        chr = qemu_chr_open_stdio(backend->stdio);
+        chr = qemu_chr_open_stdio(backend->stdio, errp);
         break;
 #ifdef _WIN32
     case CHARDEV_BACKEND_KIND_CONSOLE:
-- 
1.7.12.4


