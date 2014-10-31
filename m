Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDrl-0003Z9-TT
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:11:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDr8-0002FG-TB
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:11:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk7Ia-0007Dj-EF
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 04:11:14 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:45570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk7IZ-0007Cz-5R; Fri, 31 Oct 2014 04:11:08 -0400
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDS43998; Fri, 31 Oct 2014 16:10:48 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 16:10:34 +0800
Message-ID: <545343EE.70006@huawei.com>
Date: Fri, 31 Oct 2014 16:10:22 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<dc4522b965468522221bd08231b169b1a3e28c69.1414681502.git.mjt@msgid.tls.msk.ru>
	<5453178B.2040504@huawei.com> <54533742.1000109@msgid.tls.msk.ru>
	<54533B60.2080008@huawei.com> <54533D41.6010704@msgid.tls.msk.ru>
	<5453412E.9020601@huawei.com> <54534211.8050102@msgid.tls.msk.ru>
In-Reply-To: <54534211.8050102@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 3/4] pidfile: stop making pidfile error a
	special case
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
X-List-Received-Date: Fri, 31 Oct 2014 15:11:51 -0000

On 2014/10/31 16:02, Michael Tokarev wrote:

> 31.10.2014 10:58, Gonglei wrote:
>> On 2014/10/31 15:41, Michael Tokarev wrote:
> []
>>>>>>> +            exit(len == 1 && status == 0 ? 0 : 1);
>>>>>
>>>>> ...it is checked here, note the 'len == 1' part of the condition.
>>>>
>>>> If len != 1, the original code exit with 1, after your changes,
>>>> it will exit with 0. Right?
>>>
>>> with len != 1, the condition 'len == 1 && status == 0 ? 0 : 1'
>>
>> Ok. That's will be great if you can modify it
>> to "(len == 1 && status == 0 ) ? 0 : 1"
> 
> Well, ? operator has lowest precedence in C, && and || is higher,
> and == is even higher.  That's the basic rules of the language.
> So I don't really see why... ;)
> 
> The comment however should clear all confusion, hopefully.
> 

Hmm...

BTW, Do you receive mails subscribed form Qemu community?
Does the Qemu maillist system crash?
Since yesterday evening, my colleagues and I do not received mails.
It's too weird!

Thanks!
-Gonglei


