Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDqER-00006P-A4
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jan 2015 03:01:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YDqEM-0008WS-7V
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:01:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YDqEF-0004R7-NB
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:01:38 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:37082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YDqEE-0004QS-Mv; Wed, 21 Jan 2015 03:01:31 -0500
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIG38951; Wed, 21 Jan 2015 16:01:19 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 21 Jan 2015 16:01:11 +0800
Message-ID: <54BF5CB9.9070706@huawei.com>
Date: Wed, 21 Jan 2015 16:00:57 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<1415881027-8112-2-git-send-email-arei.gonglei@huawei.com>
	<87d288kdup.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d288kdup.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] virtfs-proxy-helper:
 Fix possible socket leak.
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
X-List-Received-Date: Wed, 21 Jan 2015 08:01:42 -0000

On 2014/11/27 20:49, Markus Armbruster wrote:

> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Hi, Michael

I guess Paolo forgot this patch :(
Maybe this one can be picked up by qemu-trivial. Thanks.

Regards,
-Gonglei


