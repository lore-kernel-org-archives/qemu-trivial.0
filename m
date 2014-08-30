Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XNc5r-0007hM-Kf
	for mharc-qemu-trivial@gnu.org; Sat, 30 Aug 2014 02:24:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XNc5l-0007fh-8M
	for qemu-trivial@nongnu.org; Sat, 30 Aug 2014 02:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XNc5e-0001ft-Se
	for qemu-trivial@nongnu.org; Sat, 30 Aug 2014 02:24:53 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:61948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>)
	id 1XNc5d-0001er-Qt; Sat, 30 Aug 2014 02:24:46 -0400
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATS08744; Sat, 30 Aug 2014 14:24:35 +0800 (CST)
Received: from [127.0.0.1] (10.142.143.9) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 30 Aug 2014 14:24:32 +0800
Message-ID: <54016E1C.1090207@huawei.com>
Date: Sat, 30 Aug 2014 14:24:28 +0800
From: Li Liu <john.liuli@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1409369799-9028-1-git-send-email-john.liuli@huawei.com>
	<54016069.4070209@msgid.tls.msk.ru>
In-Reply-To: <54016069.4070209@msgid.tls.msk.ru>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.143.9]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.54016E24.007F,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: c25d0e64b44c633de058e6e9da38593b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] numa: fix qerror_report_err not free
	issue
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
X-List-Received-Date: Sat, 30 Aug 2014 06:24:58 -0000



On 2014/8/30 13:26, Michael Tokarev wrote:
> 30.08.2014 07:36, john.liuli wrote:
>> From: Li Liu <john.liuli@huawei.com>
>>
>> All qerror_report_err returned none NULL pointers need to
>> be freed, otherwise will cause memory leaking.
>>
>> Although this place did not cause real memory leaking by exit,
>> obviously it's not correct to use qerror_report_err
>> without error_free it.
> 
> I don't thing there's any good reason to free resources like
> this (freeing memory, closing files, etc) right before exit()
> (esp. in error path).  The OS will do that for us in one go
> much faster.
> 

Yes, the OS will do that for us. But if someone refer to this code
to use qerror_report_err, it will give a bad hint. Of cause this
patch is just a suggestion.

Best regards
Li.

> /mjt
> 
> 


