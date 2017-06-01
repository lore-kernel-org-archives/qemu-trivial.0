Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGN8g-00042T-D8
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 06:15:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGN8e-00040e-ST
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 06:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGN8e-0002xL-9P
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 06:15:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dGN8Z-0002tW-De; Thu, 01 Jun 2017 06:15:27 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 397E040122;
	Thu,  1 Jun 2017 13:15:26 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0E96C5DA;
	Thu,  1 Jun 2017 13:15:26 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170503223846.6559-1-marcandre.lureau@redhat.com>
	<20170503223846.6559-6-marcandre.lureau@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ce17b7e5-3301-05a5-7cc2-a242245c949b@msgid.tls.msk.ru>
Date: Thu, 1 Jun 2017 13:15:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170503223846.6559-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v5 5/5] dump: fix memory_mapping_filter
 leak
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
X-List-Received-Date: Thu, 01 Jun 2017 10:15:33 -0000

04.05.2017 01:38, Marc-Andr=C3=A9 Lureau wrote:
> Spotted by ASAN.

Applied to -trivial. Thanks!

/mjt

