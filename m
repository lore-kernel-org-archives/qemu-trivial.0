Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwDyX-0005ax-1v
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 16:58:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDyU-0005Yi-AS
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwDyP-0007ig-FW
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 16:58:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwDyH-0007ea-0q; Sun, 24 Sep 2017 16:57:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2320341C8E;
	Sun, 24 Sep 2017 23:57:48 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 02FFE3C3;
	Sun, 24 Sep 2017 23:57:48 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, lersek@redhat.com,
	qemu-stable@nongnu.org, qemu-block@nongnu.org
References: <20170914134923.2479-1-eblake@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <03356889-9fb0-b22a-62b3-496df0ad71dc@msgid.tls.msk.ru>
Date: Sun, 24 Sep 2017 23:57:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170914134923.2479-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] osdep: Fix ROUND_UP(64-bit, 32-bit)
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
X-List-Received-Date: Sun, 24 Sep 2017 20:58:03 -0000

14.09.2017 16:49, Eric Blake wrote:
> When using bit-wise operations that exploit the power-of-two
> nature of the second argument of ROUND_UP(), we still need to
> ensure that the mask is as wide as the first argument (done
> by using a ternary to force proper arithmetic promotion).
> Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512U) produces 0,
> instead of the intended 2TiB, because negation of an unsigned
> 32-bit quantity followed by widening to 64-bits does not
> sign-extend the mask.
> 
> Broken since its introduction in commit 292c8e50 (v1.5.0).
> Callers that passed the same width type to both macro parameters,
> or that had other code to ensure the first parameter's maximum
> runtime value did not exceed the second parameter's width, are
> unaffected, but I did not audit to see which (if any) existing
> clients of the macro could trigger incorrect behavior (I found
> the bug while adding a new use of the macro).
> 
> While preparing the patch, checkpatch complained about poor
> spacing, so I also fixed that here and in the nearby DIV_ROUND_UP.

Applied to -trivial, thanks!

/mjt

