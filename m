Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFFuj-00034c-2x
	for mharc-qemu-trivial@gnu.org; Tue, 01 Oct 2019 07:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iFFub-0002wr-Uo
 for qemu-trivial@nongnu.org; Tue, 01 Oct 2019 07:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iFFuZ-0005Nf-UO
 for qemu-trivial@nongnu.org; Tue, 01 Oct 2019 07:01:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44784)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iFFuE-0005Er-Jk; Tue, 01 Oct 2019 07:01:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 51848309321D;
 Tue,  1 Oct 2019 11:01:21 +0000 (UTC)
Received: from thuth.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E88A75D6D0;
 Tue,  1 Oct 2019 11:01:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] qemu-doc: Remove paragraph about requiring a HD image with
 -kernel
Date: Tue,  1 Oct 2019 13:01:11 +0200
Message-Id: <20191001110111.4870-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 01 Oct 2019 11:01:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2019 11:01:51 -0000

The need for specifying "-hda" together with "-kernel" has been removed in
commit 57a46d057995 ("Convert linux bootrom to external rom and fw_cfg"),
almost 10 years ago, so let's remove this description from our documentation
now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 2ba6c90c08..3c5022050f 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -906,10 +906,6 @@ Use @option{-kernel} to provide the Linux kernel image and
 @option{-append} to give the kernel command line arguments. The
 @option{-initrd} option can be used to provide an INITRD image.
 
-When using the direct Linux boot, a disk image for the first hard disk
-@file{hda} is required because its boot sector is used to launch the
-Linux kernel.
-
 If you do not need graphical output, you can disable it and redirect
 the virtual serial port and the QEMU monitor to the console with the
 @option{-nographic} option. The typical command line is:
-- 
2.18.1


