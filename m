Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zrhb8-0003bN-E7
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:26:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhb6-0003ZN-BJ
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:26:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhb5-0001Q6-LT
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:26:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zrhb1-0001OO-HU; Thu, 29 Oct 2015 03:26:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B5C342107;
	Thu, 29 Oct 2015 10:25:53 +0300 (MSK)
Message-ID: <5631CA00.9090102@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:25:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1444372921-30909-1-git-send-email-famz@redhat.com>
In-Reply-To: <1444372921-30909-1-git-send-email-famz@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] scripts/text2pod.pl: Escape left brace
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
X-List-Received-Date: Thu, 29 Oct 2015 07:26:09 -0000

09.10.2015 09:42, Fam Zheng wrote:
> Latest perl now deprecates "{" literal in regex and print warnings like
> "unescaped left brace in regex is deprecated".  Add escapes to keep it
> happy.


Applied to -trivial, thank you!

/mjt

