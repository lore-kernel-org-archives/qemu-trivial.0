Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuF8f-00040C-PY
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2015 02:39:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZuF8d-0003yD-9g
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 02:39:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZuF8c-0000ca-HB
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 02:39:15 -0500
Received: from [59.151.112.132] (port=37449 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZuF8S-0000aw-VF; Thu, 05 Nov 2015 02:39:05 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="123992"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Nov 2015 15:38:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA57cJNV023415;
	Thu, 5 Nov 2015 15:38:19 +0800
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 5 Nov 2015 15:38:55 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 5 Nov 2015 15:39:03 +0800
Message-ID: <1446709143-19935-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH] Trivial: update comment of struct Object
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
X-List-Received-Date: Thu, 05 Nov 2015 07:39:16 -0000

it don`t has "GSList *interfaces" anymore

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 include/qom/object.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 0bb89d4..e46cc30 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -396,9 +396,6 @@ struct ObjectClass
  * As a result, #Object contains a reference to the objects type as its
  * first member.  This allows identification of the real type of the object at
  * run time.
- *
- * #Object also contains a list of #Interfaces that this object
- * implements.
  */
 struct Object
 {
-- 
2.1.0


