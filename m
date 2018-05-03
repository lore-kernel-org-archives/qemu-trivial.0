Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fEN9w-0001RU-0W
	for mharc-qemu-trivial@gnu.org; Thu, 03 May 2018 18:57:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fEN9t-0001Nh-Ls
	for qemu-trivial@nongnu.org; Thu, 03 May 2018 18:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fEN9s-0005wa-OA
	for qemu-trivial@nongnu.org; Thu, 03 May 2018 18:57:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48080 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1fEN9k-0005iY-Kr; Thu, 03 May 2018 18:56:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86D51427095C;
	Thu,  3 May 2018 22:56:55 +0000 (UTC)
Received: from probe.redhat.com (ovpn-126-131.rdu2.redhat.com [10.10.126.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BD7983B75;
	Thu,  3 May 2018 22:56:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Cc: qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>
Date: Thu,  3 May 2018 18:56:43 -0400
Message-Id: <20180503225648.13153-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 03 May 2018 22:56:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 03 May 2018 22:56:55 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'jsnow@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 0/5] qemu-img: make subcommand usage
 docstrings consistent
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
X-List-Received-Date: Thu, 03 May 2018 22:57:07 -0000

I'm working on a project to attempt to autogenerate all of this, but
until then let's just do a bit of the usual kinds of tidying.

________________________________________________________________________________

For convenience, this branch is available at:
https://github.com/jnsnow/qemu.git branch trivial-qemu-img
https://github.com/jnsnow/qemu/tree/trivial-qemu-img

This version is tagged trivial-qemu-img-v1:
https://github.com/jnsnow/qemu/releases/tag/trivial-qemu-img-v1

John Snow (5):
  qemu-img-commands.hx: argument ordering fixups
  qemu-img.texi: fix command ordering
  qemu-img: remove references to GEN_DOCS
  qemu-img: Make documentation between .texi and .hx consistent
  qemu-img-cmds.hx: add passive-aggressive note

 qemu-img-cmds.hx       | 13 +++++----
 qemu-img.c             |  2 --
 qemu-img.texi          | 78 ++++++++++++++++++++++++++------------------------
 qemu-options-wrapper.h |  1 -
 4 files changed, 48 insertions(+), 46 deletions(-)

-- 
2.14.3


