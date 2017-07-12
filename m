Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHnT-0006EU-Ns
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:35:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHnQ-0006Ac-KH
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:35:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHnP-0003Xt-LM
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:35:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHnK-0003Tq-7X; Wed, 12 Jul 2017 09:35:10 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0794B40D64;
	Wed, 12 Jul 2017 16:35:06 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 62803ACF;
	Wed, 12 Jul 2017 16:35:05 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20170609152017.7286-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com, armbru@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <1298d3b1-a6d6-499b-323b-b79c6e38bc7b@msgid.tls.msk.ru>
Date: Wed, 12 Jul 2017 16:35:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170609152017.7286-1-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/2] qobject coccinelle followups
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
X-List-Received-Date: Wed, 12 Jul 2017 13:35:17 -0000

09.06.2017 18:20, Eric Blake wrote:
> Inspired by https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg02505.html
> 
> Surprisingly, the updated script didn't find any existing longhand
> use as candidates for QDECREF() (our last such use was cleaned up
> as a side effect, in commit b72fe9e), but it DID find another straggler
> missed in commit 579cf1d1.
> 
> Eric Blake (2):
>   qobject: Update coccinelle script to catch Q{INC,DEC}REF
>   qobject: Catch another straggler for use of qdict_put_str()

Applied to -trivial, thanks!

/mjt

