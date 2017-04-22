Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1zNg-0008Jp-RN
	for mharc-qemu-trivial@gnu.org; Sat, 22 Apr 2017 14:03:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d1zNe-0008IM-IP
	for qemu-trivial@nongnu.org; Sat, 22 Apr 2017 14:03:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d1zNd-0002Q2-Mv
	for qemu-trivial@nongnu.org; Sat, 22 Apr 2017 14:03:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d1zNX-0002P1-PH; Sat, 22 Apr 2017 14:03:27 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E006041E31;
	Sat, 22 Apr 2017 21:03:26 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id CE7563F8;
	Sat, 22 Apr 2017 21:03:26 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20170308151544.7606-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <2c2be9fe-ecd9-120d-0296-8704442e5f64@msgid.tls.msk.ru>
Date: Sat, 22 Apr 2017 21:03:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170308151544.7606-1-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v2] tests: Ignore more test
 executables
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
X-List-Received-Date: Sat, 22 Apr 2017 18:03:35 -0000

08.03.2017 18:15, Eric Blake wrote:
> Ignore test executables when building in-tree:
> test-arm-mptimer introduced in commit 882fac3
> test-crypto-hmac introduced in commit 4fd460b
> test-aio-multithread introduced in commit 0c330a7

Applied to -trivial, thank you!

/mjt

