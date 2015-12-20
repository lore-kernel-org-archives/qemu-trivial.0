Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aAb0u-0007BW-PR
	for mharc-qemu-trivial@gnu.org; Sun, 20 Dec 2015 05:14:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aAb0r-00077A-W7
	for qemu-trivial@nongnu.org; Sun, 20 Dec 2015 05:14:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aAb0r-0007ia-3g
	for qemu-trivial@nongnu.org; Sun, 20 Dec 2015 05:14:49 -0500
Received: from [59.151.112.132] (port=26518 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aAb0h-0007dl-D7; Sun, 20 Dec 2015 05:14:44 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1774738"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Dec 2015 18:14:36 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 488EC4066D01;
	Sun, 20 Dec 2015 18:14:27 +0800 (CST)
Received: from [10.167.226.86] (10.167.226.86) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 20 Dec 2015 18:17:44 +0800
To: Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster
	<armbru@redhat.com>
References: <1450428770-18215-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87wpsbex5u.fsf@blackfin.pond.sub.org>
	<CAFEAcA8VxYbYYWHcevhOVndWnTegAWvKMnmd-HR+-p04ws8bGw@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5676800F.4020706@cn.fujitsu.com>
Date: Sun, 20 Dec 2015 18:16:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VxYbYYWHcevhOVndWnTegAWvKMnmd-HR+-p04ws8bGw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.86]
X-yoursite-MailScanner-ID: 488EC4066D01.A6908
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Use macro instead of
	plain text
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
X-List-Received-Date: Sun, 20 Dec 2015 10:14:51 -0000

Hi Peter,

Thanks for the explanation, it make me aware that why there are lots of 
"plain_text_for_device":)

forget it please.

On 12/18/2015 09:01 PM, Peter Maydell wrote:
> On 18 December 2015 at 12:52, Markus Armbruster <armbru@redhat.com> wrote:
>> Cao jin <caoj.fnst@cn.fujitsu.com> writes:
>>
>>> There is TYPE_ICH9_AHCI definition in ahci.h when QOMify it, seems it
>>> is missed.
>
>> I suspect there are more instances of the same problem.
>
>> Not sure how interested we are in consistent use of these macros...
>
> In a lot of cases we'd need to find somewhere appropriate to put the
> TYPE_* macro which might well mean creating a new header file just
> for the purpose. That seems like overkill...
>
> thanks
> -- PMM
>
>
>

-- 
Yours Sincerely,

Cao Jin



