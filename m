Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VjkVv-00067L-KZ
	for mharc-qemu-trivial@gnu.org; Fri, 22 Nov 2013 01:46:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VjkVo-00064e-09
	for qemu-trivial@nongnu.org; Fri, 22 Nov 2013 01:46:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VjkVh-0002Eh-Jd
	for qemu-trivial@nongnu.org; Fri, 22 Nov 2013 01:46:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1VjkVh-0002D0-Bt; Fri, 22 Nov 2013 01:46:37 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAM6kVFR030959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 22 Nov 2013 01:46:35 -0500
Received: from ad.nay.redhat.com ([10.66.6.190])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rAM6e0Bv031570; Fri, 22 Nov 2013 01:40:01 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 22 Nov 2013 14:39:56 +0800
Message-Id: <1385102396-2642-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH] .gitignore: Ignore config.status
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
X-List-Received-Date: Fri, 22 Nov 2013 06:46:50 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 5584b5f..1c9d63d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -3,6 +3,7 @@ config-all-devices.*
 config-all-disas.*
 config-host.*
 config-target.*
+config.status
 trace/generated-tracers.h
 trace/generated-tracers.c
 trace/generated-tracers-dtrace.h
-- 
1.8.4.2


