Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2LAq-000167-Pe
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 13:19:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LAm-000158-Ay
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:19:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LAl-00040n-GU
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:19:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2LAh-000405-5d; Sun, 23 Apr 2017 13:19:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6A16041F51;
	Sun, 23 Apr 2017 20:19:38 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4B6AC3F8;
	Sun, 23 Apr 2017 20:19:38 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, wangguang <wang.guang55@zte.com.cn>,
	qemu-devel@nongnu.org, qemu-trivial <qemu-trivial@nongnu.org>
References: <1490060356096-474442.post@n7.nabble.com>
	<0268b783-e9fb-8c16-8198-c0bb4e6ca9d3@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <334e7a40-4e4f-c743-7d9e-ca2366effff3@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 20:19:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <0268b783-e9fb-8c16-8198-c0bb4e6ca9d3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v5]COLO:Fix spell error in Colo doc
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
X-List-Received-Date: Sun, 23 Apr 2017 17:19:48 -0000

21.03.2017 04:53, Eric Blake wrote:
> On 03/20/2017 08:39 PM, wangguang wrote:
>> Subject: [PATCH]COLO:Fix spell error in Colo doc
> 
> I added qemu-trivial in v4; you should keep it in the loop.
> 
> Still missing a space after ':' in the subject line, and still the
> awkward duplication of the subject line in the body of the commit message.
...

As Zhang Chen pointed out in the original patch submission,
this patch isn't really needed since the command is actually
different, and he'll update the doc later.

Thanks,

/mjt

