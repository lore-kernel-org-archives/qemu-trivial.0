Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrpY7-0004ux-Ef
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 11:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY5-0004qp-2b
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY1-0007XE-6K
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZrpXx-0007W3-Oj; Thu, 29 Oct 2015 11:55:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 4144A8E398;
	Thu, 29 Oct 2015 15:55:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9TFtMA7027631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Oct 2015 11:55:24 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 585E5303F916; Thu, 29 Oct 2015 16:55:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 16:55:18 +0100
Message-Id: <1446134122-32292-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 0/4] ui audio qxl usb: Use g_new() &
	friends where that makes obvious sense
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
X-List-Received-Date: Thu, 29 Oct 2015 15:55:34 -0000

v2:
* Trivially rebased

Markus Armbruster (4):
  ui: Use g_new() & friends where that makes obvious sense
  audio: Use g_new() & friends where that makes obvious sense
  qxl: Use g_new() & friends where that makes obvious sense
  usb: Use g_new() & friends where that makes obvious sense

 audio/alsaaudio.c           | 2 +-
 audio/coreaudio.c           | 2 +-
 audio/dsoundaudio.c         | 2 +-
 audio/ossaudio.c            | 2 +-
 audio/paaudio.c             | 2 +-
 audio/wavaudio.c            | 2 +-
 hw/audio/intel-hda.c        | 2 +-
 hw/display/qxl.c            | 2 +-
 hw/usb/ccid-card-emulated.c | 4 ++--
 hw/usb/dev-mtp.c            | 3 +--
 hw/usb/hcd-xhci.c           | 2 +-
 hw/usb/redirect.c           | 6 +++---
 ui/console.c                | 2 +-
 ui/curses.c                 | 2 +-
 ui/input-legacy.c           | 4 ++--
 ui/keymaps.c                | 2 +-
 ui/sdl.c                    | 2 +-
 ui/vnc-jobs.c               | 6 +++---
 ui/vnc.c                    | 6 +++---
 19 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.4.3


