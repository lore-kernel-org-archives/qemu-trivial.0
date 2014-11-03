Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlGjh-00066Z-1q
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 07:27:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhugh.fnst@cn.fujitsu.com>) id 1XlG3j-0000TN-1X
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:44:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhugh.fnst@cn.fujitsu.com>) id 1XlG3c-0006RI-Sn
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:44:30 -0500
Received: from [59.151.112.132] (port=62589 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhugh.fnst@cn.fujitsu.com>)
	id 1XlG3P-0006Nl-MP; Mon, 03 Nov 2014 06:44:12 -0500
X-IronPort-AV: E=Sophos;i="5.04,840,1406563200"; d="scan'208";a="42757733"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Nov 2014 19:40:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sA3BhtvV020287;
	Mon, 3 Nov 2014 19:43:55 +0800
Received: from [10.167.226.252] (10.167.226.252) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Nov 2014 19:44:07 +0800
Message-ID: <1415015003.8216.2.camel@G08FNSTD140041>
From: Zhu Guihua <zhugh.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 3 Nov 2014 19:43:23 +0800
In-Reply-To: <54574474.30209@msgid.tls.msk.ru>
References: <1414993894-17539-1-git-send-email-zhugh.fnst@cn.fujitsu.com>
	<54574474.30209@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.2 (3.10.2-2.fc20) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Mon, 03 Nov 2014 07:27:50 -0500
Cc: qemu-trivial <qemu-trivial@nongnu.org>, imammedo@redhat.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] icc_bus: rename ICC_BRIGDE to ICC_BRIDGE
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
X-List-Received-Date: Mon, 03 Nov 2014 11:44:37 -0000

On Mon, 2014-11-03 at 12:01 +0300, Michael Tokarev wrote:
> 03.11.2014 08:51, Zhu Guihua wrote:
> > Rename ICC_BRIGDE for better readability.
> 
> That's a good one... :)  Applied to -trivial, thank you!
> 

For Igor's opinion, it is better to change the subject.
So should I send v2 to fix this?

Regards,
Zhu

> /mjt



