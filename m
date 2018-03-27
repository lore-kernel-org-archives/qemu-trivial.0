Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0qEO-00026N-Hu
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2018 11:09:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f0qEJ-0001yG-6e
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 11:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f0qEC-000650-R4
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 11:09:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34540 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1f0qE8-00063d-8I; Tue, 27 Mar 2018 11:09:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D69DF406804A;
	Tue, 27 Mar 2018 15:09:31 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-192-189.str.redhat.com
	[10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB2732026E03;
	Tue, 27 Mar 2018 15:09:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Mar 2018 17:09:30 +0200
Message-Id: <1522163370-18544-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 27 Mar 2018 15:09:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 27 Mar 2018 15:09:31 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] configure: Add missing configure options to
 help text
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
X-List-Received-Date: Tue, 27 Mar 2018 15:09:47 -0000

We forgot to mention --with-git, --libexecdir and --with-pkgversion
so far.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 4d0e92c..a473609 100755
--- a/configure
+++ b/configure
@@ -1497,16 +1497,19 @@ Advanced options (experts only):
   --install=INSTALL        use specified install [$install]
   --python=PYTHON          use specified python [$python]
   --smbd=SMBD              use specified smbd [$smbd]
+  --with-git=GIT           use specified git [$git]
   --static                 enable static build [$static]
   --mandir=PATH            install man pages in PATH
   --datadir=PATH           install firmware in PATH$confsuffix
   --docdir=PATH            install documentation in PATH$confsuffix
   --bindir=PATH            install binaries in PATH
   --libdir=PATH            install libraries in PATH
+  --libexecdir=PATH        install helper binaries in PATH
   --sysconfdir=PATH        install config in PATH$confsuffix
   --localstatedir=PATH     install local state in PATH (set at runtime on win32)
   --firmwarepath=PATH      search PATH for firmware files
   --with-confsuffix=SUFFIX suffix for QEMU data inside datadir/libdir/sysconfdir [$confsuffix]
+  --with-pkgversion=VERS   use specified string as sub-version of the package
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --disable-strip          disable stripping binaries
-- 
1.8.3.1


