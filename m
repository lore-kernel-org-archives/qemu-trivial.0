Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZriZk-00086K-0v
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 04:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZriZh-00082Q-M1
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 04:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZriZe-0008FD-9W
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 04:28:45 -0400
Received: from [59.151.112.132] (port=28660 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZriZd-0008Ck-UF; Thu, 29 Oct 2015 04:28:42 -0400
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102427428"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2015 16:30:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9T8S5oN010836;
	Thu, 29 Oct 2015 16:28:05 +0800
Received: from [10.167.226.38] (10.167.226.38) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 29 Oct 2015 16:28:38 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5631CE9B.5050409@msgid.tls.msk.ru> <5631D17A.4020101@cn.fujitsu.com>
	<5631D3D5.7080105@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5631D8B3.1020104@cn.fujitsu.com>
Date: Thu, 29 Oct 2015 16:28:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5631D3D5.7080105@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.38]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>
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
X-List-Received-Date: Thu, 29 Oct 2015 08:28:46 -0000



On 10/29/2015 04:07 PM, Michael Tokarev wrote:

> It is a general common sense maybe, I dunno.  There's lot of code which does not
> comply with the coding styles, and at the very least, when you change just that
> without actually changing the code, git blame stops working, showing your non-
> change for everything instead of showing actual _code_ changes.  That's one of
> the reasons why all qemu codebase hasn't been translated by some automatic
> coding style formatting tool.
>

I see. Thanks for sharing the thing about "git blame", I do not know 
this before:)

> Thanks,
>
> /mjt
>

-- 
Yours Sincerely,

Cao Jin

