Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUf5H-0004sX-BQ
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 14:06:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf5E-0004la-7C
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf5D-0000jk-FZ
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:06:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZUf56-0000gH-5C; Wed, 26 Aug 2015 14:05:52 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id BB316461E0;
	Wed, 26 Aug 2015 18:05:51 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-5-59.ams2.redhat.com [10.36.5.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QI5cZR026740; Wed, 26 Aug 2015 14:05:50 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Date: Wed, 26 Aug 2015 20:05:37 +0200
Message-Id: <1440612338-5912-7-git-send-email-lvivier@redhat.com>
In-Reply-To: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
References: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 6/7] bt: remove muldiv64()
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
X-List-Received-Date: Wed, 26 Aug 2015 18:06:01 -0000

Originally, timers were ticks based, and it made sense to
add ticks to current time to know when to trigger an alarm.

But since commit:

7447545 change all other clock references to use nanosecond resolution accessors

All timers use nanoseconds and we need to convert ticks to nanoseconds.

As get_ticks_per_sec() is 10^9,

    a = muldiv64(b, get_ticks_per_sec(), 100);
    y = muldiv64(x, get_ticks_per_sec(), 1000000);

can be converted to

    a = b * 10000000;
    y = x * 1000;

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/bt/hci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/bt/hci.c b/hw/bt/hci.c
index 7ea3dc6..585ee2e 100644
--- a/hw/bt/hci.c
+++ b/hw/bt/hci.c
@@ -595,7 +595,7 @@ static void bt_hci_inquiry_result(struct bt_hci_s *hci,
 static void bt_hci_mod_timer_1280ms(QEMUTimer *timer, int period)
 {
     timer_mod(timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   muldiv64(period << 7, get_ticks_per_sec(), 100));
+                     (uint64_t)(period << 7) * 10000000);
 }
 
 static void bt_hci_inquiry_start(struct bt_hci_s *hci, int length)
@@ -1099,7 +1099,7 @@ static int bt_hci_mode_change(struct bt_hci_s *hci, uint16_t handle,
     bt_hci_event_status(hci, HCI_SUCCESS);
 
     timer_mod(link->acl_mode_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                   muldiv64(interval * 625, get_ticks_per_sec(), 1000000));
+                                    ((uint64_t)interval * 625) * 1000);
     bt_hci_lmp_mode_change_master(hci, link->link, mode, interval);
 
     return 0;
-- 
2.1.0


