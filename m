Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdlv-00071y-RT
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 12:01:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdls-0006zM-Ib
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdlo-00061C-H4
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:01:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpdle-0005vY-Ts; Thu, 29 Sep 2016 12:01:03 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C6DCC4325E;
	Thu, 29 Sep 2016 19:00:59 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 9F1B2B0F;
	Thu, 29 Sep 2016 19:00:58 +0300 (MSK)
To: David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org
References: <1475107128-5101-1-git-send-email-david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <36b65209-a6fb-7eb6-0408-f59ec22e5281@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 19:00:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475107128-5101-1-git-send-email-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Update .gitignore
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
X-List-Received-Date: Thu, 29 Sep 2016 16:01:17 -0000

29.09.2016 02:58, David Gibson wrote:
> This adds one generated header, and a couple of testcase binaries to the
> .gitignore files, which haven't yet been included.

Other people already spotted these omissions in .gitignore.
Thank you!

/mjt

