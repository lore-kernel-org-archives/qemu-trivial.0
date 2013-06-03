Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjNPN-0003CY-3E
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 01:34:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNPK-00038X-6M
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:34:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNPG-0008E2-Ny
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:34:14 -0400
Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233]:38935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNPG-0008Dq-HY
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:34:10 -0400
Received: by mail-pb0-f51.google.com with SMTP id um15so2003405pbc.38
	for <qemu-trivial@nongnu.org>; Sun, 02 Jun 2013 22:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=mUZUFRLpqRt+iDEd88x3NVFQ5/SocYNc2oHf+T75A9M=;
	b=bMXp5WOGcmaDbKA4OYBthNlZZqnZB3GbwDR+va6GGHjWF3z12AfyZBKx0Rs3KFR4HF
	PNTMyOa8h1OELfHSnSXSgpRDPnw0k5zdgqtnOyX/Q10Dyb8K2/HDX21tsIgw9ro2ZdIv
	IEruDtGHx+upG2Bu8BpOoKaN6Lb4dM/rS+o8mxtu7lQo0PCwU1RGq7XQeg4hnggTO4up
	0HYARelhhpJ6SsFN+2YgW7da8YwwfxzuWc7ave/MI1ueXaPmJxtybFUoS129BG6Dt/Qe
	6aIbFlG6ew/xVthNl9JslcIh4vaPf5rVVID/39yK8pIGbI4BlwlqsEWk9JM7cKZvnyVG
	AQRQ==
X-Received: by 10.68.43.197 with SMTP id y5mr10813158pbl.140.1370237649700;
	Sun, 02 Jun 2013 22:34:09 -0700 (PDT)
Received: from localhost ([203.126.243.116])
	by mx.google.com with ESMTPSA id cr3sm638139pac.0.2013.06.02.22.34.03
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 22:34:08 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2013 15:32:42 +1000
Message-Id: <54b43e8b5fe6acff6fe667062d412c0b224f92f6.1370237352.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
In-Reply-To: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
References: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQmItEfpCtA9M2f8YwSNIMBI4zAr0bLvAJL41y/Hc3tZcJZujAoa/0KAOpmGKTxBQnobyzvW
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::233
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 2/3] memory: as_update_topology_pass:
	Improve comments
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
X-List-Received-Date: Mon, 03 Jun 2013 05:34:15 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

These comments we're a little difficult to read. First one had
incorrect parenthesis. The part about attributes changing is
really applicable to the region being 'in both' rather than 'in
new'

Second comment has an obscure parenthetic about 'Logging may have
changed'. Made clearer, as this if is supposed to handle the case where
the memory region is unchanged (with the notable exception re logging).

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memory.c b/memory.c
index 60e033b..7e710c4 100644
--- a/memory.c
+++ b/memory.c
@@ -719,7 +719,7 @@ static void address_space_update_topology_pass(AddressSpace *as,
                 || int128_lt(frold->addr.start, frnew->addr.start)
                 || (int128_eq(frold->addr.start, frnew->addr.start)
                     && !flatrange_equal(frold, frnew)))) {
-            /* In old, but (not in new, or in new but attributes changed). */
+            /* In old but not in new, or in both but attributes changed. */
 
             if (!adding) {
                 MEMORY_LISTENER_UPDATE_REGION(frold, as, Reverse, region_del);
@@ -727,7 +727,7 @@ static void address_space_update_topology_pass(AddressSpace *as,
 
             ++iold;
         } else if (frold && frnew && flatrange_equal(frold, frnew)) {
-            /* In both (logging may have changed) */
+            /* In both and unchanged (except logging may have changed) */
 
             if (adding) {
                 MEMORY_LISTENER_UPDATE_REGION(frnew, as, Forward, region_nop);
-- 
1.8.3.rc1.44.gb387c77.dirty


