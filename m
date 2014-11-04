Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlbhY-0004hQ-4x
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 05:51:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhR-0004en-FE
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhK-0005bl-Qa
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:50:57 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:49400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlbhH-0005Yj-KB; Tue, 04 Nov 2014 05:50:50 -0500
Received: from 172.24.2.119 (EHLO szxeml409-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDX70071; Tue, 04 Nov 2014 18:50:40 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml409-hub.china.huawei.com
	(10.82.67.136) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Nov 2014
	18:50:33 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 4 Nov 2014 18:50:22 +0800
Message-ID: <1415098223-32404-5-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, armbru@redhat.com,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, kraxel@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 4/5] qemu-char: convert some open
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
X-List-Received-Date: Tue, 04 Nov 2014 10:51:02 -0000

Convert several Character backend open functions to use the Error API.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qemu-char.c | 76 +++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 0f38cdd..a1d25c7 100644
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
 
@@ -1861,7 +1861,8 @@ static void win_chr_close(CharDriverState *chr)
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
 }
 
-static int win_chr_init(CharDriverState *chr, const char *filename)
+static void win_chr_init(CharDriverState *chr, const char *filename,
+                         Error **errp)
 {
     WinCharState *s = chr->opaque;
     COMMCONFIG comcfg;
@@ -1872,25 +1873,25 @@ static int win_chr_init(CharDriverState *chr, const char *filename)
 
     s->hsend = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hsend) {
-        fprintf(stderr, "CreateEvent failed\n");
+        error_setg(errp, "CreateEvent failed");
         goto fail;
     }
     s->hrecv = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hrecv) {
-        fprintf(stderr, "CreateEvent failed\n");
+        error_setg(errp, "CreateEvent failed");
         goto fail;
     }
 
     s->hcom = CreateFile(filename, GENERIC_READ|GENERIC_WRITE, 0, NULL,
                       OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);
     if (s->hcom == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "CreateFile (%lu) failed\n", GetLastError());
+        error_setg(errp, "CreateFile (%lu) failed", GetLastError());
         s->hcom = NULL;
         goto fail;
     }
 
     if (!SetupComm(s->hcom, NRECVBUF, NSENDBUF)) {
-        fprintf(stderr, "SetupComm failed\n");
+        error_setg(errp, "SetupComm failed");
         goto fail;
     }
 
@@ -1901,31 +1902,30 @@ static int win_chr_init(CharDriverState *chr, const char *filename)
     CommConfigDialog(filename, NULL, &comcfg);
 
     if (!SetCommState(s->hcom, &comcfg.dcb)) {
-        fprintf(stderr, "SetCommState failed\n");
+        error_setg(errp, "SetCommState failed");
         goto fail;
     }
 
     if (!SetCommMask(s->hcom, EV_ERR)) {
-        fprintf(stderr, "SetCommMask failed\n");
+        error_setg(errp, "SetCommMask failed");
         goto fail;
     }
 
     cto.ReadIntervalTimeout = MAXDWORD;
     if (!SetCommTimeouts(s->hcom, &cto)) {
-        fprintf(stderr, "SetCommTimeouts failed\n");
+        error_setg(errp, "SetCommTimeouts failed");
         goto fail;
     }
 
     if (!ClearCommError(s->hcom, &err, &comstat)) {
-        fprintf(stderr, "ClearCommError failed\n");
+        error_setg(errp, "ClearCommError failed");
         goto fail;
     }
     qemu_add_polling_cb(win_chr_poll, chr);
-    return 0;
+    return;
 
  fail:
     win_chr_close(chr);
-    return -1;
 }
 
 /* Called with chr_write_lock held.  */
@@ -2022,10 +2022,12 @@ static int win_chr_poll(void *opaque)
     return 0;
 }
 
