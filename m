Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rn-0004rM-V4
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0RZ-0004Gq-5Q
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0RV-00071g-Qu
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RS-0006xE-LS; Mon, 24 Jun 2013 02:39:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dwUw002215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:58 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O6dv69010909; Mon, 24 Jun 2013 02:39:57 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 9B4DF415E8; Mon, 24 Jun 2013 08:39:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:43 +0200
Message-Id: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 00/13] A bunch of little socket + chardev
	fixes
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:09 -0000

  Hi,

Here is v2 of the series, addressing Michaels review comments.

cheers,
  Gerd

Gerd Hoffmann (13):
  qemu-socket: zero-initialize SocketAddress
  qemu-socket: drop pointless allocation
  qemu-socket: catch monitor_get_fd failures
  qemu-char: check optional fields using has_*
  qemu-char: use more specific error_setg_* variants
  qemu-char: print notification to stderr
  qemu-char: fix documentation for telnet+wait socket flags
  qemu-char: don't leak opts on error
  qemu-char: use ChardevBackendKind in in CharDriver
  qemu-char: minor mux chardev fixes
  qemu-char: add -chardev mux support
  qemu-char: report udb backend errors
  qemu-socket: don't leak opts on error

 include/sysemu/char.h |    2 +-
 qapi-schema.json      |    7 ++++---
 qemu-char.c           |   45 ++++++++++++++++++++++++++++++++-------------
 util/qemu-sockets.c   |    9 ++++-----
 4 files changed, 41 insertions(+), 22 deletions(-)

-- 
1.7.9.7


