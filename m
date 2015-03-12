Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW4YU-0003VE-Vx
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 10:57:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW4YQ-0003PP-PW
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW4YN-00040S-19
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:57:42 -0400
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:41449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YW4YF-0003zS-Ob; Thu, 12 Mar 2015 10:57:31 -0400
Received: by wghl2 with SMTP id l2so16951873wgh.8;
	Thu, 12 Mar 2015 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ynPJWkxJ7lPoeV+w3no+YMwv7oM504FWL/U1n1JZoHw=;
	b=I0Ph02jUoHBKymzznreKDDO8v5Q26/TVC1NiP4D88PfK9ipU1R1Su6WcH14TBU3pI5
	PYvgSi2WFeoBmxVt/8ufMurzPz9EtwfOIYWXX9I+baGG+b+NQwSqTrazY4eaI1nfVs/4
	zLRhs0VOXSa9zc6SPnnKOq8RcKZ8EhbdQyMVo6SGWeJ02aSjDO6XM0/4DSpmtDRo9IVp
	4YO7vuIZ63hwqKRli6IsC29I3SC1IsPhFO9MgVvOUv2JZ+ajjfdPMDkOnjg98elA2Ao+
	iFwqhB5VhCoVhlR8bgpFmjB9r8E3JxhCn/sErysTqa38E9gTYiAkXgRqrNEp1VfOjBGs
	/ILQ==
X-Received: by 10.194.200.8 with SMTP id jo8mr58407612wjc.64.1426172251040;
	Thu, 12 Mar 2015 07:57:31 -0700 (PDT)
Received: from donizetti.station (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	lu13sm11087891wic.10.2015.03.12.07.57.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 07:57:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Mar 2015 15:57:23 +0100
Message-Id: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.3.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vl: fix resource leak with
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
X-List-Received-Date: Thu, 12 Mar 2015 14:57:46 -0000

monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
command add_fd).  Free it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index eba5d4c..8902435 100644
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
+    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
+                                  fd_opaque, NULL);
+    g_free(fdinfo);
 
     return 0;
 }
-- 
2.3.0


