Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhbG-00059k-Gz
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:12:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhbB-0004zk-2X
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhb1-0001iZ-RJ
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:53 -0500
Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231]:38706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhay-0001ZE-Ku; Mon, 26 Jan 2015 06:12:40 -0500
Received: by mail-we0-f177.google.com with SMTP id l61so8360292wev.8;
	Mon, 26 Jan 2015 03:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jp6MAc7xM1USR4HdTqXd9n9KGMHdxImZanpgf6R2Dh4=;
	b=yQgyQk1Os9I8qLNu80KTWbsuLJElHGD7UGybNwK6PB4SgJo1mOZash1MxbBk6EtSx/
	6eHnqQAwq4zGH2Ks+OW2vYqgxmqW+CQ9ecWd2WVFDJYDxyQEtmw6SnnqyxPhyV++lK/3
	WSl2xi/vIsNfoVWFpf3m7X4Ntod29bJvxUj0S3uruBZuZfK+QU9PwBfDYySnQkOcoWeB
	4YrC5tOSAB9hWyzi3qPFUH/j9jB8OyPbWHlEc59bAxG6iDYkBgBqHyOHlcd9/78uRUUF
	tcNEg1CeJDBrU47Vs4LxrjuRqcgxoEJOuyxCb+6tweLzzKYMK0s8zN39hh1cOtq/IZ0a
	kHvg==
X-Received: by 10.180.206.47 with SMTP id ll15mr28056517wic.34.1422270760026; 
	Mon, 26 Jan 2015 03:12:40 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:39 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:24 +0100
Message-Id: <1422270747-23994-5-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 4/7] qemu-sockets: improve error reporting in
	unix_listen_opts
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
X-List-Received-Date: Mon, 26 Jan 2015 11:12:56 -0000

Coverity complains about not checking the returned value of mkstemp.  While
at it, also improve error checking for snprintf, and refine error messages
in general.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-sockets.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index a76bb3c..cf4b91f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -694,7 +694,7 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
 
     sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
     if (sock < 0) {
-        error_setg_errno(errp, errno, "Failed to create socket");
+        error_setg_errno(errp, errno, "Failed to create Unix socket");
         return -1;
     }
 
@@ -703,9 +703,15 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
     if (path && strlen(path)) {
         snprintf(un.sun_path, sizeof(un.sun_path), "%s", path);
     } else {
-        char *tmpdir = getenv("TMPDIR");
-        snprintf(un.sun_path, sizeof(un.sun_path), "%s/qemu-socket-XXXXXX",
-                 tmpdir ? tmpdir : "/tmp");
+        const char *tmpdir = getenv("TMPDIR");
+        tmpdir = tmpdir ? tmpdir : "/tmp";
+        if (snprintf(un.sun_path, sizeof(un.sun_path), "%s/qemu-socket-XXXXXX",
+                     tmpdir) >= sizeof(un.sun_path)) {
+            error_setg_errno(errp, errno,
+                             "TMPDIR environment variable (%s) too large", tmpdir);
+            goto err;
+        }
+
         /*
          * This dummy fd usage silences the mktemp() unsecure warning.
          * Using mkstemp() doesn't make things more secure here
@@ -713,13 +719,19 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
          * to unlink first and thus re-open the race window.  The
          * worst case possible is bind() failing, i.e. a DoS attack.
          */
-        fd = mkstemp(un.sun_path); close(fd);
+        fd = mkstemp(un.sun_path);
+        if (fd < 0) {
+            error_setg_errno(errp, errno,
+                             "Failed to make a temporary socket name in %s", tmpdir);
+            goto err;
+        }
+        close(fd);
         qemu_opt_set(opts, "path", un.sun_path);
     }
 
     unlink(un.sun_path);
     if (bind(sock, (struct sockaddr*) &un, sizeof(un)) < 0) {
-        error_setg_errno(errp, errno, "Failed to bind socket");
+        error_setg_errno(errp, errno, "Failed to bind socket to %s", un.sun_path);
         goto err;
     }
     if (listen(sock, 1) < 0) {
-- 
1.8.3.1



