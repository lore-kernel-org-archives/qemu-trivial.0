Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xlbha-0004nF-Mx
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 05:51:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhS-0004eo-Nw
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:51:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlbhK-0005bg-QF
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 05:50:58 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:42505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlbhI-0005Yy-HF; Tue, 04 Nov 2014 05:50:50 -0500
Received: from 172.24.2.119 (EHLO szxeml405-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWP48262; Tue, 04 Nov 2014 18:50:40 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml405-hub.china.huawei.com
	(10.82.67.60) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Nov 2014
	18:50:29 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 4 Nov 2014 18:50:18 +0800
Message-ID: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020208.5458AF81.00F4, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d87833d5d2f4848cc05429cd2d68e89c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, armbru@redhat.com,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, kraxel@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 0/5] Trivial patch about qemu-char
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
X-List-Received-Date: Tue, 04 Nov 2014 10:51:05 -0000

Patch 1 and 2 fix check about parameter in chr_parse_* functions.
Patch 3 fix wrong english state in error message in windows part of the code.
The last two patches convert some open functions to use Error API.

In patch 4, i have tried to convert some codes which will be used 
in windows hypervisor. I didn't test them. But this is not too complex.

Markus has suggested add a separate patch for print_allowed_subtypes to use
error_prinf, but i think it's also in the context of "use Error API", so 
i fix it togther in patch 5.

v3:
- discard wrong modify about qemu_chr_open_pty (Michael Tokarev)
- use !str[0] in place of strlen(str) == 0 which makes more sense for parameter check (Michael Tokarev)
- Merge v2's patch 1 and 2 into a single patch (Michael Tokarev)
- Add new patch 3 to fix wrong english state in error message
- Use error_prinf instead of fprint for print_allowed_subtypes (Markus Armbruster) 

v2:
- don't use error_setg when followed by exit(), it does not report an error (Eric Blake)
- check the parameter in qemu_chr_parse_* functions and remove the check in qemu_chr_open_* functions. (Michael Tokarev)

Thanks very much for their reviews and suggestions;)

zhanghailiang (5):
  qemu-char: fix parameter check in some qemu_chr_parse_* functions
  spice-qemu-char: fix parameter checks in qemu_chr_parse_* functions
  qemu-char: fix incorrect state in error message
  qemu-char: convert some open functions to use Error API
  spice-qemu-char: convert some functions to use Error API

 include/ui/qemu-spice.h     |  2 +-
 qemu-char.c                 | 93 +++++++++++++++++++++++----------------------
 spice-qemu-char.c           | 26 ++++---------
 stubs/qemu-chr-open-spice.c |  2 +-
 4 files changed, 57 insertions(+), 66 deletions(-)

-- 
1.7.12.4


