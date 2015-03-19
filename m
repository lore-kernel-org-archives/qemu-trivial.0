Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWP1-0004mY-OE
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:06:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOx-0004eS-PO
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOt-0004ns-9b
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:06:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWOh-0004kI-GA; Thu, 19 Mar 2015 05:05:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F28941E45;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E498B91C;
	Thu, 19 Mar 2015 12:05:44 +0300 (MSK)
Received: (nullmailer pid 353 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:33 +0300
Message-Id: <18b8263e4ee72697876b081a7520d4ec86b2aab1.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Adam Borowski <kilobyte@angband.pl>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/24] configure: enable kvm on x32
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
X-List-Received-Date: Thu, 19 Mar 2015 09:06:05 -0000

Here's a trivial change to enable kvm on x32 architecture.
I'm not 100% sure the result works correctly in all cases,
but this is a good start and in theory everything should
work.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index f74a6fd..589798e 100755
--- a/configure
+++ b/configure
@@ -5268,7 +5268,9 @@ case "$target_name" in
       \( "$target_name" = "ppcemb" -a "$cpu" = "ppc64" \) -o \
       \( "$target_name" = "mipsel" -a "$cpu" = "mips" \) -o \
       \( "$target_name" = "x86_64" -a "$cpu" = "i386"   \) -o \
-      \( "$target_name" = "i386"   -a "$cpu" = "x86_64" \) \) ; then
+      \( "$target_name" = "i386"   -a "$cpu" = "x86_64" \) -o \
+      \( "$target_name" = "x86_64" -a "$cpu" = "x32"   \) -o \
+      \( "$target_name" = "i386"   -a "$cpu" = "x32" \) \) ; then
       echo "CONFIG_KVM=y" >> $config_target_mak
       if test "$vhost_net" = "yes" ; then
         echo "CONFIG_VHOST_NET=y" >> $config_target_mak
-- 
2.1.4


