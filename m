Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YCCSs-0002oj-Ur
	for mharc-qemu-trivial@gnu.org; Fri, 16 Jan 2015 14:21:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCSp-0002if-Au
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCSo-0000iU-Em
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:21:47 -0500
Received: from fldsmtpe04.verizon.com ([140.108.26.143]:41285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1YCCSk-0000gg-95; Fri, 16 Jan 2015 14:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dkoch@verizon.com; q=dns/txt; s=corp;
	t=1421436102; x=1452972102;
	h=from:to:cc:subject:date:message-id;
	bh=btO05vMHx72dvvk7hMiSFphbbmht136OoiaIjU2J5Vk=;
	b=nIMSGh0O1ZYd1OB6pWDzXmNYXMtIcPOkQ/V684zq4ti7zPKFbuPzHdkZ
	Hrn+64AYS24dqg0TZ/NM8xVRHyhQGK1rGOdwB/XARjkGuucCN/kZxak0R
	ZsCa0rtca2CaNWghDi4AGVtoqaikhLxaPOc9uvB5mKRw7YbQ1m0lLrVt5 k=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi02.verizon.com) ([166.68.71.144])
	by fldsmtpe04.verizon.com with ESMTP; 16 Jan 2015 19:21:41 +0000
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.09,412,1418083200"; d="scan'208";a="915457482"
Received: from unknown (HELO yoyo.cloudswitch.com) ([208.52.205.215])
	by fldsmtpi02.verizon.com with ESMTP; 16 Jan 2015 19:21:41 +0000
From: Don Koch <dkoch@verizon.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Jan 2015 14:21:35 -0500
Message-Id: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.108.26.143
Cc: qemu-trivial@nongnu.org, Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PATCH 0/3] Trace calls for xenfb, ps2 and pcnet
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
X-List-Received-Date: Fri, 16 Jan 2015 19:21:48 -0000

Add trace calls for debugging xenfb, ps2 and pcnet.

Don Koch (4):
  Add tracing to xenfb.
  Add trace to ps2.c.
  Add/convert trace calls in pcnet-pci.c.
  Convert some debugging printfs to trace calls in pcnet.c.

 hw/display/xenfb.c |  5 +++++
 hw/input/ps2.c     | 16 ++++++++++++++++
 hw/net/pcnet-pci.c | 49 +++++++++++++++++++------------------------------
 hw/net/pcnet.c     | 28 ++++++++--------------------
 trace-events       | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+), 50 deletions(-)

-- 
1.8.3.1


