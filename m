Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3IBK-0007QY-UD
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2019 06:29:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h3IBI-0007OW-Tk
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 06:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h3IBI-0000qJ-4y
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 06:29:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h3IBG-0000pL-9j; Mon, 11 Mar 2019 06:29:14 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 903213082AFA;
	Mon, 11 Mar 2019 10:29:13 +0000 (UTC)
Received: from thuth.com (ovpn-116-155.ams2.redhat.com [10.36.116.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75B8919731;
	Mon, 11 Mar 2019 10:29:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Mon, 11 Mar 2019 11:29:05 +0100
Message-Id: <1552300145-12526-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 11 Mar 2019 10:29:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: Remove old *-config-devices.mak.d
 files when running configure
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2019 10:29:17 -0000

When running "make" in a build directory from the pre-Kconfig merge time,
the build process currently fails with:

 make: *** No rule to make target `.../default-configs/pci.mak',
  needed by `aarch64-softmmu/config-devices.mak'.  Stop.

To make sure that this problem at least goes away when the user runs
"configure" (or "sh config.status") again, we have to make sure that
we re-generate the .mak.d files. Thus remove the old stale files
while running the configure script.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index b354e74..32c847f 100755
--- a/configure
+++ b/configure
@@ -1792,6 +1792,9 @@ EOF
 exit 0
 fi
 
+# Remove old dependency files to make sure that they get properly regenerated
+rm -f *-config-devices.mak.d
+
 if ! has $python; then
   error_exit "Python not found. Use --python=/path/to/python"
 fi
-- 
1.8.3.1


