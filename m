Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNCsM-0006O6-0c
	for mharc-qemu-trivial@gnu.org; Sun, 15 Feb 2015 23:01:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNCsJ-0006K1-FY
	for qemu-trivial@nongnu.org; Sun, 15 Feb 2015 23:01:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNCsI-0005Ct-M1
	for qemu-trivial@nongnu.org; Sun, 15 Feb 2015 23:01:35 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:42344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YNCsD-00058f-0u; Sun, 15 Feb 2015 23:01:29 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJO77359; Mon, 16 Feb 2015 12:01:23 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 16 Feb 2015 12:01:16 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 16 Feb 2015 12:00:56 +0800
Message-ID: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	mjt@tls.msk.ru, kraxel@redhat.com, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 0/2] Fix key 'numerosign' missing in Russian
	keyboard
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
X-List-Received-Date: Mon, 16 Feb 2015 04:01:36 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

Add the keysym and keycode of 'numerosign' in Russian keyboard layout
to VNC keysyms table and keymap.

Wang Xin (2):
  qemu-char: add cyrillic characters 'numerosign' to VNC keysyms
  qemu-char: add cyrillic key 'numerosign' to Russian keymap

 pc-bios/keymaps/ru | 1 +
 ui/vnc_keysym.h    | 1 +
 2 files changed, 2 insertions(+)

-- 
1.8.3.4



