Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDT3-0005PB-9X
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:15:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDT0-0005N4-F0
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:14:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDSy-0003h4-Kl
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:14:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDSt-0003eN-6p; Wed, 15 Jun 2016 12:14:51 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 343BAC0467EE;
	Wed, 15 Jun 2016 16:14:50 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUn011275; Wed, 15 Jun 2016 12:14:48 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Date: Wed, 15 Jun 2016 18:14:30 +0200
Message-Id: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 15 Jun 2016 16:14:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/7] Remove useless casts
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
X-List-Received-Date: Wed, 15 Jun 2016 16:14:59 -0000

This series is the result of the following coccinelle script:

    @@
    type T;
    T v;
    @@
    -       (T *)&v
    +       &v

This script removes the cast of a variable when the variable
is already of the casting type.

The script is added in scripts/coccinelle by the first patch.

Laurent Vivier (7):
  coccinelle: add a script to remove useless casts
  linux-user,s390x: remove useless cast
  s390x: remove useless cast
  tricore: remove useless cast
  fw_cfg: remove useless casts
  crypto: remove useless casts
  sheepdog: remove useless casts

 block/sheepdog.c                  | 4 ++--
 crypto/cipher-builtin.c           | 4 ++--
 hw/nvram/fw_cfg.c                 | 4 ++--
 hw/s390x/sclp.c                   | 2 +-
 hw/tricore/tricore_testboard.c    | 2 +-
 linux-user/signal.c               | 2 +-
 scripts/coccinelle/typecast.cocci | 7 +++++++
 7 files changed, 16 insertions(+), 9 deletions(-)
 create mode 100644 scripts/coccinelle/typecast.cocci

-- 
2.5.5


