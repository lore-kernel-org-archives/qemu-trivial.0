Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSg1n-0003An-BV
	for mharc-qemu-trivial@gnu.org; Tue, 03 Mar 2015 01:09:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YSg1k-00037W-NV
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 01:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YSg1h-0002YL-Hy
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 01:09:56 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:26004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YSg1g-0002Ub-RW; Tue, 03 Mar 2015 01:09:53 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKF27253; Tue, 03 Mar 2015 14:09:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1; Tue, 3 Mar 2015
	14:09:15 +0800
Message-ID: <54F54FF4.7060306@huawei.com>
Date: Tue, 3 Mar 2015 14:08:52 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<87pp8rhg6b.fsf@blackfin.pond.sub.org>
In-Reply-To: <87pp8rhg6b.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, hangaohuai@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC 0/5] Another patchset
 try to clean up around qerror_report_err()
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
X-List-Received-Date: Tue, 03 Mar 2015 06:09:57 -0000

On 2015/3/2 18:01, Markus Armbruster wrote:
> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>
>> Hi,
>>
>> I have noticed Markus's previous patchset
>> "Clean up around error_get_pretty(), qerror_report_err()".
>>
>> This is another patch series trying to do the same thing.
>> I'm not sure if he has missed this places or these modifies are false.
>>
>> So, please review...
>>
>> Thanks.
>
> Help with qerror elimination is of course appreciated!  However, there's
> overlap with related patches in flight.  Easy to miss, because there are
> so many of them.  I'll elaborate in replies to your patches.
>
>

Hmm, thanks for your reply, and i saw most of these problems have been fixed by you,
this is great :)



