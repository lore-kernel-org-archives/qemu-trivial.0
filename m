Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk45Z-000330-RJ
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 02:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bk45X-000318-Dr
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 02:54:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bk45T-0001om-Tl
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 02:54:28 -0400
Received: from [59.151.112.132] (port=57119 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bk45P-0001l0-92; Wed, 14 Sep 2016 02:54:23 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10967132"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 14:54:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2CE6B4623461;
	Wed, 14 Sep 2016 14:54:05 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 14:54:04 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<3ce74c99-1a3e-b29d-79bb-22d7125af51e@msgid.tls.msk.ru>
CC: <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
	Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <57D8F429.3080901@cn.fujitsu.com>
Date: Wed, 14 Sep 2016 14:54:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <3ce74c99-1a3e-b29d-79bb-22d7125af51e@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1251"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 2CE6B4623461.A75BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH 0/3] trivial changes of timer & cpus
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
X-List-Received-Date: Wed, 14 Sep 2016 06:54:32 -0000

Hi Michael,

I saw Paolo already queued these 3 into his branch and sent the pull 
request.

Cao jin

On 09/14/2016 02:47 PM, Michael Tokarev wrote:
> 29.07.2016 14:05, Cao jin wrote:
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc  Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> Cc: Richard Henderson <rth@twiddle.net>
>>
>> Cao jin (3):
>>   timer: update comments
>>   cpus: rename local variable to meaningful one
>>   cpus: update comments
>>
>>  cpus.c               | 13 +++++++------
>>  include/qemu/timer.h | 19 ++++++-------------
>>  2 files changed, 13 insertions(+), 19 deletions(-)
>
> Applied all 3 to -trivial, thanks!
>
> /mjt
>
>
>
>
>

-- 
Yours Sincerely,

Cao jin



