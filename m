Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDvc-0002w4-MK
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:15:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDui-0006TE-Mc
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:15:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk5Qs-0005CJ-3q
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 02:11:39 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:17034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk5Qm-0004xc-9m; Fri, 31 Oct 2014 02:11:29 -0400
Received: from 172.24.2.119 (EHLO szxeml413-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWK08971; Fri, 31 Oct 2014 14:11:21 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml413-hub.china.huawei.com
	(10.82.67.152) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 14:11:13 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 31 Oct 2014 14:11:00 +0800
Message-ID: <1414735861-1232-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
References: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A02020A.5453280A.0056, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1028752a1fe71aaa6eccdcf12f442cfb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] tap: remove close(fd)
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
X-List-Received-Date: Fri, 31 Oct 2014 15:15:50 -0000

From: Gonglei <arei.gonglei@huawei.com>

commit 5193e5fb (tap: factor out common tap initialization)
introduce net_init_tap_one(). But it's inapposite that close
fd in net_init_tap_one(), we should lay it in the caller,
becuase some caller needn't to close it if we get the fd
by monitor_handle_fd_param().

On the other hand, in other exceptional branch fd doesn't
be closed, so that's incomplete.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 net/tap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/tap.c b/net/tap.c
index a40f7f0..7bcd4c7 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -598,7 +598,6 @@ static int net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
 
     s = net_tap_fd_init(peer, model, name, fd, vnet_hdr);
     if (!s) {
-        close(fd);
         return -1;
     }
 
-- 
1.7.12.4



