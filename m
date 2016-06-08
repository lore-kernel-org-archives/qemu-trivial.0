Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAbAk-0002i3-Re
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 06:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAbAi-0002h2-N3
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAbAh-0001HO-TH
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:57:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bAbAc-0001Gb-KS; Wed, 08 Jun 2016 06:57:10 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E46ED40CC9;
	Wed,  8 Jun 2016 13:57:06 +0300 (MSK)
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <1465383288-7021-1-git-send-email-berto@igalia.com>
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5757FA02.7010005@msgid.tls.msk.ru>
Date: Wed, 8 Jun 2016 13:57:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465383288-7021-1-git-send-email-berto@igalia.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] docs: Fix description of the leaky
 bucket algorithm in throttle.txt
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
X-List-Received-Date: Wed, 08 Jun 2016 10:57:17 -0000

08.06.2016 13:54, Alberto Garcia wrote:
> Commit 0bab0ebb17759c926bd48fd396bd8cbb2c8e4a3e was supposed to fix
> a mistake in the description of the leaky bucket algorithm, but the
> version that finally landed after the review process was incorrect.
> 
> This patch solves that problem and hopefully clarifies the description
> a bit better.

Applied to -trivial queue, thank you!

/mjt

