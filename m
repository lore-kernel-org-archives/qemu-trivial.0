Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zri62-000389-Ge
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1Zri60-00037y-Gg
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1Zri5w-0000fE-F6
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:58:04 -0400
Received: from [59.151.112.132] (port=26815 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1Zri5v-0000eV-Ox; Thu, 29 Oct 2015 03:58:00 -0400
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102425957"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2015 16:00:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9T7vEuW008619;
	Thu, 29 Oct 2015 15:57:14 +0800
Received: from [10.167.226.38] (10.167.226.38) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 29 Oct 2015 15:57:48 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5631CE9B.5050409@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5631D17A.4020101@cn.fujitsu.com>
Date: Thu, 29 Oct 2015 15:57:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5631CE9B.5050409@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.38]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] fix bad indentation in
	pcie_cap_slot_write_config()
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
X-List-Received-Date: Thu, 29 Oct 2015 07:58:05 -0000

Thanks Michael. and I am sorry if it bothered you.
Maybe it can be avoid to have a clear definition of "trivial" to direct 
the newbies like me:P

On 10/29/2015 03:45 PM, Michael Tokarev wrote:
> 25.10.2015 11:23, Cao jin wrote:
>> bad indentation conflicts with CODING_STYLE doc
>
> I don't like patches which just change coding style.
> It is often agreed that when you fix some code you
> can also fix indentation of surrounding code, but
> just fixing coding style isn't very productive.
>
> Yet I'm applying this one.  Maybe it is the last
> case like this.. ;)
>
> Thanks,
>
> /mjt
>

-- 
Yours Sincerely,

Cao Jin

