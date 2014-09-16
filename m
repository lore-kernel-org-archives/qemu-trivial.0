Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XThlo-0002Ba-Al
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 21:41:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XThli-0002BT-LA
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 21:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XThld-00065W-SY
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 21:41:22 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:33485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>)
	id 1XThlc-00063w-9C; Mon, 15 Sep 2014 21:41:17 -0400
Received: from 172.24.2.119 (EHLO szxeml452-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZM53104; Tue, 16 Sep 2014 09:40:38 +0800 (CST)
Received: from [127.0.0.1] (10.142.143.9) by szxeml452-hub.china.huawei.com
	(10.82.67.195) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 16 Sep 2014 09:40:30 +0800
Message-ID: <5417950C.1040004@huawei.com>
Date: Tue, 16 Sep 2014 09:40:28 +0800
From: Li Liu <john.liuli@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <armbru@redhat.com>
References: <1410261588-8360-1-git-send-email-john.liuli@huawei.com>
	<5416E094.9070500@msgid.tls.msk.ru>
	<5416E22B.9060002@msgid.tls.msk.ru>
In-Reply-To: <5416E22B.9060002@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.143.9]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2] qemu-char: fix terminal crash when
 using "-monitor stdio -nographic"
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
X-List-Received-Date: Tue, 16 Sep 2014 01:41:27 -0000



On 2014/9/15 20:57, Michael Tokarev wrote:
> 15.09.2014 16:50, Michael Tokarev пишет:
>> 09.09.2014 15:19, john.liuli wrote:
>>> From: Li Liu <john.liuli@huawei.com>
>>>
>>> Eeay to reproduce, just try "qemu -monitor stdio -nographic"
>>> and type "quit", then the terminal will be crashed.
>>>
>>> There are two pathes try to call tcgetattr of stdio in vl.c:
>>
>> This looks reasonable.  Except of one thing -- how about renaming
>> stdio_is_ready to stdio_in_use?  (I can do that when applying, no
>> need to resend anythnig).  Because, well, stdio_is_ready is not
>> obvious at all, at least to me... :)
> 
> And oh, the commit comment -- it is not 'terminal crash', it is
> 'terminal misbehavor' or something like that.  Terminal does not
> crash, it just does not have proper settings after qemu exits.
> 
> /mjt
> 

Thanks four your comments! Can you help do this when applying
incidentally? Or I will resend it again?

Best Regards,

Li.

> .
> 


