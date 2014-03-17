Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPm5x-0003yP-VM
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 00:57:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WPfPZ-0007ju-RU
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 17:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WPfPS-0000ca-Iu
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 17:49:33 -0400
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:53804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WPfPC-0000Yl-Vp; Mon, 17 Mar 2014 17:49:11 -0400
Received: from [149.241.50.80] (helo=kentang.lan)
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WPfOu-0000rn-55; Mon, 17 Mar 2014 21:48:52 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 17 Mar 2014 21:46:24 +0000
Message-Id: <1395092786-12641-1-git-send-email-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 149.241.50.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
X-Mailman-Approved-At: Tue, 18 Mar 2014 00:57:45 -0400
Subject: [Qemu-trivial] [PATCH 0/2] Trivial documentation updates for
	sun4m/PowerPC
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
X-List-Received-Date: Mon, 17 Mar 2014 21:49:41 -0000

Hi all,

Here are a couple of minor documentation updates - the first is for sun4m and 
is primarily concerned with documenting the new CG3 framebuffer whilst touching
up a couple of minor errors. The second updates the documentation with respect
to the default PowerPC framebuffer settings which was changed in QEMU 1.7 to
800x600x32.


ATB,

Mark.


Mark Cave-Ayland (2):
  doc: update sun4m documentation
  doc: update default PowerPC framebuffer settings

 qemu-doc.texi   |   11 ++++++-----
 qemu-options.hx |   10 +++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.7.10.4


