Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7M92-0005Tu-Dl
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 04:00:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T7M90-0005Tl-8z
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 03:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T7M8y-0007uJ-SB
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 03:59:58 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:40817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T7M8y-0007u5-Ls
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 03:59:56 -0400
Received: by wibhm2 with SMTP id hm2so921283wib.10
	for <qemu-trivial@nongnu.org>; Fri, 31 Aug 2012 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nzRdqisTcMFDkJn09hmbVHSDF24O0RNtUBgnyMyq1qs=;
	b=RBOMO1DIOKRV4Z7FHVAY8RpBxcyamtnXdcKY3ODX2mMESTzjPb+xwzwgKjB255Efb/
	I7MujoiQNu8jngV6ginzgL9bBJGbNd76NF8aG4/UCA3BbaCe6Mhvk82OzI71nRjZXkzy
	KH/lCA8qZpG54LQDnYqizcaJEIhgxxi8sXIGFZ1nwRlSdJc4V+0sfRnSNfXh4aYTmdRT
	PQAfouDucb+Mbk3Kf5XsbJ/t9vYuP98NqXIGuLJRbzp5bD6Uhqe732FjTYA67K6gc2NS
	/oTTT2dzSuWA5lhkBoTDcnGy5dKs97v4z5pVlYQjs4fghcDXXJjGavqZIRQOrwfV6zzj
	zAsQ==
Received: by 10.216.52.7 with SMTP id d7mr4639167wec.132.1346399995814;
	Fri, 31 Aug 2012 00:59:55 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id fr4sm7711423wib.8.2012.08.31.00.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 00:59:54 -0700 (PDT)
Date: Fri, 31 Aug 2012 07:49:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20120831064931.GA6425@stefanha-thinkpad.localdomain>
References: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH 0/2 v2] Fix static linking for cURL and
	SDL
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
X-List-Received-Date: Fri, 31 Aug 2012 07:59:59 -0000

On Tue, Aug 28, 2012 at 01:01:32AM +0200, Yann E. MORIN wrote:
> Hello All!
> 
> Currently, configure checks for cURL and SDL with either pkg-config (the
> default), or with {curl,sdl}-config (as a fallback).
> 
> But pkg-config and {curl,sdl}-config do not have the same set of options:
>   - to check for shared libs, both use the option: --libs
>   - to check for static libs:
>     - pkg-config uses      : --static --libs
>     - {curl,sdl}-config use: --static-libs
> 
> To add to the complexity, pkg-config is called through the querry_pkg_config
> wrapper, that already passes --static when static linking is required, but 
> there is no such wrapper for {curl,sdl}-config, so we miss the occasion to
> pass --static-libs.
> 
> To fix this:
>   - introduce a new variable QEMU_XXX_CONFIG_LIBS_FLAGS that mirrors the 
>     behavior of QEMU_PKG_CONFIG_FLAGS; this variable can be used by all 
>     xxx-config scripts (eg. curl-config, but later sdl-config too).
>     Default it to '--libs', which is for shared linking;
>   - properly use either --libs for pkg-config (--static is already taken
>     care of in the wrapper), or $QEMU_XXX_CONFIG_LIBS_FLAGS for 
>     {curl,sdl}-config.
> 
> 
> Changes since v1:
>   - drop the spice fix, it is not needed (bad env locally)
>   - drop the added --static to calls to pkg-config, as it's already in the
>     wrapper (Stefan Hajnoczi)

Patch 2's commit message still references "curl" instead of "sdl".

I'd like for one more person to review this and then it can be merged
into qemu.git, rather than through qemu-trivial.

Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>

