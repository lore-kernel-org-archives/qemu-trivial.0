Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRcqb-00051F-SI
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 03:34:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRcqY-0004u7-TL
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 03:34:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRcqY-0001EQ-0y
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 03:34:02 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:1559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRcqS-0001Bm-TR; Sat, 28 Feb 2015 03:33:57 -0500
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKC39410; Sat, 28 Feb 2015 16:33:42 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 16:33:33 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 28 Feb 2015 16:33:21 +0800
Message-ID: <1425112403-10988-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	arei.gonglei@huawei.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 0/2] Fix key 'numerosign' missing in
	Russian keyboard
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
X-List-Received-Date: Sat, 28 Feb 2015 08:34:03 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

Add the keysym and keycode of 'numerosign' in Russian keyboard layout
to VNC keysyms table and keymap.

v2->v1:
 Remove the key 'numbersign' from Russian keymap as it is not exsit
 in Russian keyboard layout.

Wang Xin (2):
  qemu-char: add cyrillic characters 'numerosign' to VNC keysyms
  qemu-char: add cyrillic key 'numerosign' to Russian keymap

 pc-bios/keymaps/ru | 2 +-
 ui/vnc_keysym.h    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.3.4



