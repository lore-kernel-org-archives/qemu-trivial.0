Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etT03-0008CF-5k
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 01:56:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1etT01-0008Az-4Y
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 01:56:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1etT00-0006Ik-DW
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 01:56:29 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38034 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1etSzu-0006EL-2V; Wed, 07 Mar 2018 01:56:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCC8E404008D;
	Wed,  7 Mar 2018 06:56:17 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37E0910B0F49;
	Wed,  7 Mar 2018 06:56:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Date: Wed,  7 Mar 2018 07:56:09 +0100
Message-Id: <1520405769-22179-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 07 Mar 2018 06:56:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 07 Mar 2018 06:56:17 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] qemu-doc: Add the paragraph about the
 -no-frame deprecation again
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
X-List-Received-Date: Wed, 07 Mar 2018 06:56:30 -0000

The section has accidentially been removed while resolving a
contextual conflict during a rebase, so add this again.

Fixes: f29d4450428fe07e9d6b0655cef2e59bfa0b2ea5
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 NB: I also slightly changed the wording and removed the "SDL 2.0 lacks
 support for frameless windows" part - AFAIK it can do frameless windows
 with the SDL_WINDOW_BORDERLESS flag for SDL_CreateWindow().

 qemu-doc.texi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 39e38c8..031f443 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2728,6 +2728,12 @@ filesystem test suite. Also it requires the CAP_DAC_READ_SEARCH capability,
 which is not the recommended way to run QEMU. This backend should not be
 used and it will be removed with no replacement.
 
+@subsection -no-frame (since 2.12.0)
+
+The @code{--no-frame} argument works with SDL 1.2 only. The other user
+interfaces never implemented this in the first place. So this will be
+removed together with SDL 1.2 support.
+
 @subsection -rtc-td-hack (since 2.12.0)
 
 The @code{-rtc-td-hack} option has been replaced by
-- 
1.8.3.1


