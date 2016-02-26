Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZ8FX-0002ZH-LJ
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 21:35:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZ8FV-0002XB-E3
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 21:35:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZ8FU-0006l7-KZ
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 21:35:21 -0500
Received: from [59.151.112.132] (port=23261 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aZ8FP-0006as-A2; Thu, 25 Feb 2016 21:35:15 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3940415"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2016 10:34:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9A5664219042;
	Fri, 26 Feb 2016 10:34:58 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Feb 2016 10:34:58 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
	<56CF020A.8030704@cn.fujitsu.com>
	<CAFEAcA9=u6FiqNTw25x3k5uLKZ9QnDqsho2BdfqZ-ybjfRa_fA@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56CFBA10.7000708@cn.fujitsu.com>
Date: Fri, 26 Feb 2016 10:36:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=u6FiqNTw25x3k5uLKZ9QnDqsho2BdfqZ-ybjfRa_fA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 9A5664219042.A5909
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc/memory.txt: fix typo
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
X-List-Received-Date: Fri, 26 Feb 2016 02:35:22 -0000



On 02/25/2016 10:24 PM, Peter Maydell wrote:
> On 25 February 2016 at 13:30, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:

>
> You're certainly right that the documentation as it stands is wrong.
> I don't think this is a simple typo though. Probably what happened
> was that when the API was being designed it started off with an
> 'unaligned' field, and then later the field name and semantics
> were changed but the docs weren't updated to match. My point was
> that just changing the name without looking at the behaviour we're
> actually implementing isn't correct.
>

Totally agree with the point.

>> I admit that, the description like ".valid.unaligned specifies that the
>> device only accepts naturally aligned accesses" looks very confusing. But
>> from the only caller memory_region_access_valid(), I think the original
>> maybe not quite good? how about this:
>
>> /.valid.unaligned specifies that the device accepts unaligned accesses.  If
>> false, Unaligned accesses invoke device and bus specific behaviour/
>
> I would suggest:
>
>    - .valid.unaligned specifies that the *device being modelled*
>      supports unaligned accesses; if false, unaligned accesses will
>      invoke the appropriate bus or CPU specific behaviour.
>

Does better. I want to pack this into a trivial patch first, because the 
original is not easy to read & understand

> (the idea being to make the text parallel to the existing
> .impl.unaligned docs so it's clear what the difference is.)
>
> thanks
> -- PMM
>
>
> .
>

-- 
Yours Sincerely,

Cao jin



