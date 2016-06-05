Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9SIR-0003iR-7c
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:16:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SIP-0003hM-3w
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:16:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SIN-00061s-5V
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:16:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SIF-00060x-S4; Sun, 05 Jun 2016 03:16:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4E206408D7;
	Sun,  5 Jun 2016 10:16:16 +0300 (MSK)
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5753D1BF.3000905@msgid.tls.msk.ru>
Date: Sun, 5 Jun 2016 10:16:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 00/16] use macro DIV_ROUND_UP instead of
 (((n) + (d) - 1) /(d))
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
X-List-Received-Date: Sun, 05 Jun 2016 07:16:30 -0000

31.05.2016 19:35, Laurent Vivier wrote:
> This patch series is the result of coccinelle
> script scripts/coccinelle/round.coccii, added by the first patch.
> 
> Laurent Vivier (16):
>   coccinelle: use macro DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
>   parallels: Use DIV_ROUND_UP
>   qcow/qcow2: Use DIV_ROUND_UP
>   qed: Use DIV_ROUND_UP
>   block: Use DIV_ROUND_UP
>   crypto: Use DIV_ROUND_UP
>   xen: Use DIV_ROUND_UP
>   audio: Use DIV_ROUND_UP
>   SPICE: Use DIV_ROUND_UP
>   rocker: Use DIV_ROUND_UP
>   usb: Use DIV_ROUND_UP
>   slirp: Use DIV_ROUND_UP
>   linux-user: Use DIV_ROUND_UP
>   pc-bios/s390-ccw: Use DIV_ROUND_UP
>   qemu-timer: Use DIV_ROUND_UP
>   hbitmap: Use DIV_ROUND_UP

Applied all to -trivial, thank you!

/mjt