-static CharDriverState *qemu_chr_open_win_path(const char *filename)
+static CharDriverState *qemu_chr_open_win_path(const char *filename,
+                                               Error **errp)
 {
     CharDriverState *chr;
     WinCharState *s;
+    Error *local_err = NULL;
 
     chr = qemu_chr_alloc();
     s = g_malloc0(sizeof(WinCharState));
@@ -2033,9 +2035,11 @@ static CharDriverState *qemu_chr_open_win_path(const char *filename)
     chr->chr_write = win_chr_write;
     chr->chr_close = win_chr_close;
 
-    if (win_chr_init(chr, filename) < 0) {
+    win_chr_init(chr, filename, &local_err);
+    if (local_err) {
         g_free(s);
         g_free(chr);
+        error_propagate(errp, local_err);
         return NULL;
     }
     return chr;
@@ -2057,11 +2061,11 @@ static int win_chr_pipe_poll(void *opaque)
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
 
@@ -2069,12 +2073,12 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
 
     s->hsend = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hsend) {
-        fprintf(stderr, "CreateEvent failed\n");
+        error_setg(errp, "CreateEvent failed");
         goto fail;
     }
     s->hrecv = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hrecv) {
-        fprintf(stderr, "CreateEvent failed\n");
+        error_setg(errp, "CreateEvent failed");
         goto fail;
     }
 
@@ -2084,7 +2088,7 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
                               PIPE_WAIT,
                               MAXCONNECT, NSENDBUF, NRECVBUF, NTIMEOUT, NULL);
     if (s->hcom == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "CreateNamedPipe (%lu) failed\n", GetLastError());
+        error_setg(errp, "CreateNamedPipe (%lu) failed", GetLastError());
         s->hcom = NULL;
         goto fail;
     }
@@ -2093,13 +2097,13 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
     ov.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
     ret = ConnectNamedPipe(s->hcom, &ov);
     if (ret) {
-        fprintf(stderr, "ConnectNamedPipe failed\n");
+        error_setg(errp, "ConnectNamedPipe failed");
         goto fail;
     }
 
     ret = GetOverlappedResult(s->hcom, &ov, &size, TRUE);
     if (!ret) {
-        fprintf(stderr, "GetOverlappedResult failed\n");
+        error_setg(errp, "GetOverlappedResult failed");
         if (ov.hEvent) {
             CloseHandle(ov.hEvent);
             ov.hEvent = NULL;
@@ -2112,19 +2116,19 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
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
@@ -2132,9 +2136,11 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
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
@@ -2294,7 +2300,7 @@ static void win_stdio_close(CharDriverState *chr)
     g_free(chr);
 }
 
-static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
+static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts, Error **errp)
 {
     CharDriverState   *chr;
     WinStdioCharState *stdio;
@@ -2306,7 +2312,7 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
 
     stdio->hStdIn = GetStdHandle(STD_INPUT_HANDLE);
     if (stdio->hStdIn == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "cannot open stdio: invalid handle\n");
+        error_report(errp, "cannot open stdio: invalid handle");
         exit(1);
     }
 
@@ -2319,7 +2325,7 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
     if (is_console) {
         if (qemu_add_wait_object(stdio->hStdIn,
                                  win_stdio_wait_func, chr)) {
-            fprintf(stderr, "qemu_add_wait_object: failed\n");
+            error_setg(errp, "qemu_add_wait_object: failed");
         }
     } else {
         DWORD   dwId;
@@ -2332,12 +2338,12 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
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
 
@@ -3994,7 +4000,7 @@ static CharDriverState *qmp_chardev_open_file(ChardevFile *file, Error **errp)
 static CharDriverState *qmp_chardev_open_serial(ChardevHostdev *serial,
                                                 Error **errp)
 {
-    return qemu_chr_open_win_path(serial->device);
+    return qemu_chr_open_win_path(serial->device, errp);
 }
 
 static CharDriverState *qmp_chardev_open_parallel(ChardevHostdev *parallel,
@@ -4204,7 +4210,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
         chr = qmp_chardev_open_parallel(backend->parallel, errp);
         break;
     case CHARDEV_BACKEND_KIND_PIPE:
-        chr = qemu_chr_open_pipe(backend->pipe);
+        chr = qemu_chr_open_pipe(backend->pipe, errp);
         break;
     case CHARDEV_BACKEND_KIND_SOCKET:
         chr = qmp_chardev_open_socket(backend->socket, errp);
@@ -4241,7 +4247,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
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


