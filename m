Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZytS-0003B6-VM
	for mharc-qemu-trivial@gnu.org; Sun, 28 Feb 2016 05:48:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZytQ-00038V-QS
	for qemu-trivial@nongnu.org; Sun, 28 Feb 2016 05:48:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZytQ-00031U-0w
	for qemu-trivial@nongnu.org; Sun, 28 Feb 2016 05:48:04 -0500
Received: from [59.151.112.132] (port=35923 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aZytI-0002y7-TB; Sun, 28 Feb 2016 05:47:58 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3993233"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2016 18:47:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E87242AC84B;
	Sun, 28 Feb 2016 18:47:26 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 28 Feb 2016 18:47:25 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1456486178-8074-2-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA-LmoovVxDb76TQN8UWJuFxa28ofx-i1TRcSLERapQ=rQ@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56D2D082.7020007@cn.fujitsu.com>
Date: Sun, 28 Feb 2016 18:48:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LmoovVxDb76TQN8UWJuFxa28ofx-i1TRcSLERapQ=rQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 2E87242AC84B.A735E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3 1/2] doc/memory: fix typo
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
X-List-Received-Date: Sun, 28 Feb 2016 10:48:05 -0000



On 02/26/2016 07:36 PM, Peter Maydell wrote:
> On 26 February 2016 at 11:29, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:

>
> Needs to be a semicolon before the "if".
>
> Either "something something. If foo" or "something something; if foo"
> are correct as punctuation. Since we're aiming to follow the same
> construction as the existing text for .impl.unaligned, we want the
> semicolon and lowercase.
>

interesting punctuation knowledge to me(as a non-native speaker). Thanks 
for the comment:)

-- 
Yours Sincerely,

Cao jin



