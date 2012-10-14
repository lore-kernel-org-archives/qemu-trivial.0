Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUMJ-0002Ed-Dn
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:00:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMG-00026g-7r
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMF-0002k6-1P
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:20 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:37016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUMA-0002LR-Gv; Sun, 14 Oct 2012 16:00:15 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so2786709lah.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2uaMClNV0eVCTS3745Je29ObQBJP1XT8DbptMtDPCxE=;
	b=u9AO9U5Nyeq+rNaFpJr4KiX6KOx+RzbYQfhmknazVvFHe4x41OHfZC7N96rDvDIeLH
	XdqVO5x06kxYxbxBWycD2TG/Vdq++2yZ5q/7fQaIa5zbYIe9LplXDQEEeY6TdLb0TFm1
	w/X6W7eC3+mBCawa4386XvG5Ki3B0vrKxBWFiMc5XpHjRL0IPLOG7YPMcLl318PQNm6O
	DgFCLtFutT7eeMu71NK9VhJPpOD0mRC76Gyk9Pwlk+iBW2qxxCxwiJieHeI3ddWmlzPm
	Hm9g4GWQpcwFAwF9MjD4Ikc70c0qXsXgkv4+VO4ukattHu6MO+Vjnu7i1YMNHn7UHx37
	Eeqg==
Received: by 10.112.40.227 with SMTP id a3mr3344364lbl.91.1350244812091;
	Sun, 14 Oct 2012 13:00:12 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:11 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:53 +0000
Message-Id: <967b2144fa644977a9fcc2d221dc0cb170cf4932.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH 05/11] m48t59: remove unused m48t59_set_addr
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
X-List-Received-Date: Sun, 14 Oct 2012 20:00:22 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 hw/m48t59.c |    7 -------
 hw/nvram.h  |    1 -
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/hw/m48t59.c b/hw/m48t59.c
index dd6cb37..867bbda 100644
--- a/hw/m48t59.c
+++ b/hw/m48t59.c
@@ -466,13 +466,6 @@ uint32_t m48t59_read (void *opaque, uint32_t addr)
     return retval;
 }
 
-void m48t59_set_addr (void *opaque, uint32_t addr)
-{
-    M48t59State *NVRAM = opaque;
-
-    NVRAM->addr = addr;
-}
-
 void m48t59_toggle_lock (void *opaque, int lock)
 {
     M48t59State *NVRAM = opaque;
diff --git a/hw/nvram.h b/hw/nvram.h
index 8924da4..b6953d5 100644
--- a/hw/nvram.h
+++ b/hw/nvram.h
@@ -38,6 +38,5 @@ M48t59State *m48t59_init_isa(ISABus *bus, uint32_t io_base, uint16_t size,
                              int type);
 M48t59State *m48t59_init(qemu_irq IRQ, target_phys_addr_t mem_base,
                          uint32_t io_base, uint16_t size, int type);
-void m48t59_set_addr (void *opaque, uint32_t addr);
 
 #endif /* !NVRAM_H */
-- 
1.7.2.5


