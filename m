Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvOQo-0006oQ-GM
	for mharc-qemu-trivial@gnu.org; Sat, 15 Oct 2016 08:51:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvOQm-0006n5-Mi
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvOQl-000108-UG
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:51:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bvOQf-0000we-Nv; Sat, 15 Oct 2016 08:51:09 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C192441D00;
	Sat, 15 Oct 2016 15:51:05 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id D82B7B2A;
	Sat, 15 Oct 2016 15:51:04 +0300 (MSK)
To: Michael Walle <michael@walle.cc>, qemu-devel@nongnu.org
References: <1476438710-9226-1-git-send-email-michael@walle.cc>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <16cc0f52-5ff7-ba72-e672-9b2de7c6bea1@msgid.tls.msk.ru>
Date: Sat, 15 Oct 2016 15:51:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476438710-9226-1-git-send-email-michael@walle.cc>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] milkymist-pfpu: fix potential integer
 overflow
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
X-List-Received-Date: Sat, 15 Oct 2016 12:51:17 -0000

14.10.2016 12:51, Michael Walle wrote:
> Since the lm32 is a 32 bit architecture, just return a 32 bit value which
> is then converted to a 64 bit value.
>
> Spotted by coverity, CID 1005506.

Applied to -trivial, thank you!

/mjt

