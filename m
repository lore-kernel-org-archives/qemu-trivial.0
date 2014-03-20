Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQfT2-0002vk-Va
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 12:05:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfSv-0002kG-GC
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfSp-0007V8-HX
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:05:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WQfSO-0007Gk-Rt; Thu, 20 Mar 2014 12:04:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B418042A21;
	Thu, 20 Mar 2014 20:04:35 +0400 (MSK)
Message-ID: <532B1193.3040808@msgid.tls.msk.ru>
Date: Thu, 20 Mar 2014 20:04:35 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 00/12] Avoid shifting left into sign
 bit
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
X-List-Received-Date: Thu, 20 Mar 2014 16:05:16 -0000

17.03.2014 20:00, Peter Maydell wrote:
> This is a set of patches which silence clang -fsanitize=undefined
> warnings about shifting left into the sign bit of a signed value.
> Typically this is the result of "1 << 31" and similar constructs;
> the fix is to add a "U" suffix to the 1 so that we do unsigned
> arithmetic rather than signed arithmetic.
> 
> Since these patches are very minor changes to a fairly
> wide ranging set of files, it seems easiest to send these
> through the -trivial queue. Happy to split the series up
> if people disagree.
> 
> Mostly I think these warnings are not particularly exciting
> (even the adversarial optimizations preferred by modern
> compilers will probably not break "1 << 31") but there are
> a lot of them, the fix is pretty trivial, and getting rid of
> them allows us to see the interesting sanitizer warnings more
> clearly.
> 
> My method here has been just to look at the warnings produced
> during a 'make check' run; no doubt actually running a guest
> for various platforms would identify more of these.
> 
> Changes v1->v2:
>  * minor tweak to foreach_apic to merge declaration
>    and initialization of 'mask'
>  * add U suffix to other constants in the same group
>    for consistency, as suggested by mst

Thanks, applied to -trivial, after capitalizing "U" suffix
in 03/12.

/mjt

