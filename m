Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmSkt-0007a5-QR
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 16:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx2-000234-7L
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx1-0006tn-G6
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:48 -0400
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:34755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmRwx-0006s2-MI; Sun, 26 Apr 2015 15:10:43 -0400
Received: by pacyx8 with SMTP id yx8so105501248pac.1;
	Sun, 26 Apr 2015 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/888gL+QVfrB0PrvRB/VFnnvQ5CbgO9Bxf5bDi2HjPQ=;
	b=WhfZ45S54LHBeytwW3i6Zpe2gYJHvPyMOPNvgEIq9aJ+WrnUbJvBl42eoJc43jO01y
	XD0hEr7dLylhsjqrr63lSUZ7kWsr6jlLqK4fQ8x1gQV6/vCyOojfx0ZeibLLb8aBw0oZ
	h5DDHHdBS8yl5ayX2NxJBBxqSkLWEtnFS25SEfl6u+HJYAtv/J7io7p9mTCQsgwR3TpO
	uexRgtD2wFtpQ9shX7tiGfmCAgkTcwqfMMOMxQV+xxA3skW4rbKiZvEo7+aRURX/f1YX
	cc+kVL4UHuujw8mrOIkuuSzTg7q4OhdoTYAGZbBX+KLL/QMb4wFXPkGDa1gTAYgAbC74
	8ISQ==
X-Received: by 10.68.179.67 with SMTP id de3mr15617840pbc.85.1430075443045;
	Sun, 26 Apr 2015 12:10:43 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ux4sm16997226pbc.61.2015.04.26.12.10.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 12:10:41 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 12:10:20 -0700
Message-Id: <1430075424-25975-3-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::231
X-Mailman-Approved-At: Sun, 26 Apr 2015 16:02:16 -0400
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH microblaze v1 2/6] mb: mmu: Delete flip_um fn
	prototype
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

This is not implemented or used.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-microblaze/mmu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-microblaze/mmu.h b/target-microblaze/mmu.h
index 3f74dda..3b7a998 100644
--- a/target-microblaze/mmu.h
+++ b/target-microblaze/mmu.h
@@ -82,7 +82,6 @@ struct microblaze_mmu_lookup
     } err;
 };
 
-void mmu_flip_um(CPUMBState *env, unsigned int um);
 unsigned int mmu_translate(struct microblaze_mmu *mmu,
                            struct microblaze_mmu_lookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx);
-- 
1.9.1


