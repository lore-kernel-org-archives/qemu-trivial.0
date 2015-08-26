Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUf54-0004Py-FZ
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 14:05:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf51-0004Lc-VK
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf51-0000ei-21
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZUf4w-0000dm-Sw; Wed, 26 Aug 2015 14:05:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 35FA0341AE0;
	Wed, 26 Aug 2015 18:05:42 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-5-59.ams2.redhat.com [10.36.5.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QI5cZL026740; Wed, 26 Aug 2015 14:05:39 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>, Jia Liu <proljc@gmail.com>,
	Jason Wang <jasowang@redhat.com>, crosthwaitepeter@gmail.com,
	qemu-trivial@nongnu.org
Date: Wed, 26 Aug 2015 20:05:31 +0200
Message-Id: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/7] remove useless muldiv64()
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
X-List-Received-Date: Wed, 26 Aug 2015 18:05:48 -0000

Originally, timers were ticks based, and it made sense to
add ticks to current time to know when to trigger an alarm.

But since commit:

7447545 change all other clock references to use nanosecond resolution accessors

All timers use nanoseconds and we need to convert ticks to nanoseconds, by
doing something like:

     y = muldiv64(x, get_ticks_per_sec(), TIMER_FREQ)

where x is the number of device ticks and y the number of system ticks.

y is used as nanoseconds in timer functions,
it works because 1 tick is 1 nanosecond.
(get_ticks_per_sec() is 10^9)

But if get_ticks_per_sec() / TIMER_FREQ is an integer, we can do:

    y = x * TIMER_PERIOD;

v2:
4/4 For target-arm, don't remove muldiv64() but clarify
    the use of the values.
7/7 Replace qemu_clock_get_ns()/1000 by qemu_clock_get_us()

Laurent Vivier (7):
  PCI: remove muldiv64()
  mips: remove muldiv64()
  openrisc: remove muldiv64()
  arm: clarify the use of muldiv64()
  hpet: remove muldiv64()
  bt: remove muldiv64()
  net: remove muldiv64()

 hw/bt/hci.c                |  4 ++--
 hw/mips/cputimer.c         | 19 ++++++++-----------
 hw/net/pcnet.c             |  3 +--
 hw/net/rtl8139.c           | 14 ++++++--------
 hw/openrisc/cputimer.c     |  7 +++----
 hw/timer/hpet.c            |  6 +++---
 hw/watchdog/wdt_i6300esb.c | 11 +++--------
 include/hw/timer/hpet.h    |  4 ++--
 net/dump.c                 |  2 +-
 target-arm/helper.c        | 14 ++++++++------
 tests/rtl8139-test.c       |  2 +-
 11 files changed, 38 insertions(+), 48 deletions(-)

-- 
2.1.0


