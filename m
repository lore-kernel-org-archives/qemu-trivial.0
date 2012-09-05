Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9Bzl-00061g-MV
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 05:34:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9Bze-0005eX-4t
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9Bza-0001bI-2j
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:33:54 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:48162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T9BzM-0001Yh-7G; Wed, 05 Sep 2012 05:33:36 -0400
Received: by weyz53 with SMTP id z53so262904wey.4
	for <multiple recipients>; Wed, 05 Sep 2012 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V0e8hVIduilw/8wudnvi6/Lad8gr5Dyw0u+N5Uknkrs=;
	b=jIMzt0e624yzdWSJBJMI3JH+vx65h+/btRWsthvCH/301cR+SVbyUu9/fYC59y6THx
	N355eKT1GLra0lNZKTMiw02HQoliaF0LgJRsBzUGvFyDBDdWEyH4AhH6fc0HIzWu2rQW
	9WhR7T1wBpm1rvjIJXoLTiF91Ld8KeA+6OXJYu/BC/mj6k+/jBXsxhhiaa7VxbcnuseI
	YOLDgnLO1L3P0zrr8DnFmr+eNWSrjxrmKDbOUxK+WQKaEbx07dThW0BqNg+QakmR6Oe6
	x465ZBggoPoSU3GBEgHfDxiAk3pnaXiaq8Bqu+zrO+f+cs8aSsKZFPewy5yx59JifIgu
	d9Ag==
Received: by 10.216.184.196 with SMTP id s46mr12543084wem.66.1346837615228;
	Wed, 05 Sep 2012 02:33:35 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id cu1sm28150417wib.6.2012.09.05.02.33.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 02:33:33 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:33:32 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20120905093332.GA4786@stefanha-thinkpad.localdomain>
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2 v3] Fix static linking for cURL and
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
X-List-Received-Date: Wed, 05 Sep 2012 09:34:00 -0000

On Sun, Sep 02, 2012 at 03:09:44PM +0200, Yann E. MORIN wrote:
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
>     Default it to '--libs', which is for shared linking.
>   - properly use either --libs for pkg-config (--static is already taken
>     care of in the wrapper), or $QEMU_XXX_CONFIG_LIBS_FLAGS for
>     {curl,sdl}-config.
> 
> 
> Changes since v2:
>   - remove trailing reference to cURL in the SDL patch (Stefan Hajnoczi)
>   - sent to qemu-devel and cc qemu-trivial (Peter Maydell, Stefan)
>   - fix type in the name of the new variable
> 
> Changes since v1:
>   - drop the spice fix, it is not needed (bad env locally)
>   - drop the added --static to calls to pkg-config, as it's already in the
>     wrapper (Stefan Hajnoczi)

Any more discussion around this?

I'm happy with the patches.

Stefan

