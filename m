Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDru-0003jS-Fy
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:12:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkDrF-0007a9-Os
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:11:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xk7AF-0006Dh-FZ
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 04:02:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xk7AA-0005zX-9x; Fri, 31 Oct 2014 04:02:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3756546F7E;
	Fri, 31 Oct 2014 11:02:25 +0300 (MSK)
Message-ID: <54534211.8050102@msgid.tls.msk.ru>
Date: Fri, 31 Oct 2014 11:02:25 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<dc4522b965468522221bd08231b169b1a3e28c69.1414681502.git.mjt@msgid.tls.msk.ru>
	<5453178B.2040504@huawei.com> <54533742.1000109@msgid.tls.msk.ru>
	<54533B60.2080008@huawei.com> <54533D41.6010704@msgid.tls.msk.ru>
	<5453412E.9020601@huawei.com>
In-Reply-To: <5453412E.9020601@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Fri, 31 Oct 2014 15:11:55 -0000

31.10.2014 10:58, Gonglei wrote:
> On 2014/10/31 15:41, Michael Tokarev wrote:
[]
>>>>>> +            exit(len == 1 && status == 0 ? 0 : 1);
>>>>
>>>> ...it is checked here, note the 'len == 1' part of the condition.
>>>
>>> If len != 1, the original code exit with 1, after your changes,
>>> it will exit with 0. Right?
>>
>> with len != 1, the condition 'len == 1 && status == 0 ? 0 : 1'
> 
> Ok. That's will be great if you can modify it
> to "(len == 1 && status == 0 ) ? 0 : 1"

Well, ? operator has lowest precedence in C, && and || is higher,
and == is even higher.  That's the basic rules of the language.
So I don't really see why... ;)

The comment however should clear all confusion, hopefully.

>> evaluates to 1.  Maybe I can add a comment here:
>>
> 
>> +            /* only exit successfully if our child actually
>> +             * wrote a one-byte zero to our pipe */
>> +            exit(len == 1 && status == 0 ? 0 : 1);
>>
>> See the result at http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next


