Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNIxH-0002lY-IY
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jul 2016 08:07:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNIxA-0002dD-NM
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 08:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNIx5-0002IU-BS
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 08:07:48 -0400
Received: from [59.151.112.132] (port=22839 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bNIwy-0002HU-MN; Wed, 13 Jul 2016 08:07:37 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8668636"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jul 2016 20:06:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 68D38418A720;
	Wed, 13 Jul 2016 20:06:37 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 13 Jul 2016 20:06:35 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1468400796-30474-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<4b36498b-a15f-1da3-0792-40709c2c230d@redhat.com>
	<578628A0.60400@cn.fujitsu.com>
	<aaf97fcf-e706-7305-08a0-3c1e99887456@redhat.com>
CC: <qemu-trivial@nongnu.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5786306F.6080503@cn.fujitsu.com>
Date: Wed, 13 Jul 2016 20:13:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <aaf97fcf-e706-7305-08a0-3c1e99887456@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 68D38418A720.A47AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: remove unnecessary code
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2016 12:07:53 -0000



On 07/13/2016 07:40 PM, Paolo Bonzini wrote:
>
>
> On 13/07/2016 13:40, Cao jin wrote:
>>
>>
>> On 07/13/2016 06:21 PM, Paolo Bonzini wrote:
>>>
>>>
>>> On 13/07/2016 11:06, Cao jin wrote:
>>>> When passed argument 'ns' is 0, macro DIV_ROUND_UP will return 0 also.
>>>
>>> It's potentially slower though.
>>>
>>
>> Is it because the function in the i/o loop path, so the potentially
>> extra arithmetical instructions matters?
>
> It is quite common for ns to be zero, for example if a bottom half has
> to be invoked.
>

I see. I need dig deeper to understand the wholely I/O mechanism. Thanks 
Paolo!

> However, qemu_timeout_ns_to_ms is not used in the really important path
> (which is aio_poll in aio-posix.c) so I guess your patch is okay.
>
> Thanks,
>
> Paolo
>

-- 
Yours Sincerely,

Cao jin



