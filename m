Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1arxTz-0001Jl-CY
	for mharc-qemu-trivial@gnu.org; Sun, 17 Apr 2016 20:56:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1arxTw-0001Ek-UV
	for qemu-trivial@nongnu.org; Sun, 17 Apr 2016 20:56:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1arxTw-000050-4E
	for qemu-trivial@nongnu.org; Sun, 17 Apr 2016 20:56:04 -0400
Received: from [59.151.112.132] (port=1819 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1arxTq-0008Vy-6o; Sun, 17 Apr 2016 20:55:59 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5679675"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Apr 2016 08:55:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 71C6142B55E5;
	Mon, 18 Apr 2016 08:55:49 +0800 (CST)
Received: from [10.167.225.55] (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Mon, 18 Apr 2016 08:55:49 +0800
Message-ID: <5714314C.8050304@cn.fujitsu.com>
Date: Mon, 18 Apr 2016 08:58:52 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Max Reitz <mreitz@redhat.com>, qemu devel <qemu-devel@nongnu.org>, qemu
	trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, Stefan
	Hajnoczi <stefanha@redhat.com>
CC: Wen Congyang <wency@cn.fujitsu.com>, Alberto Garcia <berto@igalia.com>
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<1460699173-31401-3-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<5712B87C.5070908@redhat.com>
In-Reply-To: <5712B87C.5070908@redhat.com>
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 71C6142B55E5.A8913
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH v1 2/2] block: remove redundant stats of
 block_acct_start()
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
X-List-Received-Date: Mon, 18 Apr 2016 00:56:05 -0000

On 04/17/2016 06:11 AM, Max Reitz wrote:
> I'd like to say that my inertia is keeping me from applying this patch,
> but I'd feel like a hypocrite for saying that, considering it would have
> taken much less time than writing this response...

Pls feel free to ignore this patch, i just went through kevin's patch 
"qemu-io: Support 'aio_write -z'", and found the first parameter of 
block_acct_start() is never used ...



