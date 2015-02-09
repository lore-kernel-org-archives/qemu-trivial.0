Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKeFE-0006yU-Do
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 21:38:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YKeFB-0006vC-Uc
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 21:38:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YKeFB-0000qp-9m
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 21:38:37 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:29830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YKeF6-0000oN-Ar; Sun, 08 Feb 2015 21:38:32 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJG30719; Mon, 09 Feb 2015 10:37:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1; Mon, 9 Feb 2015
	10:37:49 +0800
Message-ID: <54D81D70.8060508@huawei.com>
Date: Mon, 9 Feb 2015 10:37:36 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"stefano.stabellini@eu.citrix.com" <stefano.stabellini@eu.citrix.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 0/2] xen_pt: fix two Coverity defects
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
X-List-Received-Date: Mon, 09 Feb 2015 02:38:38 -0000

On 2015/1/31 15:27, Gonglei (Arei) wrote:

> From: Gonglei <arei.gonglei@huawei.com>
> 
> 
> Gonglei (2):
>   xen-pt: fix Negative array index read
>   xen-pt: fix Out-of-bounds read
> 
>  hw/xen/xen_pt_config_init.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Ping...

Regards,
-Gonglei


