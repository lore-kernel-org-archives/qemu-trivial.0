Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XycVu-0007mT-SF
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:20:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycVo-0007h6-2b
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycVh-0002IZ-VY
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:20:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XycVU-0002FE-2Z; Wed, 10 Dec 2014 03:20:24 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C393419A1;
	Wed, 10 Dec 2014 11:20:23 +0300 (MSK)
Message-ID: <54880247.5050508@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:20:23 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] virtio-bus: avoid breaking build when
 open DEBUG switch
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Dec 2014 08:20:50 -0000

Applied to -trivial as is, for now, since
the fixes are necessary anyway.  Good suggestion
by Stefan, to turn it into constant-depending
always-compilable code stands, but it is not
a show-stopper for the actual fix.

Thanks,

/mnt

