Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8T0l-00088B-Hs
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 05:32:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T8T0d-0007mf-Ut
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 05:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T8T0Y-000227-94
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 05:31:55 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:37395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T8T0I-0001zw-Ut; Mon, 03 Sep 2012 05:31:35 -0400
Received: by lbbgm13 with SMTP id gm13so2166306lbb.4
	for <multiple recipients>; Mon, 03 Sep 2012 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=npHt7ekmQtZdxXqpvexWrcDUomxcVGu73Nw/1LzYIuI=;
	b=d0p6sFvTKqyLyX4NFcBlnEujzEr9z28BUM1M3CqfW9zUtUj4YzVyHKSGHbLpQF/IUn
	fMjd+gFvt2LScI3t1S83eQLsLWs+FLBZz4ArYPPPshsA7kaSVJcn6Aw4CUnzvpFtjkY2
	56TiIzuaA2G/kFCQHAcVQ8+tVest2fWuEx8JNppfU8eNrfRaj5YZ9GNR+phwVkttB/Hk
	jdIkXr41SXIWlLuNqyI74+50dAcb4EM5l4Ll/3vxrehrlGpZsxe4xvBRTmFwHZOFAYuK
	GxyMcIXeppe17S75FfZ5cpLcsjtboV0MmkkpFkKiMnA+lPR3aUrDJXHEC1vt242lUtjR
	+NZA==
MIME-Version: 1.0
Received: by 10.152.106.139 with SMTP id gu11mr13300461lab.57.1346664692972;
	Mon, 03 Sep 2012 02:31:32 -0700 (PDT)
Received: by 10.112.99.129 with HTTP; Mon, 3 Sep 2012 02:31:32 -0700 (PDT)
In-Reply-To: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
Date: Mon, 3 Sep 2012 10:31:32 +0100
Message-ID: <CAJSP0QVzLzrnCAV=6cTkG3yz1B=yX9c0WvgVSG2m9XP=FCCSDA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
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
X-List-Received-Date: Mon, 03 Sep 2012 09:32:02 -0000

On Sun, Sep 2, 2012 at 2:09 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
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

Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>

