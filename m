Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtwLD-0006FG-Ub
	for mharc-qemu-trivial@gnu.org; Thu, 27 Nov 2014 05:30:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XtwL7-00062I-G4
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 05:30:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XtwL2-0006RS-NS
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 05:30:21 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:28034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XtwKr-00064l-ST; Thu, 27 Nov 2014 05:30:06 -0500
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXU24063; Thu, 27 Nov 2014 18:29:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 27 Nov 2014 18:29:47 +0800
Message-ID: <5476FD18.9000403@huawei.com>
Date: Thu, 27 Nov 2014 18:29:44 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A02020A.5476FD27.013C, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 78f9490fc3cb164ecc78ac214ce98a92
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH 0/2] virtfs-proxy-helper: Fix Coverity
	warning
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
X-List-Received-Date: Thu, 27 Nov 2014 10:30:26 -0000

On 2014/11/13 20:17, Gonglei (Arei) wrote:

> From: Gonglei <arei.gonglei@huawei.com>
> 
> Gonglei (2):
>   virtfs-proxy-helper: Fix possible socket leak.
>   virtfs-proxy-helper: Fix handle leak to make Coverity happy
> 
>  fsdev/virtfs-proxy-helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 

Ping...

Thanks,
-Gonglei


