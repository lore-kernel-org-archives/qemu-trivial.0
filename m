Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAMz-0005ew-Rc
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 14:40:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gXAMx-0005bz-HZ
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 14:40:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gXAMv-0007lJ-GH
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 14:40:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:24742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gXAMi-0007Zp-Fo; Wed, 12 Dec 2018 14:40:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8CE374EEC;
	Wed, 12 Dec 2018 19:40:12 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E384608EE;
	Wed, 12 Dec 2018 19:40:10 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liu Yuan <namei.unix@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-trivial@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 20:40:05 +0100
Message-Id: <20181212194009.2951-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 12 Dec 2018 19:40:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/4] block: Convert from DPRINTF() macro to
 trace event
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
X-List-Received-Date: Wed, 12 Dec 2018 19:40:32 -0000

Convert all the remaining uses of DPRINTF() in the directory block.

Compiled for all target but only tested with "make check"

Laurent Vivier (4):
  block/ssh: Convert from DPRINTF() macro to trace events
  block/curl: Convert from DPRINTF() macro to trace events
  block/file-posix: Convert from DPRINTF() macro to trace events
  block/sheepdog: Convert from DPRINTF() macro to trace events

 block/curl.c       | 29 ++++++++--------------------
 block/file-posix.c | 25 ++++++------------------
 block/sheepdog.c   | 47 +++++++++++++++++-----------------------------
 block/ssh.c        | 46 +++++++++++++++++----------------------------
 block/trace-events | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 95 insertions(+), 99 deletions(-)

--=20
2.19.2


