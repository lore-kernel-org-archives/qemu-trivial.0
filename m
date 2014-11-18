Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xqdru-0006rf-Au
	for mharc-qemu-trivial@gnu.org; Tue, 18 Nov 2014 03:10:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xqdro-0006mD-JX
	for qemu-trivial@nongnu.org; Tue, 18 Nov 2014 03:10:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xqdrk-0006x2-7y
	for qemu-trivial@nongnu.org; Tue, 18 Nov 2014 03:10:28 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:59372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xqdra-0006l0-CF; Tue, 18 Nov 2014 03:10:14 -0500
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEP37463; Tue, 18 Nov 2014 16:09:53 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 18 Nov 2014 16:07:57 +0800
Message-ID: <546AFE59.6040208@huawei.com>
Date: Tue, 18 Nov 2014 16:07:53 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-2-git-send-email-arei.gonglei@huawei.com>
	<546A2931.20209@msgid.tls.msk.ru>
	<87y4r9vtf1.fsf@blackfin.pond.sub.org>
In-Reply-To: <87y4r9vtf1.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "Huangweidong \(C\)" <weidong.huang@huawei.com>,
	Zhanghailiang <zhang.zhanghailiang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/9] l2tpv3: fix fd leak
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
X-List-Received-Date: Tue, 18 Nov 2014 08:10:33 -0000

On 2014/11/18 15:50, Markus Armbruster wrote:

> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> 15.11.2014 13:06, arei.gonglei@huawei.com wrote:
>>> From: Gonglei <arei.gonglei@huawei.com>
>>>
>>> In this false branch, fd will leak when it is zero.
>>> Change the testing condition.
>>
>> Why fd==0 is a concern here?  It is a very unlikely
>> situation that fd0 will be picked - firstly because
>> fd0 is almost always open, and second - even if it
>> isn't open, it will be picked much earlier than this
>> code path, ie, some other file will use fd0 before.
>>
>> But even if the concern is real (after all, better
>> stay correct than spread bad code pattern, even if
>> in reality we don't care as this can't happen), why
>> not add 0 to the equality?
>>
>> Why people especially compare with -1?  Any negative
>> value is illegal here and in lots of other places,
>> and many software packages used to return -errno in
>> error cases, which is definitely != -1.  I'm not
>> saying that comparing with -1 is bad in _this_
>> particular case, but why not do it generally in
>> all cases?
>>
>> More, comparing with 0 is faster and shorter than
>> comparing with -1...
>>
>> So if it were me, I'd change it to >= 0, not to
>> == -1.  Here and in all other millions of places
>> in qemu code where it compares with -1... ;)
> 
> Yup.
> 
> In the case of close(), I wouldn't even bother to check, except Coverity
> gets excited when it sees an invalid fd flow into close().  Rightfully
> so when the invalid fd is non-negative, overeager when it's negative.

Thank you, guys.
Paolo had fixed it :)

Best regards,
-Gonglei


