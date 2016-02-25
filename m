Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYsnA-0005f4-9E
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 05:05:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYsn8-0005cm-60
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 05:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYsn7-0002j3-F2
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 05:05:02 -0500
Received: from [59.151.112.132] (port=40314 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aYsn2-0002h1-Dm; Thu, 25 Feb 2016 05:04:57 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3915014"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Feb 2016 18:04:46 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1462C42AC856;
	Thu, 25 Feb 2016 18:04:44 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Feb 2016 18:04:43 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56CED1F7.8070305@cn.fujitsu.com>
Date: Thu, 25 Feb 2016 18:05:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 1462C42AC856.AA048
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
X-List-Received-Date: Thu, 25 Feb 2016 10:05:03 -0000



On 02/25/2016 06:00 PM, Peter Maydell wrote:
> On 25 February 2016 at 09:32, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
>> to match structure MemoryRegionOps definition
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>> And there seems are some out of date content in this file, like
>> "cpu_register_io_memory()" mentioned in the last line, which is removed several
>> years ago in commit 97161e177. I am sure how to modify it, So I take the
>> liberty to CC the guys in the cc-list(get list from get_maintainer.pl).k
>

Hi peter,
Thanks for your quick response.
Can`t believe I miss a "not" in my word..."I am not sure how to modify 
it" so I CC you guys:)


-- 
Yours Sincerely,

Cao jin



