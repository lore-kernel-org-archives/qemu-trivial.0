Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YReWb-00020j-5e
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 05:21:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReWY-0001xs-QY
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:21:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReWV-0003SX-LC
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:21:30 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:41719)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YReWU-0003Ru-Qk; Sat, 28 Feb 2015 05:21:27 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKC48798; Sat, 28 Feb 2015 18:21:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 18:21:14 +0800
Message-ID: <54F19698.10307@huawei.com>
Date: Sat, 28 Feb 2015 18:21:12 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>	<1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>	<54F18FE7.50602@msgid.tls.msk.ru>
	<54F19194.6050805@huawei.com> <54F19606.4090609@msgid.tls.msk.ru>
In-Reply-To: <54F19606.4090609@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/9] arm: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 10:21:31 -0000

On 2015/2/28 18:18, Michael Tokarev wrote:
> 28.02.2015 12:59, Gonglei wrote:
>> On 2015/2/28 17:52, Michael Tokarev wrote:
>>> This patch does not apply to current tree.
>>>
>> You meant this one should be accepted by arm tree?
> 
> Nope. I mean this patch does not apply to my tree.  I found the
> problem -- it is because of "Remove superfluous '\n' around error_report()"
> series which changed the context slightly.  I applied this one
> too.
> 
ok, thank you.

Regards,
-Gonglei



