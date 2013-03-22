Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ3gB-0005Gm-18
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 11:14:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UJ3g5-00056W-KF
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 11:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UJ3fz-000113-IV
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 11:14:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UJ3fs-0000zN-Dc; Fri, 22 Mar 2013 11:14:32 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2MFEU4p020808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 22 Mar 2013 11:14:31 -0400
Received: from localhost (ovpn-112-35.ams2.redhat.com [10.36.112.35])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2MFESq8031016; Fri, 22 Mar 2013 11:14:29 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 22 Mar 2013 16:14:16 +0100
Message-Id: <1363965261-22267-4-git-send-email-stefanha@redhat.com>
In-Reply-To: <1363965261-22267-1-git-send-email-stefanha@redhat.com>
References: <1363965261-22267-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Doug Goldstein <cardoe@cardoe.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/8] Advertise --libdir in configure --help
	output
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
X-List-Received-Date: Fri, 22 Mar 2013 15:14:49 -0000

From: Doug Goldstein <cardoe@cardoe.com>

The configure script allows you to supply a libdir via --libdir but was
not advertising this in --help.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
CC: qemu-trivial@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 46a7594..497ce29 100755
--- a/configure
+++ b/configure
@@ -1050,6 +1050,7 @@ echo "  --mandir=PATH            install man pages in PATH"
 echo "  --datadir=PATH           install firmware in PATH$confsuffix"
 echo "  --docdir=PATH            install documentation in PATH$confsuffix"
 echo "  --bindir=PATH            install binaries in PATH"
+echo "  --libdir=PATH            install libraries in PATH"
 echo "  --sysconfdir=PATH        install config in PATH$confsuffix"
 echo "  --localstatedir=PATH     install local state in PATH"
 echo "  --with-confsuffix=SUFFIX suffix for QEMU data inside datadir and sysconfdir [$confsuffix]"
-- 
1.8.1.4


