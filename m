Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez2pk-0001rM-TQ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 12:12:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2pi-0001oU-Bp
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2ph-0007G0-En
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:12:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49268 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ez2pR-0006tE-6o; Thu, 22 Mar 2018 12:12:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DB90722D0;
	Thu, 22 Mar 2018 16:12:36 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB1E72023230;
	Thu, 22 Mar 2018 16:12:27 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Date: Thu, 22 Mar 2018 17:12:22 +0100
Message-Id: <20180322161226.29796-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 16:12:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 16:12:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 0/4] coccinelle: re-run scripts from
 scripts/coccinelle
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
X-List-Received-Date: Thu, 22 Mar 2018 16:12:55 -0000

I've re-run some scripts from the coccinelle directory,
and they have found some problems.

This series fixes them.

Laurent Vivier (4):
  error: Strip trailing '\n' from error string arguments (again again)
  error: Remove NULL checks on error_propagate() calls
  qdict: remove useless cast
  Remove unnecessary variables for function return value

 accel/tcg/translate-all.c                          |  5 +-
 block/nvme.c                                       | 11 ++---
 block/quorum.c                                     |  6 +--
 hw/arm/exynos4210.c                                |  7 +--
 hw/block/vhost-user-blk.c                          |  5 +-
 hw/hppa/dino.c                                     |  5 +-
 hw/misc/mos6522.c                                  |  6 +--
 hw/net/ftgmac100.c                                 |  5 +-
 hw/ppc/pnv_lpc.c                                   | 14 +-----
 io/channel-websock.c                               |  4 +-
 io/net-listener.c                                  |  6 +--
 monitor.c                                          |  2 +-
 target/i386/hax-darwin.c                           | 10 ++--
 target/i386/hvf/hvf.c                              | 24 +++++-----
 target/mips/dsp_helper.c                           | 15 ++----
 target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
 target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
 target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
 target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
 .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
 target/xtensa/translate.c                          |  5 +-
 tests/m48t59-test.c                                |  6 +--
 tests/test-thread-pool.c                           |  6 +--
 util/uri.c                                         |  5 +-
 24 files changed, 94 insertions(+), 269 deletions(-)

-- 
2.14.3


