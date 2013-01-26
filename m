Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzD19-0008St-VJ
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jan 2013 16:10:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzD17-0008Se-6x
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 16:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzD16-0005Yw-70
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 16:10:25 -0500
Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]:25767
	helo=co9outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>)
	id 1TzD16-0005Yh-1h; Sat, 26 Jan 2013 16:10:24 -0500
Received: from mail188-co9-R.bigfish.com (10.236.132.251) by
	CO9EHSOBE042.bigfish.com (10.236.130.105) with Microsoft SMTP Server id
	14.1.225.23; Sat, 26 Jan 2013 20:55:18 +0000
Received: from mail188-co9 (localhost [127.0.0.1])	by
	mail188-co9-R.bigfish.com (Postfix) with ESMTP id D55DC3602E5;
	Sat, 26 Jan 2013 20:55:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzzz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h906i1155h)
Received-SPF: pass (mail188-co9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=peter.crosthwaite@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail188-co9 (localhost.localdomain [127.0.0.1]) by mail188-co9
	(MessageSwitch) id 1359233682470704_27534;
	Sat, 26 Jan 2013 20:54:42 +0000 (UTC)
Received: from CO9EHSMHS025.bigfish.com (unknown [10.236.132.246])	by
	mail188-co9.bigfish.com (Postfix) with ESMTP id 66B03AE0048;
	Sat, 26 Jan 2013 20:54:42 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO9EHSMHS025.bigfish.com
	(10.236.130.35) with Microsoft SMTP Server id 14.1.225.23;
	Sat, 26 Jan 2013 20:54:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<peter.crosthwaite@xilinx.com>)	id 1TzClu-0004vf-AG; Sat, 26 Jan 2013
	12:54:42 -0800
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 26 Jan 2013 12:54:32 -0800
X-Mailer: git-send-email 1.7.12.1.396.g16eed7c
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <a96aa63e-80c2-436d-8e57-bfba6d45dc02@CO9EHSMHS025.ehs.local>
X-OriginatorOrg: xilinx.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.163.28
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH 0/4] Xilinx Trivial Patches
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
X-List-Received-Date: Sat, 26 Jan 2013 21:10:26 -0000

Current queue of trivial patches from the Xilinx tree.

Peter Crosthwaite (4):
  cadence_ttc: Debug mode compile fixes
  cadence_gem: Debug mode compile fixes
  xilinx_axidma: Fix debug mode compile messages
  qemu/log.h: Fix missing includes

 hw/cadence_gem.c   | 17 ++++++++++-------
 hw/cadence_ttc.c   |  4 ++--
 hw/xilinx_axidma.c |  2 +-
 include/qemu/log.h |  1 +
 4 files changed, 14 insertions(+), 10 deletions(-)

-- 
1.7.12.1.396.g16eed7c



