Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZcC8k-0006LX-CA
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2015 08:48:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zc9uM-0004VL-KZ
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zc9uL-00056S-Jb
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:25:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zc9uG-000510-E9; Wed, 16 Sep 2015 06:25:40 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D33F541B11;
	Wed, 16 Sep 2015 13:25:30 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id BBCFCA6E;
	Wed, 16 Sep 2015 13:25:30 +0300 (MSK)
Message-ID: <55F9439A.7060703@msgid.tls.msk.ru>
Date: Wed, 16 Sep 2015 13:25:30 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-devel@nongnu.org, 
	crosthwaitepeter@gmail.com, eblake@redhat.com, peter.maydell@linaro.org
References: <1441649201-13839-1-git-send-email-saipava@xilinx.com>
In-Reply-To: <1441649201-13839-1-git-send-email-saipava@xilinx.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
X-Mailman-Approved-At: Wed, 16 Sep 2015 08:48:45 -0400
Cc: Sai Pavan Boddu <saipava@xilinx.com>, edgari@xilinx.com, alistai@xilinx.com
Subject: Re: [Qemu-trivial] [PATCH V4 1/2] sdhci: use PRIx64 for uint64_t
	type
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
X-List-Received-Date: Wed, 16 Sep 2015 10:25:47 -0000

07.09.2015 21:06, Sai Pavan Boddu wrote:
> Fix compile time warnings, because of type mismatch for unsigned long
> long type.

Applied to the trivial-patches tree, thanks!

/mjt

