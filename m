Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAwx6-0007ZV-TT
	for mharc-qemu-trivial@gnu.org; Thu, 19 Sep 2019 09:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iAwx1-0007Dl-Mt
 for qemu-trivial@nongnu.org; Thu, 19 Sep 2019 09:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iAwtb-0003jY-15
 for qemu-trivial@nongnu.org; Thu, 19 Sep 2019 09:54:55 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49025)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iAwta-0003id-O0; Thu, 19 Sep 2019 09:54:54 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MhTt7-1hfCyv0523-00eciQ; Thu, 19 Sep 2019 15:54:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 19 Sep 2019 15:54:40 +0200
Message-Id: <20190919135443.15164-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919135443.15164-1-laurent@vivier.eu>
References: <20190919135443.15164-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aCTxE/55gxbTEXoflVlPh1bltVT25udlMGvcJr7t/q40R7ThRgb
 H9aELoPdCdw3fzMls7LEHETnxZo30bLIp7ADV3kE/zD+kCZkXFVdWKV2UBWb00F+B44mog2
 rTRee6KCrDi5mpqkPMcf/Yr8PlCXsl19JNdRgJ6ueh/TAGp4n/85rl6U1331qdsrgE50oYF
 nBkAVeA7eyA9SD5wQ4TUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LQh90LL5D1s=:7sJ6Ylpn3dSOlJk6yvb0ZQ
 s/CF4HeSaVxPPAlrGlHBVXYvtiBmLjM3j61nbARM2cTzm2NzuiK10EfWZDBCmbo4gl19W2/yf
 XIOtYeU8SFZW+DcWe4+dmaLGRx5mMbQSzmuFS9ya5xYfFzl2y0Hhm3N4eV/Z5AVQp9NHqfO/l
 z8SlSm7E6unDioBv25aWBBqPq8W0htevjkpXDsbtXWXe6hrMuvZ6feF90tRhVjvRn8PcbKkYb
 f/n7oMYC9lDgAod6BxcwbQaYqve752wzP59HP/cwEqgZvkmyTKMlXdIIb9894YciFFxq2rQZo
 s98DeTqWDZq2YnDzSM3Fkm4ZB3MKHxzChGhAxLGcwM5GkQpdBCvxUZ56yqzFhFe/n4KhJkJxL
 JaaqLK1sntyzXb1sErITgM/oEtsloSPhC4lcWDGvC7E38zEDD3E5TXsCHAtfa7Q9qxMVfyAus
 L8JD75UvzUCaI2/yC4SSqECqNQXFukg6S9XU4TLTPXHQ3yZaY1NjiECF/RYATf0V7UG3xihzQ
 usbQ3kJmvAospcGaca/Mc1+nd9M8h+280dBRmqwkCFKsARP3lzJ5bLWrakgGCvS5di2lxFumW
 1Ify2qn9v3tKt2Wsy/0Aq++luMigKm34u8JVEYd048A29kLLaFF9ARPZRH2SmyeNwpb2YE/bo
 oE2iaZsxN81RRkxeOrQLn1Z/EFPMyyVWxuqvWugqshrGuPiMB8S/fBTWUckAoe80Sdb3KIKed
 +h8VikBrX9M/psSsbh5OaMRKO+kt1ZRrwg60zIIVjjYq0OL8YmhtCl3lZK+tC4UysovBLGYsU
 DcP6sZYGzLScw6VE0zM3LRz50QNZk0nBW+8OabE7gXfFC65Styn4LwyjxwgNv0I+6fdk/rkqU
 lwqM4Hf8SBWTCjU8lFaiM2kVvDrxlkJtR21vvuS/Y=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 5/8] build: Don't ignore qapi-visit-core.c
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
X-List-Received-Date: Thu, 19 Sep 2019 13:58:30 -0000

From: Eric Blake <eblake@redhat.com>

This file is version-controlled, and not generated from a .json file.

Fixes: bf582c3461b
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190912184607.3507-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index e9bbc006d39e..7de868d1eab4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -41,6 +41,7 @@
 /qapi/qapi-types-*.[ch]
 /qapi/qapi-types.[ch]
 /qapi/qapi-visit-*.[ch]
+!/qapi/qapi-visit-core.c
 /qapi/qapi-visit.[ch]
 /qapi/qapi-doc.texi
 /qemu-doc.html
-- 
2.21.0


