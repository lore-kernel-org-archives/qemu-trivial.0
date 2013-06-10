Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um9uH-0004Qd-U8
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 17:45:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Um9uE-0004Oo-3o
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Um9uC-0000IM-Vo
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:45:38 -0400
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d]:52911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Um9uC-0000I1-Ov
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:45:36 -0400
Received: by mail-la0-f45.google.com with SMTP id fr10so6245601lab.32
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 14:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=qhfTi+VJ0zZ4bJVBrHd4Zcqdrlb399+/PQNmmDY/uiA=;
	b=Gp70j5dMRTdCVSml3NwE4532L9hbTuMbaNKiU6nUxe/kgsuvgBbIIpr2t23tRnB5iv
	ulR/GmilKg24y1zIPhbfODPjbUqE0PkzI/QJOrbJ8BzYbrqqiLIaV5ro4iSIvZ6V0wq0
	Jd3+4NCEKpNhuAnWFcTAC/WmhvUXJ55Gm7osURN95P39mHUAQGt2Aum7D75917onfHbM
	aUYqnWN31nJhPBjDFjGg06XxEpZF37DQXKkI1ycDSGDp9PUYHYk1Nbkg2/uI680S/8oa
	inNcT2GI1FOPMDAoPw8YSduZgKcRtsiQRgyYy5/hMCeWVnsqijxCIfJF2OPTiTdLB5Mc
	uMTg==
X-Received: by 10.152.28.233 with SMTP id e9mr5913064lah.41.1370900735621;
	Mon, 10 Jun 2013 14:45:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.138.200 with HTTP; Mon, 10 Jun 2013 14:45:15 -0700 (PDT)
In-Reply-To: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jun 2013 22:45:15 +0100
Message-ID: <CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnDiOivdrIiQy/Y9NijX8WAuv/9yCOxjO3yCTjQIeuNYfzck87wU1hf3bWmk/LxkgAGyb6A
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22d
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
 explicitly disable virtfs if softmmu=no
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
X-List-Received-Date: Mon, 10 Jun 2013 21:45:40 -0000

On 10 June 2013 21:47, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Or else
>
>  ./configure --disable-system --enable-virtfs
>
> (which makes no sense by its own but does not error out)
> will fail to build, because it will define CONFIG_VIRTFS,
> and the makefile will try to build virtfs-proxy-helper
> manpage (but not the executable).
>
> Cc: qemu-trivial@nongnu.org
> Cc: M. Mohan Kumar <mohan@in.ibm.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  configure |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/configure b/configure
> index a3f0b7a..0ff0380 100755
> --- a/configure
> +++ b/configure
> @@ -3423,6 +3423,8 @@ if test "$softmmu" = yes ; then
>        tools="qemu-ga\$(EXESUF) $tools"
>      fi
>    fi
> +else
> +  virtfs=no
>  fi

This doesn't feel to me like it's quite the right way
to fix this bug. The current code in configure seems
to tangle up (a) was virtfs requested and can we do it?
with (b) what do we need to do if it was? (build some
extra tools) and (c) when does it make sense? not for
linux-user targets. So you end up with an 'else virtfs=no'
clause added in an odd place. If the mess was untangled
then this probably wouldn't be necessary.

Also, disabling building tools and docs in general seems
broken: --disable-tools disables building qemu-img, for
instance, but not its documentation. So maybe we should
fix this by generally making sure we don't build the docs
unless we build the tool as well.

thanks
-- PMM

