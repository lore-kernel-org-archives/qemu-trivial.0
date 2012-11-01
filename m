Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TTtsY-0007wK-MY
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 08:28:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTtsV-0007mc-Kr
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 08:28:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTtsU-0004vb-Hz
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 08:28:07 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:60522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TTtsR-0004um-K6; Thu, 01 Nov 2012 08:28:03 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so933496bkc.4
	for <multiple recipients>; Thu, 01 Nov 2012 05:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SSrFN3ivYMPd+cztsAnEJyFyaMh6QH9V5/4fmzLdQjk=;
	b=BXe19xYU4OmNIdAp3qmh5Wgm3Xk2Ft+5Rxc7qnIVXqT8ZGqqOL5HcMNtisuAi0o5FR
	iQEJoosx1kfAwpBOJR8Gf6NX9gn+T+tIGC1zqtNzTisl4gkOvjKXnUqaqfzMkE0Arew0
	zDPdwkUzy9TMFWBidfMY4tw8ZYxHOtWAynKJU1ZJqOOE2eoEhyUkGSI8MmdQmFlHlGpr
	z4krl+S3p1b69MjKrg3Q6xP1DmpuLHDc6enHKw+CVrTutmcrk7HBdhRJXW8bd0UCiqJ5
	QwIiv9Qu61W0ihyhRiRsZqzCD9ybEVAvkTLkjoDY/OeydovSzQhGGGOzqOQzDwwupfNF
	fQNw==
Received: by 10.204.147.89 with SMTP id k25mr11933059bkv.127.1351772882414;
	Thu, 01 Nov 2012 05:28:02 -0700 (PDT)
Received: from localhost (188-194-253-244-dynip.superkabel.de.
	[188.194.253.244])
	by mx.google.com with ESMTPS id e3sm5002357bks.7.2012.11.01.05.28.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 05:28:01 -0700 (PDT)
Date: Thu, 1 Nov 2012 13:28:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Message-ID: <20121101122800.GB20508@stefanha-thinkpad.redhat.com>
References: <20121030172039.GN29280@hedwig.ini.cmu.edu>
	<20121031080351.GC1116@stefanha-thinkpad>
	<20121031181538.GC29280@hedwig.ini.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121031181538.GC29280@hedwig.ini.cmu.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, rene@exactcode.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH v2] e1000: pre-initialize RAH/RAL
	registers
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
X-List-Received-Date: Thu, 01 Nov 2012 12:28:09 -0000

On Wed, Oct 31, 2012 at 02:15:39PM -0400, Gabriel L. Somlo wrote:
> Some guest operating systems' drivers (Mac OS X in particular) fail to
> properly initialize the Receive Address registers (probably expecting
> them to be pre-initialized by an earlier component, such as a specific
> proprietary BIOS). This patch pre-initializes the RA registers, allowing
> OS X networking to function properly. Other guest operating systems are
> not affected, and free to (re)initialize these registers during boot.
> 
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> ---
> 
> On Wed, Oct 31, 2012 at 09:03:51AM +0100, Stefan Hajnoczi wrote:
> > Please use 4 space indentation (QEMU coding style).
> 
> My bad, fixed in this version.
> 
> > > +  memmove(&d->mac_reg[RA], &d->conf.macaddr, sizeof(struct MACAddr));
> >
> > When the host is big-endian the filter code will byteswap and the MAC address
> > will not match:
> > 
> >   for (rp = s->mac_reg + RA; rp < s->mac_reg + RA + 32; rp += 2) {
> >       if (!(rp[1] & E1000_RAH_AV))
> >           continue;
> >       ra[0] = cpu_to_le32(rp[0]);
> >       ra[1] = cpu_to_le32(rp[1]);
> >       if (!memcmp(buf, (uint8_t *)ra, 6)) {
> 
> OK, I guess I could just memmove from d->eeprom_data instead of
> d->conf.macaddr.a, on the assumption that pci_e1000_init() already
> did the endian-proofing for me. But probably the safest/most paranoid
> method is best, see below...
> 
> Thanks,
>   Gabriel
> 
>  hw/e1000.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)

Although real hardware doesn't behave like this we can probably get away
with it.  I will test Linux and Windows guests with e1000 for the QEMU
1.3 release - if we run into problems this patch may be reverted.

Thanks, applied to the net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

