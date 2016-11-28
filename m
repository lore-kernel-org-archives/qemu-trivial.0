Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBNn0-0006MX-3f
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 10:24:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bunk@stusta.de>) id 1cBNmx-0006KY-Je
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bunk@stusta.de>) id 1cBNmw-0003xR-Rk
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:24:15 -0500
Received: from welho-filter3.welho.com ([83.102.41.25]:43372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bunk@stusta.de>)
	id 1cBNms-0003uE-Ff; Mon, 28 Nov 2016 10:24:10 -0500
Received: from localhost (localhost [127.0.0.1])
	by welho-filter3.welho.com (Postfix) with ESMTP id 4191E15289;
	Mon, 28 Nov 2016 17:24:08 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
	by localhost (welho-filter3.welho.com [::ffff:83.102.41.25])
	(amavisd-new, port 10024)
	with ESMTP id rRov5NKzdshZ; Mon, 28 Nov 2016 17:24:06 +0200 (EET)
Received: from bunk.spdns.de (82-181-244-249.bb.dnainternet.fi
	[82.181.244.249])
	by welho-smtp3.welho.com (Postfix) with ESMTP id D491A2310;
	Mon, 28 Nov 2016 17:24:06 +0200 (EET)
Date: Mon, 28 Nov 2016 17:24:04 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20161128152404.sywmey4pdcv7btup@bunk.spdns.de>
References: <20161127162817.15144-1-bunk@stusta.de>
	<a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
User-Agent: NeoMutt/ (1.7.0)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 83.102.41.25
Subject: Re: [Qemu-trivial] [PATCH] rules.mak: Use -r instead of -Wl,
 -r to fix building when PIE is default
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
X-List-Received-Date: Mon, 28 Nov 2016 15:24:16 -0000

On Mon, Nov 28, 2016 at 04:05:33PM +0100, Paolo Bonzini wrote:
> 
> 
> On 27/11/2016 17:28, Adrian Bunk wrote:
> > Building qemu fails in distributions where gcc enables PIE
> > by default (e.g. Debian unstable) with:
> > /usr/bin/ld: -r and -pie may not be used together
> > 
> > -r and -pie cannot be used together in the linker,
> > and position independent is already relocatable.
> > 
> > Use -r instead of -Wl,-r to avoid gcc passing -r to the
> > linker when PIE is enabled.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> I think this is a bug in the linker.  If the linker is producing
> relocatable objects by default, it has no reason to refuse -r.  Have you
> tried asking the binutils folks about it too?

The linker knows nothing about this default, gcc is passing -pie
to the linker.

>...
> Paolo
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


