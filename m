Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mfk-00060E-Ip
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:37:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfc-0005mt-LL
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfX-0003SC-U3
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mfS-0003Qp-RO; Tue, 31 May 2016 12:37:22 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DE427DCC1;
	Tue, 31 May 2016 16:37:22 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QP011053; Tue, 31 May 2016 12:37:17 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 31 May 2016 18:36:00 +0200
Message-Id: <1464712565-14857-12-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 May 2016 16:37:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 11/16] usb: Use DIV_ROUND_UP
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2016 16:37:38 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/usb/redirect.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 8d80540..8ec8484 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -542,9 +542,9 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
             start_iso.pkts_per_urb = 32;
         }
 
-        start_iso.no_urbs = (dev->endpoint[EP2I(ep)].bufpq_target_size +
-                             start_iso.pkts_per_urb - 1) /
-                            start_iso.pkts_per_urb;
+        start_iso.no_urbs = DIV_ROUND_UP(
+                                     dev->endpoint[EP2I(ep)].bufpq_target_size,
+                                     start_iso.pkts_per_urb);
         /* Output endpoints pre-fill only 1/2 of the packets, keeping the rest
            as overflow buffer. Also see the usbredir protocol documentation */
         if (!(ep & USB_DIR_IN)) {
-- 
2.5.5


