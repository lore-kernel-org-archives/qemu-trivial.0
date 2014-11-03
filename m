Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xl7fx-0006Vn-Nd
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 21:47:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xl7fl-0006HP-55
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 21:47:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xl7fa-0006Kc-IK
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 21:47:13 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:40397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xl7fQ-0005sq-7B; Sun, 02 Nov 2014 21:46:52 -0500
Received: from 172.24.2.119 (EHLO szxeml416-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWN53725; Mon, 03 Nov 2014 10:46:22 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by szxeml416-hub.china.huawei.com
	(10.82.67.155) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 3 Nov 2014 10:46:13 +0800
Message-ID: <5456EC73.1010402@huawei.com>
Date: Mon, 3 Nov 2014 10:46:11 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, <qemu-trivial@nongnu.org>
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1414806603-22556-4-git-send-email-zhang.zhanghailiang@huawei.com>
	<5454F9C7.4020208@redhat.com>
In-Reply-To: <5454F9C7.4020208@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A02020A.5456EC7F.006E, ss=2, re=0.001, recu=0.000,
	reip=0.000, cl=2, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1e26b981883bebcb0567de099bc53d46
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] qemu-char: convert some
 open functions to use Error API
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
X-List-Received-Date: Mon, 03 Nov 2014 02:47:23 -0000

On 2014/11/1 23:18, Eric Blake wrote:
> On 10/31/2014 07:50 PM, zhanghailiang wrote:
>> Convert several Character backend open functions to use the Error API.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   qemu-char.c | 52 +++++++++++++++++++++++++++-------------------------
>>   1 file changed, 27 insertions(+), 25 deletions(-)
>
>> @@ -2337,12 +2339,12 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
>>           if (stdio->hInputThread == INVALID_HANDLE_VALUE
>>               || stdio->hInputReadyEvent == INVALID_HANDLE_VALUE
>>               || stdio->hInputDoneEvent == INVALID_HANDLE_VALUE) {
>> -            fprintf(stderr, "cannot create stdio thread or event\n");
>> +            error_setg(errp, "cannot create stdio thread or event");
>>               exit(1);
>
> This conversion feels wrong.  error_setg() does not report an error, it
> just stores the error for a later entity higher in the call stack to
> report it.  But exit() means there is no execution of the reporting

OK, I got it, thanks for your explanation;)

> code.  Either leave this one alone, or get rid of the exit and instead
> properly propagate error status back to the caller and make sure the
> caller reports it.
>

I will keep the exit, but use error_report instead, as other places in qemu.,thanks.



