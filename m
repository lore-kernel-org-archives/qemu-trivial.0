Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UIxcF-0007k6-Bj
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 04:46:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UIxcD-0007gS-Ix
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 04:46:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UIxcC-000496-L8
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 04:46:21 -0400
Received: from [222.73.24.84] (port=36759 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UIxc9-00047Z-TV; Fri, 22 Mar 2013 04:46:18 -0400
X-IronPort-AV: E=Sophos;i="4.84,891,1355068800"; 
   d="scan'208";a="6924236"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 22 Mar 2013 16:43:44 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2M8k9gh025176;
	Fri, 22 Mar 2013 16:46:12 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013032216444107-1079428 ;
	Fri, 22 Mar 2013 16:44:41 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 22 Mar 2013 16:44:14 +0800
Message-Id: <1363941854-27111-2-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1363941854-27111-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1363941854-27111-1-git-send-email-lig.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/22 16:44:41,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/22 16:44:43
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BQemu-devel=5D=5BPATCH=5D_qdev=3A_remo?=
	=?utf-8?q?ve_redundant_abort=28=29?=
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
X-List-Received-Date: Fri, 22 Mar 2013 08:46:22 -0000

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/qdev.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/hw/qdev.c b/hw/qdev.c
index 689cd54..2bed9d8 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -116,11 +116,10 @@ DeviceState *qdev=5Fcreate(BusState *bus, const char =
*name)
         if (bus) {
             error=5Freport("Unknown device '%s' for bus '%s'", name,
                          object=5Fget=5Ftypename(OBJECT(bus)));
-            abort();
         } else {
             error=5Freport("Unknown device '%s' for default sysbus", name);
-            abort();
         }
+        abort();
     }
=20
     return dev;
--=20
1.7.2.5

=

