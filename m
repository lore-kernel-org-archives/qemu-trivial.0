Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XeLFL-0006rO-RG
	for mharc-qemu-trivial@gnu.org; Wed, 15 Oct 2014 05:51:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XeLFE-0006eV-1a
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:51:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XeLF7-0007cO-Hk
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:51:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46720)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1XeLEu-0007ZA-PO; Wed, 15 Oct 2014 05:51:28 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9F9pS3U009171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 15 Oct 2014 05:51:28 -0400
Received: from nilsson.home.kraxel.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9F9pRn2006484; Wed, 15 Oct 2014 05:51:27 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 6ADF3808F0; Wed, 15 Oct 2014 11:51:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 Oct 2014 11:51:09 +0200
Message-Id: <1413366669-10192-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] sparse: fix build
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
X-List-Received-Date: Wed, 15 Oct 2014 09:51:54 -0000

c++ compiler isn't wrapped with cgcc, resulting in gcc complaining about
the sparse compiler flags which it doesn't know in case qemu is built
with --enable-sparse.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 9ac2600..90349f3 100755
--- a/configure
+++ b/configure
@@ -4908,6 +4908,7 @@ echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_INCLUDES=$QEMU_INCLUDES" >> $config_host_mak
 if test "$sparse" = "yes" ; then
   echo "CC           := REAL_CC=\"\$(CC)\" cgcc"       >> $config_host_mak
+  echo "CXX          := REAL_CC=\"\$(CXX)\" cgcc"      >> $config_host_mak
   echo "HOST_CC      := REAL_CC=\"\$(HOST_CC)\" cgcc"  >> $config_host_mak
   echo "QEMU_CFLAGS  += -Wbitwise -Wno-transparent-union -Wno-old-initializer -Wno-non-pointer-null" >> $config_host_mak
 fi
-- 
1.8.3.1


