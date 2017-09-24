Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwE0f-0007KR-Ua
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:00:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE0d-0007In-Rv
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE0d-0000Hf-20
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:00:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwE0M-0008SJ-0v; Sun, 24 Sep 2017 16:59:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 48DDC41C78;
	Sun, 24 Sep 2017 23:59:57 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 328163C3;
	Sun, 24 Sep 2017 23:59:57 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Network Block Dev..." <qemu-block@nongnu.org>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20170918214649.17550-1-eblake@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <3417f4a3-9c6d-ea87-a5c5-48cad9caa413@msgid.tls.msk.ru>
Date: Sun, 24 Sep 2017 23:59:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170918214649.17550-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] nbd-client: Use correct macro
 parenthesization
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
X-List-Received-Date: Sun, 24 Sep 2017 21:00:16 -0000

19.09.2017 00:46, Eric Blake wrote:
> If 'bs' is a complex expression, we were only casting the front half
> rather than the full expression.  Luckily, none of the callers were
> passing bad arguments, but it's better to be robust up front.

Applied to -trivial.

/mjt

