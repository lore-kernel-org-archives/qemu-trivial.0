Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX8LK-00077g-8y
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 12:30:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LF-00071Y-CC
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LE-0001Fk-CL
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8985)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gX8L8-0000tl-VK; Wed, 12 Dec 2018 12:30:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E02843C2CE7;
	Wed, 12 Dec 2018 17:30:11 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD7F960C44;
	Wed, 12 Dec 2018 17:30:08 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 18:30:01 +0100
Message-Id: <20181212173007.11407-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 12 Dec 2018 17:30:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/6] unicore32/puv3: Convert from DPRINTF()
 macro to trace event
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
X-List-Received-Date: Wed, 12 Dec 2018 17:30:38 -0000

Remove the definition of DPRINTF() in include/hw/unicore32/puv3.h
and convert to trace event all the puv3_*.c files.

Compile tested but I didn't find any unicore32 kernel to test the
trace output.

Laurent Vivier (6):
  hw/dma/puv3_dma: Convert from DPRINTF() macro to trace event
  hw/dma/puv3_gpio: Convert from DPRINTF() macro to trace event
  hw/dma/puv3_intc: Convert from DPRINTF() macro to trace event
  hw/misc/puv3_pm: Convert from DPRINTF() macro to trace event
  hw/timer/puv3_ost: Convert from DPRINTF() macro to trace event
  unicore32/puv3: remove definition of DPRINTF

 Makefile.objs               |  1 +
 hw/dma/puv3_dma.c           | 11 +++++------
 hw/dma/trace-events         |  6 ++++++
 hw/gpio/puv3_gpio.c         | 15 +++++++--------
 hw/gpio/trace-events        |  6 ++++++
 hw/intc/puv3_intc.c         | 13 ++++++-------
 hw/intc/trace-events        |  7 +++++++
 hw/misc/puv3_pm.c           | 11 +++++------
 hw/misc/trace-events        |  6 ++++++
 hw/timer/puv3_ost.c         | 14 ++++++--------
 hw/timer/trace-events       |  7 +++++++
 include/hw/unicore32/puv3.h |  7 -------
 12 files changed, 62 insertions(+), 42 deletions(-)
 create mode 100644 hw/gpio/trace-events

--=20
2.19.2


