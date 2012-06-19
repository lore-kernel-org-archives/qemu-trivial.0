Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sgs1S-0002GC-1R
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jun 2012 02:34:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Sgs1Q-0002Eg-1c
	for qemu-trivial@nongnu.org; Tue, 19 Jun 2012 02:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Sgs1M-0004VB-Rf
	for qemu-trivial@nongnu.org; Tue, 19 Jun 2012 02:34:39 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:59636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Sgs1M-0004Uc-La
	for qemu-trivial@nongnu.org; Tue, 19 Jun 2012 02:34:36 -0400
Received: by pbbro12 with SMTP id ro12so9812658pbb.4
	for <qemu-trivial@nongnu.org>; Mon, 18 Jun 2012 23:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=vvdZ7nU778560u7iuscZPUziuKVOQU7RWmNhkhGaWQU=;
	b=Xaf9wsjPysmv4L4A4h/aOmOd7rUMV7enwHbz7PzsomFN1dnxl1xETS/+NMSWb8zP0S
	7goUKBFDfKG31CpVY4/UuBNjbgpUt/jmXQRNAsS16YwvULAQqPqk03E7DVFIXQCcUFoF
	Pf8Ylngfp8pPU/cuN6zp1qAGnNLxqMAMV0V1NQWDNJ/ADkmjZn4VT+3KZyLLNFqfUGjO
	jJAaZr9G6UQw5YQ65QqY0vn0MGWRNpuZS3TD38S2Ri68+mLE7oTOHB0w+gGA2KBMVbp5
	zg010l6gf7YX/nfdsSutsEgdR7LGzwuTFHos2InBXKjH/pkeQg7qDpOiEtc4JsqdRTYr
	v8bw==
Received: by 10.68.217.40 with SMTP id ov8mr60432553pbc.131.1340087673751;
	Mon, 18 Jun 2012 23:34:33 -0700 (PDT)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id of1sm26745415pbb.15.2012.06.18.23.34.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 23:34:32 -0700 (PDT)
From: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Jun 2012 16:44:38 +1000
Message-Id: <1340088278-8406-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Mailer: git-send-email 1.7.3.2
X-Gm-Message-State: ALoCoQmM+2D8n3ZcO1KqphNuq83EdnsEezjJT3QEDod2hiElgOE4ldvF6VlTZ/anzbPG6u+58U7B
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: Jim Meyering <meyering@redhat.com>,
	"Peter A. G. Crosthwaite" <peter.croshtwaite@petalogix.com>
Subject: [Qemu-trivial] [PATCH] cadence_gem: Avoid stack-writing
	buffer-overrun
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
X-List-Received-Date: Tue, 19 Jun 2012 06:34:41 -0000

From: Jim Meyering <meyering@redhat.com>

Use sizeof(rxbuf)-size (not sizeof(rxbuf-size)) as the number
of bytes to clear.  The latter would always clear 4 or 8
bytes, possibly writing beyond the end of that stack buffer.
Alternatively, depending on the value of the "size" parameter,
it could fail to initialize the end of "rxbuf".
Spotted by coverity.

Signed-off-by: Jim Meyering <meyering@redhat.com>
Signed-off-by: Peter A. G. Crosthwaite <peter.croshtwaite@petalogix.com>
---
 hw/cadence_gem.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/cadence_gem.c b/hw/cadence_gem.c
index e2140ae..dbde392 100644
--- a/hw/cadence_gem.c
+++ b/hw/cadence_gem.c
@@ -664,7 +664,7 @@ static ssize_t gem_receive(VLANClientState *nc, const uint8_t *buf, size_t size)
          */
 
         memcpy(rxbuf, buf, size);
-        memset(rxbuf + size, 0, sizeof(rxbuf - size));
+        memset(rxbuf + size, 0, sizeof(rxbuf) - size);
         rxbuf_ptr = rxbuf;
         crc_val = cpu_to_le32(crc32(0, rxbuf, MAX(size, 60)));
         if (size < 60) {
-- 
1.7.3.2


