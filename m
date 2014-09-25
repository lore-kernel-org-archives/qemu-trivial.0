Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX5e2-0006XJ-Eq
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 05:47:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5dv-0006MS-QN
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5dp-0004FA-Vt
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:19 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:56178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX5de-000497-UV; Thu, 25 Sep 2014 05:47:03 -0400
Received: from 172.24.2.119 (EHLO szxeml408-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AUV43905; Thu, 25 Sep 2014 17:46:43 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml408-hub.china.huawei.com
	(10.82.67.95) with Microsoft SMTP Server id 14.3.158.1; Thu, 25 Sep 2014
	17:46:35 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 25 Sep 2014 17:46:20 +0800
Message-ID: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020208.5423E484.016C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6a1b9f977086a8adda0402f5425a9fa9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 0/4] os: convert fprintf/perror to
	error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 09:47:24 -0000

From: Gonglei <arei.gonglei@huawei.com>

Those are trivial patches. Please consider
applying to trivial-next. Thanks!

Gonglei (4):
  os-posix/win32: convert fprintf/perror to error_report
  os-posix: report error message when lock file failed
  osdep: convert fprintf to error_report
  oslib-posix/win32: convert fprintf/perror to error_report

 os-posix.c         | 35 +++++++++++++++++++----------------
 os-win32.c         |  3 ++-
 util/osdep.c       |  8 ++++----
 util/oslib-posix.c |  8 ++++----
 util/oslib-win32.c |  2 +-
 5 files changed, 30 insertions(+), 26 deletions(-)

-- 
1.7.12.4



