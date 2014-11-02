Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xknem-0008Jy-4k
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:24:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xknee-0008Aw-G7
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkneY-0003yJ-9x
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:24:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XkneJ-0003uA-Vl; Sun, 02 Nov 2014 01:24:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EF4E740231;
	Sun,  2 Nov 2014 08:24:22 +0300 (MSK)
Message-ID: <5455C006.3010706@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 08:24:22 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>
References: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>	<1414735861-1232-3-git-send-email-arei.gonglei@huawei.com>	<5455BCE6.5080804@msgid.tls.msk.ru>
	<5455BF5F.3010400@huawei.com>
In-Reply-To: <5455BF5F.3010400@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 2/2] tap: fix possible fd leak
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
X-List-Received-Date: Sun, 02 Nov 2014 05:24:50 -0000

02.11.2014 08:21, Gonglei wrote:
[]
> Agree. v2 will do. Thanks!

Also, I think it's good idea to add " in net_init_tap" to subject.
(And please don't resend both patches, as I already applied first :)

Thanks,

/mjt

