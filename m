Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2DZb-0001mO-6l
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 05:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2DZZ-0001lb-MQ
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:12:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2DZZ-0004IE-1E
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:12:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2DZT-0004HP-0k; Sun, 23 Apr 2017 05:12:43 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 067A841F16;
	Sun, 23 Apr 2017 12:12:42 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E5C823F8;
	Sun, 23 Apr 2017 12:12:41 +0300 (MSK)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170317021739.16877-1-famz@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <685f6fac-86c4-e4ff-f2a4-48a9f62193d9@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 12:12:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170317021739.16877-1-famz@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] block: Make 'replication_state' an enum
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
X-List-Received-Date: Sun, 23 Apr 2017 09:12:50 -0000

17.03.2017 05:17, Fam Zheng wrote:
> BDRVReplicationState.replication_state is a name with a bit of
> duplication, plus it could be an enum like BDRVReplicationState.mode,
> which is be more readable and also more straightforward in a debuuger.

Applied to trivial (with comment fixup), thanks!

/mjt

