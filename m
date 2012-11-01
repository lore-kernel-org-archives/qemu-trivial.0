Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TU2Rv-00062d-1H
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 17:37:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rs-0005tJ-6O
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rr-00029N-By
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:12 -0400
Received: from mail-da0-f45.google.com ([209.85.210.45]:39354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1TU2Rp-00026p-8G; Thu, 01 Nov 2012 17:37:09 -0400
Received: by mail-da0-f45.google.com with SMTP id n15so1304841dad.4
	for <multiple recipients>; Thu, 01 Nov 2012 14:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=IaYTHG+pwdytN8Vp8wdvT+f3ls+IY3rzMWgqGgf72Ho=;
	b=JjtDENcK3kRVgDgDrhr8sMdAM51Wx9ohc/N6QCIbBYHo+6iFqN/PNbcpU8qJSYv9FD
	AYw7lKtvFnhXZQGs6mzB6lc4Risk7UdY6LBWMRj8hSRyjyR1DASw3yZnbwUx095fgKDO
	dd97puePFxxzcTxae/U4+C8oW3DvPz61sAqrxcjiR4NZYcYMQv2sj7VTbxlO2/5RfrLE
	7E2UXUrNmHttA+4c7ffCztNeNpFKRN8T9x4Y1v7NzyItrwYzQuorUT5pED/kfAmfiyJI
	9tODe3L5RdRvuJiCIDqe8o0GLJ/jbkdlVEJa3Y4sIw+HfBZPBo8YF562wOeQetEW/TQw
	REig==
Received: by 10.68.252.132 with SMTP id zs4mr55168464pbc.131.1351805828789;
	Thu, 01 Nov 2012 14:37:08 -0700 (PDT)
Received: from pebble.twiddle.home.com ([1.152.139.87])
	by mx.google.com with ESMTPS id c7sm4534436pay.10.2012.11.01.14.37.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 14:37:08 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2012 08:36:37 +1100
Message-Id: <1351805797-31899-4-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1351805797-31899-1-git-send-email-rth@twiddle.net>
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>
Subject: [Qemu-trivial] [PATCH 3/3] target-sparc: Remove t0,
	t1 from CPUSPARCState
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
X-List-Received-Date: Thu, 01 Nov 2012 21:37:13 -0000

These fields are no longer used.

Cc: Blue Swirl <blauwirbel@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-sparc/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index 6aa82b3..84dba4e 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -392,7 +392,6 @@ struct CPUSPARCState {
     target_ulong cc_dst;
     uint32_t cc_op;
 
-    target_ulong t0, t1; /* temporaries live across basic blocks */
     target_ulong cond; /* conditional branch result (XXX: save it in a
                           temporary register when possible) */
 
-- 
1.7.11.7


