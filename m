Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2LFv-0002JD-OS
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 13:25:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LFt-0002IH-V4
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LFt-0005KL-94
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:25:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2LFo-0005Iu-Vz; Sun, 23 Apr 2017 13:24:57 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 24AEA41F51;
	Sun, 23 Apr 2017 20:24:56 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 043823F8;
	Sun, 23 Apr 2017 20:24:56 +0300 (MSK)
To: Andreas Grapentin <andreas@grapentin.org>, qemu-devel@nongnu.org
References: <20170314165953.18506-1-andreas@grapentin.org>
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <0d151b9a-46db-b97d-37c8-ccd208190114@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 20:24:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170314165953.18506-1-andreas@grapentin.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] use _Static_assert in
 QEMU_BUILD_BUG_ON
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
X-List-Received-Date: Sun, 23 Apr 2017 17:25:02 -0000

14.03.2017 19:59, Andreas Grapentin wrote:
> QEMU_BUILD_BUG_ON should use C11's _Static_assert, if the compiler supports it,
> to provide more readable messages on failure.
...

Applied to -trivial, with trivial commit comment fix.  Thanks!

/mjt

