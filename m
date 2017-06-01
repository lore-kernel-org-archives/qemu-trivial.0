Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGMmd-0001Dw-9Q
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 05:52:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMmb-0001BQ-Ac
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMma-00039N-Q1
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:52:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50605)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dGMmU-00033e-Q5; Thu, 01 Jun 2017 05:52:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E265940122;
	Thu,  1 Jun 2017 12:52:37 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id C41EC5DA;
	Thu,  1 Jun 2017 12:52:37 +0300 (MSK)
To: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org
References: <20170531192836.7187-1-jsnow@redhat.com>
Cc: thuth@redhat.com, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <2a260806-0b89-7e09-c05f-bd6f2097d15d@msgid.tls.msk.ru>
Date: Thu, 1 Jun 2017 12:52:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170531192836.7187-1-jsnow@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] ide-test: check return of fwrite
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
X-List-Received-Date: Thu, 01 Jun 2017 09:52:46 -0000

31.05.2017 22:28, John Snow wrote:
> To quiet patchew, add an assert for fwrite's return value.

Applied to -trivial, thanks!

/mjt

