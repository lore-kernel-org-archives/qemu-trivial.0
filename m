Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlbhW-0004fO-Ru
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 05:51:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhP-0004ed-Aq
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhK-0005bO-Hz
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:50:55 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:49430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlbhH-0005ZD-KE; Tue, 04 Nov 2014 05:50:50 -0500
Received: from 172.24.2.119 (EHLO szxeml415-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDX70075; Tue, 04 Nov 2014 18:50:42 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml415-hub.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Nov 2014
	18:50:32 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 4 Nov 2014 18:50:21 +0800
Message-ID: <1415098223-32404-4-git-send-email-zhang.zhanghailiang@huawei.com>
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
Subject: [Qemu-trivial] [PATCH v3 3/5] qemu-char: fix incorrect state in
	error message
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
X-List-Received-Date: Tue, 04 Nov 2014 10:51:01 -0000

It is either "Failed _to_ do something", or "something failed",
but not "failed something".

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qemu-char.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index a09bbf6..0f38cdd 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1872,25 +1872,25 @@ static int win_chr_init(CharDriverState *chr, const char *filename)
 
     s->hsend = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hsend) {
-        fprintf(stderr, "Failed CreateEvent\n");
+        fprintf(stderr, "CreateEvent failed\n");
         goto fail;
     }
     s->hrecv = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hrecv) {
-        fprintf(stderr, "Failed CreateEvent\n");
+        fprintf(stderr, "CreateEvent failed\n");
         goto fail;
     }
 
     s->hcom = CreateFile(filename, GENERIC_READ|GENERIC_WRITE, 0, NULL,
                       OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);
     if (s->hcom == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed CreateFile (%lu)\n", GetLastError());
+        fprintf(stderr, "CreateFile (%lu) failed\n", GetLastError());
         s->hcom = NULL;
         goto fail;
     }
 
     if (!SetupComm(s->hcom, NRECVBUF, NSENDBUF)) {
-        fprintf(stderr, "Failed SetupComm\n");
+        fprintf(stderr, "SetupComm failed\n");
         goto fail;
     }
 
@@ -1901,23 +1901,23 @@ static int win_chr_init(CharDriverState *chr, const char *filename)
     CommConfigDialog(filename, NULL, &comcfg);
 
     if (!SetCommState(s->hcom, &comcfg.dcb)) {
-        fprintf(stderr, "Failed SetCommState\n");
+        fprintf(stderr, "SetCommState failed\n");
         goto fail;
     }
 
     if (!SetCommMask(s->hcom, EV_ERR)) {
-        fprintf(stderr, "Failed SetCommMask\n");
+        fprintf(stderr, "SetCommMask failed\n");
         goto fail;
     }
 
     cto.ReadIntervalTimeout = MAXDWORD;
     if (!SetCommTimeouts(s->hcom, &cto)) {
-        fprintf(stderr, "Failed SetCommTimeouts\n");
+        fprintf(stderr, "SetCommTimeouts failed\n");
         goto fail;
     }
 
     if (!ClearCommError(s->hcom, &err, &comstat)) {
-        fprintf(stderr, "Failed ClearCommError\n");
+        fprintf(stderr, "ClearCommError failed\n");
         goto fail;
     }
     qemu_add_polling_cb(win_chr_poll, chr);
@@ -2069,12 +2069,12 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
 
     s->hsend = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hsend) {
-        fprintf(stderr, "Failed CreateEvent\n");
+        fprintf(stderr, "CreateEvent failed\n");
         goto fail;
     }
     s->hrecv = CreateEvent(NULL, TRUE, FALSE, NULL);
     if (!s->hrecv) {
-        fprintf(stderr, "Failed CreateEvent\n");
+        fprintf(stderr, "CreateEvent failed\n");
         goto fail;
     }
 
@@ -2084,7 +2084,7 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
                               PIPE_WAIT,
                               MAXCONNECT, NSENDBUF, NRECVBUF, NTIMEOUT, NULL);
     if (s->hcom == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed CreateNamedPipe (%lu)\n", GetLastError());
+        fprintf(stderr, "CreateNamedPipe (%lu) failed\n", GetLastError());
         s->hcom = NULL;
         goto fail;
     }
@@ -2093,13 +2093,13 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
     ov.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
     ret = ConnectNamedPipe(s->hcom, &ov);
     if (ret) {
-        fprintf(stderr, "Failed ConnectNamedPipe\n");
+        fprintf(stderr, "ConnectNamedPipe failed\n");
         goto fail;
     }
 
     ret = GetOverlappedResult(s->hcom, &ov, &size, TRUE);
     if (!ret) {
-        fprintf(stderr, "Failed GetOverlappedResult\n");
+        fprintf(stderr, "GetOverlappedResult failed\n");
         if (ov.hEvent) {
             CloseHandle(ov.hEvent);
             ov.hEvent = NULL;
-- 
1.7.12.4


