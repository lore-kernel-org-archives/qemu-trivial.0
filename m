Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmY0M-0003mF-O8
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 21:38:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmY0J-0003eG-0m
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 21:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmY0I-0000VV-6A
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 21:38:34 -0400
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:33392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmY0E-0000TY-OG; Sun, 26 Apr 2015 21:38:30 -0400
Received: by pacwv17 with SMTP id wv17so90257151pac.0;
	Sun, 26 Apr 2015 18:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0b/kJ2WD+QQdhVoVsH34pKjuI4W9Mob+dLy9TMajtyE=;
	b=KKYgwW0hACfgSRGWDKZi9g/vSYoBuk7HWSTmcth8TxtB2JHMlT08SjaSU/dFM19vp9
	lkynmXKgiliiRP7EzhOa6vquG3Cnv3tsri2yEEYyW1OsdNFa2d8uCzTLhzkLFxVnTmzN
	mWZ9/Wa4rlJ8xYqZ61EUcoSIShSjaAbfMj53MrC30bQ447E20QSe4Xz0IZztIXPBJM36
	x30EGdFOs17IrSNtOiruO4fm2KJttQPaVyJE8ERKw/Yv2Z+IyUwUOrPxd4Zkunbz+t/j
	kq2QK7Z/LnLul+N31W50HeASExIljOBG5iuSiEJiF6zTaEkb+IMgAKSam7egeX3H/5wr
	jFlg==
X-Received: by 10.70.42.104 with SMTP id n8mr17562713pdl.88.1430098709723;
	Sun, 26 Apr 2015 18:38:29 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	bx6sm14872844pdb.39.2015.04.26.18.38.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 18:38:28 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 18:38:18 -0700
Message-Id: <efaa0333fb80cd88f3a7559bb8d8a5dd29b5b121.1430096379.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430096379.git.crosthwaite.peter@gmail.com>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1430096379.git.crosthwaite.peter@gmail.com>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH target-arm 1/2] arm: cpu.h: Remove unused
	typdefs
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
X-List-Received-Date: Mon, 27 Apr 2015 01:38:36 -0000

These CP accessor function prototypes are unused. Remove them.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-arm/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 083211c..7069103 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -93,11 +93,6 @@
 #define ARM_CPU_VIRQ 2
 #define ARM_CPU_VFIQ 3
 
-typedef void ARMWriteCPFunc(void *opaque, int cp_info,
-                            int srcreg, int operand, uint32_t value);
-typedef uint32_t ARMReadCPFunc(void *opaque, int cp_info,
-                               int dstreg, int operand);
-
 struct arm_boot_info;
 
 #define NB_MMU_MODES 7
-- 
1.9.1


