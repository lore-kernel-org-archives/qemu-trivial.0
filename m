Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fL5vy-0002VL-Nf
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 07:58:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fL5vw-0002Ty-7f
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 07:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fL5vv-0003uh-CU
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 07:58:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48730 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fL5vp-0003rP-7z; Tue, 22 May 2018 07:58:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73B1D4187E39;
	Tue, 22 May 2018 11:58:20 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-204-52.brq.redhat.com [10.40.204.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 738AB215CDA7;
	Tue, 22 May 2018 11:58:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 22 May 2018 13:58:18 +0200
Message-Id: <1526990298-17924-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 22 May 2018 11:58:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 22 May 2018 11:58:20 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] qemu-options: Mark the non-functional -clock
 option as deprecated
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
X-List-Received-Date: Tue, 22 May 2018 11:58:29 -0000

The function is only ignored since QEMU version 1.7.0. Let's mark
it as deprecated, so that we can finally completely remove it soon.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 5 +++++
 vl.c          | 1 +
 2 files changed, 6 insertions(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 0e0e0ae..057a48e 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2922,6 +2922,11 @@ The @code{-startdate} option has been replaced by @code{-rtc base=@var{date}}.
 Option @option{-virtioconsole} has been replaced by
 @option{-device virtconsole}.
 
+@subsection -clock (since 3.0.0)
+
+The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
+replacement since it is not needed anymore.
+
 @section qemu-img command line arguments
 
 @subsection convert -s (since 2.0.0)
diff --git a/vl.c b/vl.c
index d5836c6..f7c0a46 100644
--- a/vl.c
+++ b/vl.c
@@ -3829,6 +3829,7 @@ int main(int argc, char **argv, char **envp)
                 /* Clock options no longer exist.  Keep this option for
                  * backward compatibility.
                  */
+                warn_report("This option is ignored and will be removed soon");
                 break;
             case QEMU_OPTION_startdate:
                 warn_report("This option is deprecated, use '-rtc base=' instead.");
-- 
1.8.3.1


