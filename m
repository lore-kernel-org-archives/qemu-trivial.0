Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpcAs-0001n8-7k
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 10:18:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpcAm-0001gJ-7n
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 10:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpcAk-0003c7-Fs
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 10:18:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpcAa-0003WH-OX; Thu, 29 Sep 2016 10:18:40 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B25EF4324A;
	Thu, 29 Sep 2016 17:18:37 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B11FAB0F;
	Thu, 29 Sep 2016 17:18:36 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1474382581-12766-1-git-send-email-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, berto@igalia.com, rth@twiddle.net
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <2d9a1e98-7a8f-3b64-8cbd-779a7bbde6de@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 17:18:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474382581-12766-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] tests: Ignore test executables
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
X-List-Received-Date: Thu, 29 Sep 2016 14:18:56 -0000

20.09.2016 17:43, Eric Blake wrote:
> Commits 9ef8112a and efad6682 introduced new tests, but forgot
> to ignore the built executables from an in-tree build.

Applied, thank you!

/mjt

