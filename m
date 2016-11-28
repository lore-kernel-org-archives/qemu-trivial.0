Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBRLB-0003Nw-7E
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 14:11:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bunk@stusta.de>) id 1cBRL8-0003LU-Bb
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 14:11:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bunk@stusta.de>) id 1cBRL7-0002eY-MZ
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 14:11:46 -0500
Received: from welho-filter2.welho.com ([83.102.41.24]:47076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bunk@stusta.de>)
	id 1cBRL2-0002LM-Ac; Mon, 28 Nov 2016 14:11:40 -0500
Received: from localhost (localhost [127.0.0.1])
	by welho-filter2.welho.com (Postfix) with ESMTP id 0249D13D1C;
	Mon, 28 Nov 2016 21:11:09 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp2.welho.com ([IPv6:::ffff:83.102.41.85])
	by localhost (welho-filter2.welho.com [::ffff:83.102.41.24])
	(amavisd-new, port 10024)
	with ESMTP id p2s-J5kue_Tp; Mon, 28 Nov 2016 21:11:08 +0200 (EET)
Received: from bunk.spdns.de (82-181-244-249.bb.dnainternet.fi
	[82.181.244.249])
	by welho-smtp2.welho.com (Postfix) with ESMTP id 722A621C;
	Mon, 28 Nov 2016 21:11:08 +0200 (EET)
Date: Mon, 28 Nov 2016 21:11:05 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20161128191105.wnkxrbs6pxm3usxm@bunk.spdns.de>
References: <20161127162817.15144-1-bunk@stusta.de>
	<a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
	<20161128152404.sywmey4pdcv7btup@bunk.spdns.de>
	<36ee35dd-49ea-f2e3-fa1e-600483b9d4e7@redhat.com>
	<460f994a-fe47-1d1e-0d26-1220d8a05256@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <460f994a-fe47-1d1e-0d26-1220d8a05256@redhat.com>
User-Agent: NeoMutt/ (1.7.0)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 83.102.41.24
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
X-List-Received-Date: Mon, 28 Nov 2016 19:11:47 -0000

On Mon, Nov 28, 2016 at 04:42:54PM +0100, Paolo Bonzini wrote:
> 
> Aha, I looked at GCC source code and this is incorrect: "Use -r instead
> of -Wl,-r to avoid gcc passing -r to the linker when PIE is enabled".
> When GCC sees -r (as opposed to -Wl,-r) it does not pass -pie to the linker.

That's what I get for writing things I did not double-check myself...

You are correct here (with the implication that my patch does change
behaviour even less).

> Paolo

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


