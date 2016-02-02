Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQUzj-0006bZ-Ix
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 02:03:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQUzh-0006Xr-D5
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 02:03:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQUzg-0000OO-Jl
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 02:03:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aQUza-0000M3-Id; Tue, 02 Feb 2016 02:03:14 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7411440188;
	Tue,  2 Feb 2016 10:03:04 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, Wei Huang <wei@redhat.com>
References: <1454347206-23717-1-git-send-email-wei@redhat.com>
	<1454347206-23717-2-git-send-email-wei@redhat.com>
	<CAFEAcA9XZHowe_JtGFcqEJpnZiqXwT+36bBPPKXWSgc1aVGtHg@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56B054A8.6020602@msgid.tls.msk.ru>
Date: Tue, 2 Feb 2016 10:03:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XZHowe_JtGFcqEJpnZiqXwT+36bBPPKXWSgc1aVGtHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 2/2] ARM: PL061: Misc cleaning fields for
 PL061 device state
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
X-List-Received-Date: Tue, 02 Feb 2016 07:03:22 -0000

01.02.2016 21:01, Peter Maydell wrote:
> On 1 February 2016 at 17:20, Wei Huang <wei@redhat.com> wrote:
>> This patch removes float_high field of PL061State, which doesn't seem
>> to be used anywhere.
[]
>> @@ -88,7 +87,6 @@ static const VMStateDescription vmstate_pl061 = {
>>          VMSTATE_UINT32(slr, PL061State),
>>          VMSTATE_UINT32(den, PL061State),
>>          VMSTATE_UINT32(cr, PL061State),
>> -        VMSTATE_UINT32(float_high, PL061State),
>>          VMSTATE_UINT32_V(amsel, PL061State, 2),
>>          VMSTATE_END_OF_LIST()
> 
> This would be a migration compatibility break, so at a minimum
> you need to bump the vmstate struct versions.

Is it worth the effort to remove this field if it causes
compatibility break?  Maybe keep it around, it doesn't hurt?
At the very least, we may rename it to "unused_float_high",
or something, to indicate it is a known-unused?

Thanks,

/mjt

