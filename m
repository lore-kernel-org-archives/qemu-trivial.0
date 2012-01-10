Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rkjcv-0003Qr-Nm
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jan 2012 16:53:05 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Rkjcs-0003Ga-Qv
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2012 16:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Rkjcr-0000mC-Ij
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2012 16:53:02 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Rkjco-0000ln-TT; Tue, 10 Jan 2012 16:52:59 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2BB097280009; Tue, 10 Jan 2012 22:52:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 8DtGqNmivMg9; Tue, 10 Jan 2012 22:52:28 +0100 (CET)
Received: from flocke.weilnetz.de (p54ADA0B6.dip.t-dialin.net [84.173.160.182])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	BBCE67280003; Tue, 10 Jan 2012 22:52:28 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RkjcK-000275-4M; Tue, 10 Jan 2012 22:52:28 +0100
Message-ID: <4F0CB31B.107@weilnetz.de>
Date: Tue, 10 Jan 2012 22:52:27 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Andrzej Zaborowski <balrogg@gmail.com>
References: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
	<20120110083555.GA13145@stefanha-thinkpad.localdomain>
In-Reply-To: <20120110083555.GA13145@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Add 'fall through' comments to case
 statements without break
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
X-List-Received-Date: Tue, 10 Jan 2012 21:53:04 -0000

Am 10.01.2012 09:35, schrieb Stefan Hajnoczi:
> This reminds me of another questionable fall-through:
>
> bt-host.c:bt_host_read():
>
> while (s->len --)
> switch (*pkt ++) {
> ...
> case HCI_SCODATA_PKT:
>   if (s->len < 3)
>    goto bad_pkt;
>
>   pktlen = MIN(pkt[2] + 3, s->len);
>   s->len -= pktlen;
>   pkt += pktlen;
> <--- fall-through or not?
> default:
> bad_pkt:
>   fprintf(stderr, "qemu: bad HCI packet type %02x\n", pkt[-1]);
> }
>
> It seems the code will skip HCI_SCODATA_PKT and report a warning 
> (although type
> pkt[-1] will be incorrect). Any thoughts?
>
> Stefan
>

Hi Andrzej,

I think there should be a break statement at the end of the
HCI_SCODATA_PKT case. Could you please check this?

Regards,
Stefan



