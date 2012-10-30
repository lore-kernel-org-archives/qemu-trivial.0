Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TTFV2-00046u-9G
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2012 13:21:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1TTFUr-0003W6-1W
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2012 13:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1TTFUn-0008E6-4R
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2012 13:21:00 -0400
Received: from mail-vb0-f45.google.com ([209.85.212.45]:44812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1TTFUa-0008AF-La; Tue, 30 Oct 2012 13:20:44 -0400
Received: by mail-vb0-f45.google.com with SMTP id p1so510824vbi.4
	for <multiple recipients>; Tue, 30 Oct 2012 10:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=xcTbkMho1BIFIXIoHcBqNw51DLXuo1yYd1Ic/jYnwfI=;
	b=PawzDo7yRIftz29nOqcau8K/twm9YzVl6DJVgnqbAC6V9StEGEUoqOiX+aU4tt7+K4
	iYaY90LfE/FSMUxQ/XgNIXr7ah2bsNXWg5o0BvGZk7kfC3b3D5mRkfGPbttDyqJy84uv
	E1p9akTJhDIUiGgKcVHrwYm0Jnfv1yKF3vaN2J3vvzYSSYhqQLEiv5cJIg+YRDtDCGC4
	WSM1G4iw69AkCggsoHtFglOcnJUNL61d0aOIRSLBKafQSHqDIgxGmEuZiDtTvaaEUB2A
	WAcwlWgKMc+Ew8oqQ3TXtQC1dj98MwNrd68kVxS/TlOtBbfcogmbmE57lrjGMgwvCQ8Q
	lmtA==
Received: by 10.58.186.226 with SMTP id fn2mr59205646vec.33.1351617643619;
	Tue, 30 Oct 2012 10:20:43 -0700 (PDT)
Received: from hedwig.ini.cmu.edu (HEDWIG.INI.CMU.EDU. [128.2.16.5])
	by mx.google.com with ESMTPS id v17sm673680vdi.17.2012.10.30.10.20.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 10:20:42 -0700 (PDT)
Date: Tue, 30 Oct 2012 13:20:40 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: qemu-devel@nongnu.org
Message-ID: <20121030172039.GN29280@hedwig.ini.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, rene@exactcode.com, somlo@cmu.edu, agraf@suse.de
Subject: [Qemu-trivial] [PATCH] e1000: pre-initialize RAH/RAL registers
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
X-List-Received-Date: Tue, 30 Oct 2012 17:21:10 -0000

Some guest operating systems' drivers (Mac OS X in particular) fail to
properly initialize the Receive Address registers (probably expecting
them to be pre-initialized by an earlier component, such as a proprietary
BIOS). This patch pre-initializes the RA registers, allowing OS X
networking to function properly. Other guest operating systems are not
affected, and free to (re)initialize these registers during boot.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---
 hw/e1000.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/hw/e1000.c b/hw/e1000.c
index e4f1ffe..6478ff3 100644
--- a/hw/e1000.c
+++ b/hw/e1000.c
@@ -278,6 +278,10 @@ static void e1000_reset(void *opaque)
     if (d->nic->nc.link_down) {
         e1000_link_down(d);
     }
+
+  /* Some guests expect pre-initialized RAH/RAL (AddrValid flag + MACaddr) */
+  d->mac_reg[RA+1] = E1000_RAH_AV;
+  memmove(&d->mac_reg[RA], &d->conf.macaddr, sizeof(struct MACAddr));
 }
 
 static void
-- 
1.7.7.6


