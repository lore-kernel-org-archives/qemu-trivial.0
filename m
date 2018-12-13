Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXTpz-0006rw-0A
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 11:27:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gXTpw-0006pS-L7
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 11:27:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gXTpt-0002i2-97
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 11:27:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gXTpk-0002Z5-I3; Thu, 13 Dec 2018 11:27:32 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F95E13AA1;
	Thu, 13 Dec 2018 16:27:31 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD2EF1974F;
	Thu, 13 Dec 2018 16:27:28 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org, Liu Yuan <namei.unix@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Date: Thu, 13 Dec 2018 17:27:23 +0100
Message-Id: <20181213162727.17438-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 13 Dec 2018 16:27:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/4] block: Convert from DPRINTF() macro
 to trace event
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
X-List-Received-Date: Thu, 13 Dec 2018 16:27:45 -0000

Convert all the remaining uses of DPRINTF() in the directory block.

Compiled for all target but only tested with "make check"

v2: replace "sd_" prefix by "sheepdog_"
    remove the dot at the end of the text strings
    use %zu with size_t
    change an uint64_t to int64_t to match % PRIi64

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


