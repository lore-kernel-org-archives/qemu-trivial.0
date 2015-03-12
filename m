Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVwNe-0005qZ-J4
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 02:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwNb-0005mW-NM
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:14:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwNa-0002fW-PG
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:13:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVwNW-0002ed-Gq; Thu, 12 Mar 2015 02:13:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5569B41725;
	Thu, 12 Mar 2015 09:13:46 +0300 (MSK)
Message-ID: <55012E99.3030408@msgid.tls.msk.ru>
Date: Thu, 12 Mar 2015 09:13:45 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, 778737@bugs.debian.org
Subject: [Qemu-trivial] configure: enable kvm on x32
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
X-List-Received-Date: Thu, 12 Mar 2015 06:14:00 -0000

Here's a trivial change to enable kvm on x32 architecture.
I'm not 100% sure the result works correctly in all cases,
but this is a good start and in theory everything should
work.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/configure b/configure
index 47048f0..d2e626e 100755
--- a/configure
+++ b/configure
@@ -5164,7 +5164,9 @@ case "$target_name" in
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

