Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipqRB-0002FQ-1y
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jan 2020 04:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR8-0002BT-Fj
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 04:18:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR7-00054r-Ge
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 04:18:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:58484 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ipqR4-0004dd-3B; Fri, 10 Jan 2020 04:18:30 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1633287B7610E0E9B43E;
 Fri, 10 Jan 2020 17:18:26 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 10 Jan 2020 17:18:15 +0800
From: <pannengyuan@huawei.com>
To: <pbonzini@redhat.com>, <mdroth@linux.vnet.ibm.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>
Subject: [PATCH v2 0/2] fix mismatches between g_strsplit and g_free
Date: Fri, 10 Jan 2020 17:17:08 +0800
Message-ID: <20200110091710.53424-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2020 09:18:35 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

v1: fix a mismatch in vl.c
v2: fix mismatch in vl.c and qga/main.c

Pan Nengyuan (2):
  vl: Don't mismatch g_strsplit()/g_free()
  qga/main: Don't mismatch g_strsplit/g_free in split_list()

 qga/main.c | 2 +-
 vl.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.21.0.windows.1



