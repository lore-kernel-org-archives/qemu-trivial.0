Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlECA-0006VO-F7
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 04:45:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlEC2-0006Tx-SN
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:45:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlEBw-0008Go-Ng
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 04:44:58 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:22951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlEBv-0008FW-QJ; Mon, 03 Nov 2014 04:44:52 -0500
Received: from 172.24.2.119 (EHLO SZXEML458-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWO13420; Mon, 03 Nov 2014 17:44:44 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML458-HUB.china.huawei.com
	(10.82.67.201) with Microsoft SMTP Server id 14.3.158.1; Mon, 3 Nov 2014
	17:44:34 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 3 Nov 2014 17:44:27 +0800
Message-ID: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.54574E8D.0083, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a38c26be3ff778e6418a166071249ba1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2 0/5] Trivial patch about qemu-char
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
X-List-Received-Date: Mon, 03 Nov 2014 09:45:05 -0000

Patch 1~3 fix wrong check about in-parameter.
The last two patches convert some open functions to use Error API.

v2:
- don't use error_setg when followed by exit(), it does not report an error (Eric Blake)
- check the parameter in qemu_chr_parse_* functions and remove the check in qemu_chr_open_* functions. (Michael Tokarev)

Thanks very much for their reviews and suggestions;)

---
zhanghailiang (5):
  qemu-char: fix parameter check for some qemu_chr_parse_* functions
  qemu-char: remove unnecessary in-parameter check for
    qemu_chr_parse_pipe
  spice-qemu-char: fix parameter check for qemu_chr_parse_* functions
  qemu-char: convert some open functions to use Error API
  spice-qemu-char: convert qemu_chr_open_spice_vmc to use Error API

 include/ui/qemu-spice.h     |  2 +-
 qemu-char.c                 | 65 +++++++++++++++++++++------------------------
 spice-qemu-char.c           | 19 ++++---------
 stubs/qemu-chr-open-spice.c |  2 +-
 4 files changed, 38 insertions(+), 50 deletions(-)

-- 
1.7.12.4


