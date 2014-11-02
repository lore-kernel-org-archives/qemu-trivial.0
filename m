Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XknDG-0004mL-NX
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 00:56:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknDA-0004c7-8R
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 00:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknD5-0004WM-8i
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 00:56:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XknCv-0004VZ-Bm; Sun, 02 Nov 2014 00:56:05 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3BCFC40231;
	Sun,  2 Nov 2014 07:56:02 +0300 (MSK)
Message-ID: <5455B961.7080303@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 07:56:01 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414724010-1756-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414724010-1756-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] tap_int.h: remove repeating
	macroinstruction
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
X-List-Received-Date: Sun, 02 Nov 2014 04:56:25 -0000

31.10.2014 05:53, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> DEFAULT_NETWORK_SCRIPT and DEFAULT_NETWORK_DOWN_SCRIPT
> have been defined in net/net.h included in
> tap.c, which is the only C file that using those two macro.
> Let's remove the repeating macroinstruction.

Applied (as I noted yesterday), but with slight rename in
$subject - the new subject reads:

  tap_int.h: remove repeating NETWORK_SCRIPT defines

Is that okay with you?

Thanks,

/mjt

