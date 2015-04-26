Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmSkt-0007Z3-Br
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 16:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx1-00022x-V1
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx1-0006tU-4g
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:47 -0400
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:34753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmRwv-0006rU-Uu; Sun, 26 Apr 2015 15:10:42 -0400
Received: by pacyx8 with SMTP id yx8so105500740pac.1;
	Sun, 26 Apr 2015 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sfdd8DhWAh0CtIFR9PaTpyyh1bRxfbhwazzoaf7bLVA=;
	b=0XBNdzDdKWJEeGuECE3lIZxCiQOsEFexAufuMt+WQOkoQsnki36HZ63FaNUleM6dBG
	GLCNyF4kVl7SHrJA6lstHWDYBRCVX+A5kxntFYB7ITGFzJt+DqeQYrL46w6d1MpOffI/
	oduHuUVv8L1rRsvBhXnVqHOjSaMeL8XOOYkklj9diYkiOg203b8UzpbP1dETi0rCrhM3
	h2GWaUlLaFRHakaJJkj3vtBFA+15YJcOxZTB4Hkcagr3mO1WlEKm2Cl7yy5d37X32HaE
	DjSrQGNwgOqN/BS8RCaRie3rrh8PIMDjqMmS+kiw+sijY+e1Zf/qTQIuR/8X7RMtTvhC
	sTzQ==
X-Received: by 10.68.166.132 with SMTP id zg4mr15457038pbb.5.1430075441180;
	Sun, 26 Apr 2015 12:10:41 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ux4sm16997226pbc.61.2015.04.26.12.10.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 12:10:40 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 12:10:19 -0700
Message-Id: <1430075424-25975-2-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
X-Mailman-Approved-At: Sun, 26 Apr 2015 16:02:16 -0400
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH microblaze v1 1/6] defconfigs: Piggyback
	microblazeel on microblaze
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
X-List-Received-Date: Sun, 26 Apr 2015 19:10:49 -0000

Theres no difference in defconfig. Going forward microblazeel should
superset microblaze so use an include.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 default-configs/microblazeel-softmmu.mak | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/default-configs/microblazeel-softmmu.mak b/default-configs/microblazeel-softmmu.mak
index acf22c5..2fcf442 100644
--- a/default-configs/microblazeel-softmmu.mak
+++ b/default-configs/microblazeel-softmmu.mak
@@ -1,11 +1,3 @@
 # Default configuration for microblazeel-softmmu
 
-CONFIG_PTIMER=y
-CONFIG_PFLASH_CFI01=y
-CONFIG_SERIAL=y
-CONFIG_XILINX=y
-CONFIG_XILINX_AXI=y
-CONFIG_XILINX_SPI=y
-CONFIG_XILINX_ETHLITE=y
-CONFIG_SSI=y
-CONFIG_SSI_M25P80=y
+include microblaze-softmmu.mak
-- 
1.9.1


