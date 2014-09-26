Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXQhk-0004AR-Uj
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 04:16:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XXQhe-00040L-SN
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XXQha-0004wd-0g
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:16:34 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:65493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XXQhN-0004uJ-JP; Fri, 26 Sep 2014 04:16:19 -0400
Received: from 172.24.2.119 (EHLO szxeml411-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZZ51097; Fri, 26 Sep 2014 16:14:53 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml411-hub.china.huawei.com
	(10.82.67.138) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 26 Sep 2014 16:14:43 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Sep 2014 16:14:29 +0800
Message-ID: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, armbru@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, pbonzini@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH 0/3] os-posix: improve the error message
	printing
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
X-List-Received-Date: Fri, 26 Sep 2014 08:16:39 -0000

From: Gonglei <arei.gonglei@huawei.com>

The patches mainly improve the error message printing.
And adjust coding style of os-posix.c.

Daemonize the QEMU process after initialization, QEMU will not detach from
standard IO until it is ready to receive connections on any of its devices.
So, using fprintf print error.

Cc: Eric Blake <eblake@redhat.com>

Gonglei (3):
  os-posix: change tab to space avoid violating coding style
  os-posix: remove confused errno
  os-posix: report error message when lock file failed

 os-posix.c | 83 ++++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

-- 
1.7.12.4



