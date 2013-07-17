Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UzNAk-0003VV-Jp
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jul 2013 04:33:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UzNAf-0003U1-7h
	for qemu-trivial@nongnu.org; Wed, 17 Jul 2013 04:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UzNAb-0000Hv-3T
	for qemu-trivial@nongnu.org; Wed, 17 Jul 2013 04:33:13 -0400
Received: from thoth.sbs.de ([192.35.17.2]:30997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1UzNAa-0000HW-Ps; Wed, 17 Jul 2013 04:33:09 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id r6H8WvPa013471;
	Wed, 17 Jul 2013 10:32:58 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.40.156])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r6H8Wv28016131;
	Wed, 17 Jul 2013 10:32:57 +0200
Message-ID: <51E656B9.6090600@siemens.com>
Date: Wed, 17 Jul 2013 10:32:57 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
	<51E11A1B.2020503@msgid.tls.msk.ru>
	<CAPyFy2BW9+hLC=7+oxnyiA17Lm484VgaQRz8S-RaV_vv92LoHg@mail.gmail.com>
In-Reply-To: <CAPyFy2BW9+hLC=7+oxnyiA17Lm484VgaQRz8S-RaV_vv92LoHg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.2
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: reorder include to
 fix FreeBSD build failure
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
X-List-Received-Date: Wed, 17 Jul 2013 08:33:17 -0000

On 2013-07-14 00:35, Ed Maste wrote:
> On 13 July 2013 05:12, Michael Tokarev <mjt@tls.msk.ru<mailto:mjt@tls.msk.ru>> wrote:
> Remaining:
> 
> struct mbuf {
>         union M_dat {
>                 char    m_dat_[1]; /* ANSI don't like 0 sized arrays */
>                 char    *m_ext_;
>         } M_dat;
> };
> 
> #define m_dat           M_dat.m_dat_
> #define m_ext           M_dat.m_ext_
> 
> This can be done by using an unnamed union, ie, by omitting
> 
> Yeah, struct mbuf and those #defines date back to the beginning of BSD networking.
> 
> I think we're probably unconcerned with a slirp upstream at this point, so such a change seems reasonable. 

Indeed, they are always welcome. There is no point in tracking upstream
anymore.

> I'm not sure that anonymous union support is universal across all compilers used to build QEMU though - do you know?

No problem, as Peter already said. Please provide an according patch.

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux

