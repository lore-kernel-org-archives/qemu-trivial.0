Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOkFt-00057V-62
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 10:42:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOkFq-00056e-AT
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOkFo-00035f-Sj
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:42:38 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOkFo-00035C-M5
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:42:36 -0400
Received: by mail-ot1-x344.google.com with SMTP id 66so2535376otq.0
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 07:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O6m3IXwg6vCfQkt0Baoa8IrX9DyythtztZcrJxNudz8=;
	b=fQGfaOXlnnR9/9VfJ3kGudEozxXcQGSib7oK7AVRt0WH0h2Is5snEjNiWcw5d6gRwG
	DKu9S9oeJANdLqBwRw4BGVfdqm8YAeLN+N5b37HC3mxR4Zf+TXuyPH6bTEzlVD1I5hhA
	yvVh7J4V0gRyELCcqikJAN+hVC0iitJ45yNJVvBgmtLLEazUoWnXxufRBBgjqwzXQ0bN
	/jSiGLpPILIOUP1ojqA4YzEpnF2xmqfV5DqnGs0zGE2NEdC6v3Ndxc0mzqDMirO4Y/aE
	8A9mPGf9egWrLMgPB6/zA1z0HefpEH682H3tIac5p3Y+TwDiGkSb5kBvbjAwGLbheJtR
	SucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O6m3IXwg6vCfQkt0Baoa8IrX9DyythtztZcrJxNudz8=;
	b=gqBCYUeaVA9QlJXsPHtDP5dtTLBYHcKM38lwU2b6PW3R7f5wYojFQ4V0ZUY41M2NyQ
	NqpbDg2M0ShLRwrmNsLXDRMulMqK3eE5tNa4K4h+sEe6nonNf0NB+87ZfOBI6MPHdWkV
	KC2onlhuopGRnl9xFfnj26IOMKRNHTcA+fXjPQ73OuYbPPciklLhmGSlYaHq/1+2quJB
	lv+Nz5Hgro+ybx/WdRDl6L5Rk4EPPaMiV1M1H+m1WPgkip5DaKzROFuvxR4sbYVScAZq
	+pqH90w6daNfQiOJAG3xQvnjVvIhhQYs1vZsnUeEqcui2WOzHVWS4LvYLQjvX9rMEqhP
	kkxg==
X-Gm-Message-State: APjAAAUBJrdWy268nvD0S4w9371EIQVJ7TpPz30mI+5T9SnSkqT1tz29
	qie7L9+0Z81He3qwcmZjMFcFex6TIWPyWT2L35ApKg==
X-Google-Smtp-Source: APXvYqzVlFuSy58r6XomBEhrCKT+r+i9pHkWZ/C3NhK++0FRzdD09Xh0RMXDCbxICZC2BJK0DjG9QGYbfs4pyJ7QS/c=
X-Received: by 2002:a9d:404:: with SMTP id 4mr2755296otc.352.1557412956005;
	Thu, 09 May 2019 07:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190503082728.16485-1-ao2@ao2.it>
	<20190503082728.16485-3-ao2@ao2.it>
	<541bfc5c-0e45-58e6-f0b1-81e9b0c8881d@redhat.com>
In-Reply-To: <541bfc5c-0e45-58e6-f0b1-81e9b0c8881d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 15:42:25 +0100
Message-ID: <CAFEAcA8An-KWOc3gOz2=45eCHCmUJEJw_bTrrCW6bYO23H8TPw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Antonio Ospite <ao2@ao2.it>, QEMU Developers <qemu-devel@nongnu.org>, 
	Antonio Ospite <antonio.ospite@collabora.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] configure: disallow spaces and
 colons in source path and build path
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
X-List-Received-Date: Thu, 09 May 2019 14:42:39 -0000

On Mon, 6 May 2019 at 18:27, Eric Blake <eblake@redhat.com> wrote:
>
> On 5/3/19 3:27 AM, Antonio Ospite wrote:
> > From: Antonio Ospite <antonio.ospite@collabora.com>
> >
> > The configure script breaks when the qemu source directory is in a path
> > containing white spaces, in particular the list of targets is not
> > correctly generated when calling "./configure --help" because of how the
> > default_target_list variable is built.
> >
> > In addition to that, *building* qemu from a directory with spaces breaks
> > some assumptions in the Makefiles, even if the original source path does
> > not contain spaces like in the case of an out-of-tree build, or when
> > symlinks are involved.
> >
> > To avoid these issues, refuse to run the configure script and the
> > Makefile if there are spaces or colons in the source path or the build
> > path, taking as inspiration what the kbuild system in linux does.
> >
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1817345
> >
> > Signed-off-by: Antonio Ospite <antonio.ospite@collabora.com>
> > ---
> >  Makefile  | 4 ++++
> >  configure | 6 ++++++
> >  2 files changed, 10 insertions(+)
> >
>
> > +++ b/Makefile
> > @@ -1,5 +1,9 @@
> >  # Makefile for QEMU.
> >
> > +ifneq ($(words $(subst :, ,$(CURDIR))), 1)
> > +  $(error main directory cannot contain spaces nor colons)
> > +endif
> > +
> >  # Always point to the root of the build tree (needs GNU make).
> >  BUILD_DIR=$(CURDIR)
> >
> > diff --git a/configure b/configure
> > index 9832cbca5c..f7ad4381bd 100755
> > --- a/configure
> > +++ b/configure
> > @@ -279,6 +279,12 @@ ld_has() {
> >  # make source path absolute
> >  source_path=$(cd "$(dirname -- "$0")"; pwd)
> >
> > +if printf "%s\n" "$source_path" | grep -q "[[:space:]:]" ||
> > +  printf "%s\n" "$PWD" | grep -q "[[:space:]:]";
>
> For less typing and fewer processes, you could shorten this to:
>
> if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
>
> but that's trivial enough for a maintainer to fold in if desired.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

What tree is this going to go in via? I suggest the
-trivial tree.

thanks
-- PMM

