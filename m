Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YX4f6-0007cK-MA
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 05:16:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YX4f3-0007Yc-UO
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 05:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YX4f3-000405-5p
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 05:16:41 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:33283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YX4ex-0003vA-1I; Sun, 15 Mar 2015 05:16:35 -0400
Received: by wixw10 with SMTP id w10so14149815wix.0;
	Sun, 15 Mar 2015 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=+6KKamiS8K86t0xar9akbC/KfqyQImJz+qxOX1OcMhk=;
	b=jxTu7gifmD5bHn55hc5WzqPSfAFLYXKImCKbjKb1df+rH1+APjXc+lZejnktk0Kgpe
	F4zFwOZJWlm7aT90ny40zy2gxm2y+zhBrrHrpntoPmZqmtAvn3i9bAZHkB5UO+GZBCGB
	Q+vVQCdjgR4Jr4Cy7VxlRGUNGWL3Lp/hi1dPU3yOcF4bJSqO/n5cj1PJKrP3tKzaryi8
	dlkyCkgfJtYDrzq3kIt+G5ehv8HL0/kJ/ZsT1PeMEbmai/CPa8WMx0v4LClmN90MKEAD
	78Okeq5QzELYQOWmo2HpWUvpMWYsEiqG/1AjPr7wEk8T46WdMmde6yVMfjxHHYbIBmyG
	6ZHA==
X-Received: by 10.194.110.69 with SMTP id hy5mr114617542wjb.121.1426410994336; 
	Sun, 15 Mar 2015 02:16:34 -0700 (PDT)
Received: from donizetti.station (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	dj5sm10239024wjb.28.2015.03.15.02.16.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 02:16:33 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Mar 2015 10:16:28 +0100
Message-Id: <1426410988-3695-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.3.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, armbru@redhat.com,
	zhaoshenglong@huawei.com
Subject: [Qemu-trivial] [PATCH v3] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Sun, 15 Mar 2015 09:16:43 -0000

monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
command add_fd).  Free it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	v1->v2: line length [Fam], pass &error_abort [Shannon]
        v2->v3: use "!!" instead of "? true : false" [Markus]
---
 vl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index eba5d4c..5985680 100644
--- a/vl.c
+++ b/vl.c
@@ -1011,6 +1011,7 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
     int fd, dupfd, flags;
     int64_t fdset_id;
     const char *fd_opaque = NULL;
+    AddfdInfo *fdinfo;
 
     fd = qemu_opt_get_number(opts, "fd", -1);
     fdset_id = qemu_opt_get_number(opts, "set", -1);
@@ -1060,8 +1061,9 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
     }
 
     /* add the duplicate fd, and optionally the opaque string, to the fd set */
-    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
-                         fd_opaque, NULL);
+    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, !!fd_opaque, fd_opaque,
+                                  &error_abort);
+    g_free(fdinfo);
 
     return 0;
 }
-- 
2.3.0


