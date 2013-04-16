Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URttZ-0003Oq-K3
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 20:37:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URttT-0003IP-OT
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:37:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URttS-0003WV-K8
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:37:07 -0400
Received: from mail-pa0-f41.google.com ([209.85.220.41]:60746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URttS-0003WJ-EV
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:37:06 -0400
Received: by mail-pa0-f41.google.com with SMTP id kx1so20581pab.0
	for <qemu-trivial@nongnu.org>; Mon, 15 Apr 2013 17:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=nM3+fTvymM0dxpijFIPUsIPy4tXrpvACIlLk+5A2xdE=;
	b=MYGJ+Boa6Kkb4jWMgKlN8Mn5O58bIQJ18Vk6mrqmNI2ZU6AYVDGIBb8TpQSapAewGL
	Hinnihe8OSJRHNiFEUB2RWP8RJNnSx8Yrxll0XDtgUh9x/0qcRd7f+Yspd9hAr7z8GTR
	DZGqTdmsOdOORLPJ7gBnbgg/kf0m7h0Y8kyX48H7myATXmHG0YAqZL+a6F38IKfVMVBB
	D0BbvOWB7t2w1LkUKoMKtTDOPBpKnPMmsLd2OX7pkefVDzDce1o3KwETCNP5j5PbyNGw
	Qdh7d8/F9hDnVCqdzCWSoWsm17kx77NOIN9GvSiGhqsOOQK0jNk7WVkDE/rXrNhvc954
	pQHA==
X-Received: by 10.66.14.1 with SMTP id l1mr589913pac.150.1366072625756;
	Mon, 15 Apr 2013 17:37:05 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id z18sm91984paf.22.2013.04.15.17.37.03
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 17:37:04 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2013 10:34:50 +1000
Message-Id: <43a713ca9cfed59a4d4577763e6ed10f72f985e2.1366071713.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
References: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQkvF2bDXgd7qh+g+3/YJIkHXE9P8kH33F7oF3Z26X2UbLAQ/8IwAZncYGKW1mCzbq/RU+Uf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.41
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v3 4/4] m25p80: Add debug message for no bdrv
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
X-List-Received-Date: Tue, 16 Apr 2013 00:37:09 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

If there is no backing bdrv, let the debugging developer know about it.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/block/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a2816c1..f8b6409 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -606,6 +606,7 @@ static int m25p80_init(SSISlave *ss)
             return 1;
         }
     } else {
+        DB_PRINT_L(0, "No BDRV - binding to RAM\n");
         memset(s->storage, 0xFF, s->size);
     }
 
-- 
1.7.0.4


