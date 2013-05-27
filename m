Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgnPI-0000Ce-65
	for mharc-qemu-trivial@gnu.org; Sun, 26 May 2013 22:43:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgnPE-00006a-LD
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 22:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgnPC-0005nB-Fu
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 22:43:28 -0400
Received: from [222.73.24.84] (port=51555 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UgnPA-0005lO-B7; Sun, 26 May 2013 22:43:24 -0400
X-IronPort-AV: E=Sophos;i="4.87,747,1363104000"; 
   d="scan'208";a="7374452"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 27 May 2013 10:40:25 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4R2hF30020828;
	Mon, 27 May 2013 10:43:15 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052710414895-1547357 ;
	Mon, 27 May 2013 10:41:48 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 27 May 2013 10:42:55 +0800
Message-Id: <1369622578-27443-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/27 10:41:49,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/27 10:41:50,
	Serialize complete at 2013/05/27 10:41:50
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH 0/3] debugcon: fix some issues of debugcon
	debug
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
X-List-Received-Date: Mon, 27 May 2013 02:43:30 -0000

when enable DEBUG_DEBUGCON, there are some message
printing issues, so fix them.

Li Guang (3)
	 debugcon: fix debug format specifiers
	 debugcon: beautify debugcon debug output
	 debugcon: add DPRINTF for debugcon debug

hw/char/debugcon.c | 22 +++--
1 files changed, 16 insertions(+), 6 deletions(-)



