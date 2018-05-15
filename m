Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIW74-0004PU-89
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 05:19:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6z-0004J8-Hu
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6v-0001XQ-Io
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46970 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fIW6s-0001Up-G5; Tue, 15 May 2018 05:19:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9AA68172D6C;
	Tue, 15 May 2018 09:19:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B549112D18B;
	Tue, 15 May 2018 09:19:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A502693CFD; Tue, 15 May 2018 11:19:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 15 May 2018 11:18:51 +0200
Message-Id: <20180515091901.27774-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 15 May 2018 09:19:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 15 May 2018 09:19:05 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 00/10] Ui 20180515 patches
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
X-List-Received-Date: Tue, 15 May 2018 09:19:14 -0000

The following changes since commit fbd3a489df9953e2a5d017c922f3c103b2426952:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20180514' into staging (2018-05-14 18:53:42 +0100)

are available in the git repository at:

  git://git.kraxel.org/qemu tags/ui-20180515-pull-request

for you to fetch changes up to 677b490501823c1cb6946d8bb9e7907c12cd0c71:

  gtk: disable the F10 menubar key (2018-05-15 10:47:01 +0200)

----------------------------------------------------------------
ui: qapi parser for -display cmd line.
gtk: multiple fixes.
sdl: opts bugfix.
vnc: magic cookie.

----------------------------------------------------------------

Gerd Hoffmann (7):
  sdl2: move opts assignment into loop
  vnc: add magic cookie to VncState
  ui: add qapi parser for -display
  ui: switch trivial displays to qapi parser
  ui: switch gtk display to qapi parser
  ui: document non-qapi parser cases.
  console: use linked list for QemuConsoles

Peter Wu (2):
  gtk: make it possible to hide the menu bar
  gtk: disable the F10 menubar key

Tomeu Vizoso (1):
  ui/gtk: Only try to initialize EGL/X11 if GtkGlArea failed

 ui/vnc.h      |   3 ++
 ui/console.c  | 105 ++++++++++++++++++++++++++++++++--------------------------
 ui/gtk.c      |  60 +++++++++++++++++++++++++++++++--
 ui/sdl2.c     |   2 +-
 ui/vnc-jobs.c |   4 +++
 ui/vnc.c      |  10 +++++-
 vl.c          |  76 ++++++++++++++++++++----------------------
 7 files changed, 168 insertions(+), 92 deletions(-)

-- 
2.9.3


