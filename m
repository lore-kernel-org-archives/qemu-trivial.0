Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlECJ-0006cW-Ov
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 04:45:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlECD-0006Xu-DA
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlEC5-0008JI-NL
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:09 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:23098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlEC3-0008IE-PU; Mon, 03 Nov 2014 04:45:01 -0500
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWO13455; Mon, 03 Nov 2014 17:44:57 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1; Mon, 3 Nov 2014
	17:44:49 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 3 Nov 2014 17:44:31 +0800
Message-ID: <1415007872-8228-5-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020208.54574E99.0108, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2d66d47788a25596090c7eefb210facf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2 4/5] qemu-char: convert some open
	functions to use Error API
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
X-List-Received-Date: Mon, 03 Nov 2014 09:45:14 -0000

Convert several Character backend open functions to use the Error API.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qemu-char.c | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index e1f0e28..3ebdfe7 100644
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
@@ -1140,12 +1140,12 @@ static void qemu_chr_close_stdio(struct CharDriverState *chr)
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
 
@@ -1388,8 +1388,8 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
     ret->pty = g_strdup(pty_name);
     ret->has_pty = true;
 
-    fprintf(stderr, "char device redirected to %s (label %s)\n",
-            pty_name, id);
+    error_report("char device redirected to %s (label %s)",
+                 pty_name, id);
 
     s = g_malloc0(sizeof(PtyCharDriver));
     chr->opaque = s;
@@ -2057,11 +2057,11 @@ static int win_chr_pipe_poll(void *opaque)
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
 
@@ -2069,12 +2069,12 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
 
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
 
@@ -2084,7 +2084,7 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
                               PIPE_WAIT,
                               MAXCONNECT, NSENDBUF, NRECVBUF, NTIMEOUT, NULL);
     if (s->hcom == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed CreateNamedPipe (%lu)\n", GetLastError());
+        error_setg(errp, "Failed CreateNamedPipe (%lu)", GetLastError());
         s->hcom = NULL;
         goto fail;
     }
@@ -2093,13 +2093,13 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
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
@@ -2112,19 +2112,19 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
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
@@ -2132,9 +2132,11 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
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
@@ -2294,7 +2296,7 @@ static void win_stdio_close(CharDriverState *chr)
     g_free(chr);
 }
 
-static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
+static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts, Error **errp)
 {
     CharDriverState   *chr;
     WinStdioCharState *stdio;
@@ -2306,7 +2308,7 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
 
     stdio->hStdIn = GetStdHandle(STD_INPUT_HANDLE);
     if (stdio->hStdIn == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "cannot open stdio: invalid handle\n");
+        error_report(errp, "cannot open stdio: invalid handle");
         exit(1);
     }
 
@@ -2319,7 +2321,7 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
     if (is_console) {
         if (qemu_add_wait_object(stdio->hStdIn,
                                  win_stdio_wait_func, chr)) {
-            fprintf(stderr, "qemu_add_wait_object: failed\n");
+            error_setg(errp, "qemu_add_wait_object: failed");
         }
     } else {
         DWORD   dwId;
@@ -2332,12 +2334,12 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
         if (stdio->hInputThread == INVALID_HANDLE_VALUE
             || stdio->hInputReadyEvent == INVALID_HANDLE_VALUE
             || stdio->hInputDoneEvent == INVALID_HANDLE_VALUE) {
-            fprintf(stderr, "cannot create stdio thread or event\n");
+            error_report(errp, "cannot create stdio thread or event");
             exit(1);
         }
         if (qemu_add_wait_object(stdio->hInputReadyEvent,
                                  win_stdio_thread_wait_func, chr)) {
-            fprintf(stderr, "qemu_add_wait_object: failed\n");
+            error_setg(errp, "qemu_add_wait_object: failed");
         }
     }
 
@@ -4204,7 +4206,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
         chr = qmp_chardev_open_parallel(backend->parallel, errp);
         break;
     case CHARDEV_BACKEND_KIND_PIPE:
-        chr = qemu_chr_open_pipe(backend->pipe);
+        chr = qemu_chr_open_pipe(backend->pipe, errp);
         break;
     case CHARDEV_BACKEND_KIND_SOCKET:
         chr = qmp_chardev_open_socket(backend->socket, errp);
@@ -4241,7 +4243,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
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


