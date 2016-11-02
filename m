Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1sTf-0004Ar-Vq
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 06:09:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1sTa-000480-6q
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 06:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1sTZ-0003KO-Cj
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 06:08:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54584)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c1sTU-0003Fq-90; Wed, 02 Nov 2016 06:08:52 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B2B461B8E;
	Wed,  2 Nov 2016 10:08:51 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA2A8np9023704; Wed, 2 Nov 2016 06:08:50 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Wed,  2 Nov 2016 11:08:48 +0100
Message-Id: <1478081328-25515-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 02 Nov 2016 10:08:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ui/gtk: Fix build with older versions of gtk
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
X-List-Received-Date: Wed, 02 Nov 2016 10:09:02 -0000

GDK_KEY_Delete is only defined with gtk version 2.22 and newer,
on older versions this key was called GDK_Delete instead.
Since this is the case for all GDK_KEY_* defines, change the
already existing preprocessor check there to test for version 2.22,
so we know that we can remove this code block in case we require
that version as a minimum one day.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 ui/gtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index ca737c4..e816428 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -94,7 +94,7 @@
 #define GDK_IS_WIN32_DISPLAY(dpy) (dpy == dpy)
 #endif
 
-#ifndef GDK_KEY_0
+#if !GTK_CHECK_VERSION(2, 22, 0)
 #define GDK_KEY_0 GDK_0
 #define GDK_KEY_1 GDK_1
 #define GDK_KEY_2 GDK_2
@@ -104,6 +104,7 @@
 #define GDK_KEY_plus GDK_plus
 #define GDK_KEY_minus GDK_minus
 #define GDK_KEY_Pause GDK_Pause
+#define GDK_KEY_Delete GDK_Delete
 #endif
 
 /* Some older mingw versions lack this constant or have
-- 
1.8.3.1


