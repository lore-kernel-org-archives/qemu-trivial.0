Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhByX-0001Bi-Qq
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:34:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhByR-0000zt-0u
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhByM-00087p-49
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:34:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhByC-00084Z-2q; Thu, 23 Oct 2014 02:34:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D1CB945A8F;
	Thu, 23 Oct 2014 10:33:50 +0400 (MSK)
Message-ID: <5448A14D.7070007@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:33:49 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>	<541D8812.1040406@msgid.tls.msk.ru>	<87ppeow4uk.fsf@blackfin.pond.sub.org>
	<541FD10D.8000809@msgid.tls.msk.ru>
In-Reply-To: <541FD10D.8000809@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] vl: Fix possible freed
 memory accessing
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
X-List-Received-Date: Thu, 23 Oct 2014 06:34:20 -0000

On 09/22/2014 11:34 AM, Michael Tokarev wrote:
> 22.09.2014 10:23, Markus Armbruster wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>
>>> Applied to -trivial, thank you!
>>
>> Makes my 'hmp: Remove "info pcmcia"' conflict.  Either revert this one
>> before applying mine, or resolve the conflict and drop the paragraph
>> about the bug from my commit message.
> 
> Okay, I'll keep an eye on this -- I'm reverting the trivial patch
> for now.

So it looks like the original patch by zhanghailiang still applies,
and your patch, `info pcmcia' removal, hasn't been applied for over
a month. Should I apply the bugfix by zhanghailiang finally?

Thanks,

/mjt

