Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsP73-0001pw-Lh
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 04:03:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsP6y-0001mc-6S
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 04:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsP6u-0003Rw-Cq
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 04:03:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsP6n-0003Kx-0e; Thu, 14 Sep 2017 04:02:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 234AB412CF;
	Thu, 14 Sep 2017 11:02:48 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id F12645B9;
	Thu, 14 Sep 2017 11:02:45 +0300 (MSK)
To: Liang Yan <lyan@suse.com>, sstabellini@kernel.org,
	anthony.perard@citrix.com
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
References: <20170823152736.21814-1-lyan@suse.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <27ab4e98-1b7a-e944-cf2a-ef6dad426ea4@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 11:02:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170823152736.21814-1-lyan@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] hw/display/xenfb.c: Add
 trace_xenfb_key_event
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
X-List-Received-Date: Thu, 14 Sep 2017 08:03:04 -0000

23.08.2017 18:27, Liang Yan wrote:
> It may be better to add a trace event to monitor the last moment of
> a key event from QEMU to guest VM

The patch looks okay, hopefully it is also useful - I haven't dealt with
xen and with keys it sends to a guest :)

Applied to -trivial, thanks!

/mjt

