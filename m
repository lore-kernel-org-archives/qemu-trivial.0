Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyjz-00064E-2F
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjk-0005di-O0
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjg-0007ln-Il
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjb-0007iA-Of; Fri, 21 Jun 2013 06:38:27 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcR98031610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:27 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5LAcPYn024623; Fri, 21 Jun 2013 06:38:26 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 59371431BD; Fri, 21 Jun 2013 12:38:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:12 +0200
Message-Id: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 00/13] A bunch of little socket + chardev
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:41 -0000

  Hi,

Here is a colletion of little bugfixes and minor improvements for the
chardev and socket code.

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

 qapi-schema.json    |    7 ++++---
 qemu-char.c         |   43 +++++++++++++++++++++++++++++++------------
 util/qemu-sockets.c |    8 +++++---
 3 files changed, 40 insertions(+), 18 deletions(-)

-- 
1.7.9.7


