Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQch8-0007BN-2Y
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 10:16:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQch4-00075k-Pn
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 10:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQch1-0001rd-Vx
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 10:16:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54204)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aQcgs-0001oz-7k; Tue, 02 Feb 2016 10:16:26 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id AD9008E919;
	Tue,  2 Feb 2016 15:16:25 +0000 (UTC)
Received: from [10.10.57.52] (vpn-57-52.rdu2.redhat.com [10.10.57.52])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u12FGMeW019727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 2 Feb 2016 10:16:23 -0500
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>
References: <1454347206-23717-1-git-send-email-wei@redhat.com>
	<1454347206-23717-2-git-send-email-wei@redhat.com>
	<CAFEAcA9XZHowe_JtGFcqEJpnZiqXwT+36bBPPKXWSgc1aVGtHg@mail.gmail.com>
	<56B054A8.6020602@msgid.tls.msk.ru>
From: Wei Huang <wei@redhat.com>
Message-ID: <56B0C845.9080602@redhat.com>
Date: Tue, 2 Feb 2016 09:16:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56B054A8.6020602@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 02 Feb 2016 15:16:39 -0000



On 02/02/2016 01:03 AM, Michael Tokarev wrote:
> 01.02.2016 21:01, Peter Maydell wrote:
>> On 1 February 2016 at 17:20, Wei Huang <wei@redhat.com> wrote:
>>> This patch removes float_high field of PL061State, which doesn't seem
>>> to be used anywhere.
> []
>>> @@ -88,7 +87,6 @@ static const VMStateDescription vmstate_pl061 = {
>>>          VMSTATE_UINT32(slr, PL061State),
>>>          VMSTATE_UINT32(den, PL061State),
>>>          VMSTATE_UINT32(cr, PL061State),
>>> -        VMSTATE_UINT32(float_high, PL061State),
>>>          VMSTATE_UINT32_V(amsel, PL061State, 2),
>>>          VMSTATE_END_OF_LIST()
>>
>> This would be a migration compatibility break, so at a minimum
>> you need to bump the vmstate struct versions.
> 
> Is it worth the effort to remove this field if it causes
> compatibility break?  Maybe keep it around, it doesn't hurt?

It doesn't hurt. So either way is fine. I just happened to find it while
reviewing the code.

> At the very least, we may rename it to "unused_float_high",
> or something, to indicate it is a known-unused?

I don't think renaming solves any problem. Either we keep this variable
as it is or remove it.

> 
> Thanks,
> 
> /mjt
> 

