Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ufi3L-0007x7-Bo
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 22:48:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Ufi3F-0007jE-IA
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 22:48:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Ufi37-0007uk-6y
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 22:48:17 -0400
Received: from [222.73.24.84] (port=11419 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Ufi2u-0007U9-Lv; Thu, 23 May 2013 22:47:56 -0400
X-IronPort-AV: E=Sophos;i="4.87,731,1363104000"; 
   d="scan'208";a="7351278"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 24 May 2013 10:44:57 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4O2lkEh002230;
	Fri, 24 May 2013 10:47:47 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052410462551-1495789 ;
	Fri, 24 May 2013 10:46:25 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 May 2013 10:47:30 +0800
Message-Id: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/24 10:46:25,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/24 10:46:26,
	Serialize complete at 2013/05/24 10:46:26
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH 0/4] debugcon: fix some bugs when
	DEBUG_DEBUGCON
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
X-List-Received-Date: Fri, 24 May 2013 02:48:22 -0000

when enable DEBUG_DEBUGCON, there are some message
printing bugs, so fix them.

this patch-set based on previous 3 patches,
http://comments.gmane.org/gmane.comp.emulators.qemu/212550
http://comments.gmane.org/gmane.comp.emulators.qemu/212551
http://comments.gmane.org/gmane.comp.emulators.qemu/212552

cover-letter and patch [4/4] are new, no changes
for other 3.

Li Guang (4)
	 debugcon: fix always print "addr=0x0, val=0x0" bug when use DEBUG_DEBUGCON
	 debugcon: make debug message more readable
	 debugcon: fix compiler warning when open DEBUG_DEBUGCON
	 debugcon: use fprintf(stderr...) instead of printf

hw/char/debugcon.c | 13 +-
1 files changed, 7 insertions(+), 6 deletions(-)



