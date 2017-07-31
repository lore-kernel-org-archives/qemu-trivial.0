Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7kG-00016o-WE
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7kF-00015i-Dj
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7kE-0002gm-Mr
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:16:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42377)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7kA-0002bd-FD; Mon, 31 Jul 2017 06:16:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 75D7542ABB;
	Mon, 31 Jul 2017 13:16:09 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 70B2FB77;
	Mon, 31 Jul 2017 13:16:07 +0300 (MSK)
To: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org
Cc: thuth@redhat.com, gxt@mprc.pku.edu.cn, qemu-devel@nongnu.org
References: <20170728115318.31781-1-otubo@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ffffff7a-5353-305f-134c-521d93c6955f@msgid.tls.msk.ru>
Date: Mon, 31 Jul 2017 13:16:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728115318.31781-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] fix qemu-system-unicore32 crashing when
 calling without -kernel
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
X-List-Received-Date: Mon, 31 Jul 2017 10:16:16 -0000

28.07.2017 14:53, Eduardo Otubo wrote:
> Starting qemu-system-unicore32 without the -kernel parameter results in
> an assert() returns false and aborts qemu. This patch replaces it with a
> proper error message followed by exit(1).

Applied to -trivial, thanks!

/mjt

