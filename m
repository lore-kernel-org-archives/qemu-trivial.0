Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQVxt-0001mu-Lc
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 03:05:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQVxq-0001iT-SJ
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:05:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQVxq-0003ZN-2H
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:05:30 -0500
Received: from [59.151.112.132] (port=23801 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQVxk-0003YW-OQ; Tue, 02 Feb 2016 03:05:25 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3226513"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Feb 2016 16:05:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D307141896FB;
	Tue,  2 Feb 2016 16:04:31 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Feb 2016 16:05:20 +0800
References: <1454309636-18263-1-git-send-email-caoj.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56B06354.4010301@cn.fujitsu.com>
Date: Tue, 2 Feb 2016 16:05:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1454309636-18263-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: D307141896FB.A4E9C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] CCID QOMify
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
X-List-Received-Date: Tue, 02 Feb 2016 08:05:31 -0000

Hi mjt,

     I guess these two are suitable for trivial too;) but I forget to cc 
trivial at first...

On 02/01/2016 02:53 PM, Cao jin wrote:
> As each commit says
>
> Cao jin (2):
>    Emulated CCID card: QOMify
>    Passthru CCID card: QOMify
>
>   hw/usb/ccid-card-emulated.c | 20 +++++++++-----------
>   hw/usb/ccid-card-passthru.c | 10 ++++------
>   hw/usb/ccid.h               |  8 ++++++++
>   3 files changed, 21 insertions(+), 17 deletions(-)
>

-- 
Yours Sincerely,

Cao jin



