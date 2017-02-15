Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwfX-0002oz-Bq
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:18:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwfU-0002nI-Ht
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwfT-0006hI-E7
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:18:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwfN-0006eM-Uj; Wed, 15 Feb 2017 05:18:30 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C3047421C0;
	Wed, 15 Feb 2017 13:18:29 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 16828264;
	Wed, 15 Feb 2017 13:18:29 +0300 (MSK)
To: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org
References: <20170208170533.28822-1-jsnow@redhat.com>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <88ae6630-7524-fc3c-0e78-4cf95ea8bfcf@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:18:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170208170533.28822-1-jsnow@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] ide: remove undefined behavior in
 ide-test
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
X-List-Received-Date: Wed, 15 Feb 2017 10:18:37 -0000

08.02.2017 20:05, John Snow wrote:
> trivial: initialize the dirty buffer with a random-ish byte.
> Stops valgrind from whining about uninitialized buffers.

Applied to -trivial, thanks!

/mjt

