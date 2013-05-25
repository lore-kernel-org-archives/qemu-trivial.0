Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgCgC-0006Wt-2X
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 07:30:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UgCg7-0006Pk-GE
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UgCg4-0000e6-2l
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:30:27 -0400
Received: from mail-oa0-f50.google.com ([209.85.219.50]:42793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1UgCfv-0000br-Kl; Sat, 25 May 2013 07:30:15 -0400
Received: by mail-oa0-f50.google.com with SMTP id l20so7216479oag.37
	for <multiple recipients>; Sat, 25 May 2013 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=F+v+A11W/gog6TX8GGuw4HH6ccSKR6IguqqO3RQFgPc=;
	b=RMeyGg6ZPch3AifmXYj34EjTZIUiFTmiyTvxtcyitZlJB14yDpFYxA0uuj1MZIHZmk
	jq7L2LfmLvHl4sur7K74kxdGlh8bt49tsRogjp6vsqGYZB0OqukwAWTD9QkUAEfL/qSl
	tvf3hT1gzie3O2CqL9tARDACNgIbddB7xdrob7/BXgJhxWa7mPO8nDm7Z/iM0rRO0t3l
	4GST+FIw9XcQVvD+ZdvF2at/D+vFxjef8vCV6aIdKB/q5GbOdsjFqzw4TBaBxT3KunY7
	sMi2dv1736LU1eyZdZOENpaQpAgJZoyPSSURyEo/FoeJ8BZh9Ojo9jK/QIfYgwOxoTxE
	83jA==
MIME-Version: 1.0
X-Received: by 10.60.92.230 with SMTP id cp6mr14169974oeb.91.1369481414637;
	Sat, 25 May 2013 04:30:14 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.60.149.194 with HTTP; Sat, 25 May 2013 04:30:14 -0700 (PDT)
In-Reply-To: <51A03D24.5010306@msgid.tls.msk.ru>
References: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
	<51A03D24.5010306@msgid.tls.msk.ru>
Date: Sat, 25 May 2013 07:30:14 -0400
X-Google-Sender-Auth: NajJVIoHNDzAhEfOKTnwZzLK9-c
Message-ID: <CAPyFy2CJW4tnCJqARiddyi-b1uW6KCi6g4d_WgwEaPc5fX5f=Q@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.50
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: try pkg-config
 ncurses first
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
X-List-Received-Date: Sat, 25 May 2013 11:30:31 -0000

On 25 May 2013 00:25, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 25.05.2013 00:07, Ed Maste wrote:
>> When probing for ncurses, try pkg-config first rather than after
>> explicit -lncurses and -lcurses.  This fixes static linking in the case
>> that ncurses has additional dependencies, such as -ltinfo (as on FreeBSD).
>
> This is not a FreeBSD-specific thing, this is the way how current
> ncurses works -- they separated a bunch of functions into a new
> library, libtinfo.

Right, I don't mean to apply it was FreeBSD-specific.

Presumably QEMU builds with --static on at least some Linux distros,
so I assumed they must not have the external libtinfo dep for static
linking (because they build libncurses.a with it built-in, say).

> But this is interesting.
>
> I'm not sure I agree with this approach.  When we're building using
> shared library, libncurses.so already links with libtinfo.so, so we
> don't need to link executable itself with libtinfo.so, since executable
> itself uses none of its functions.

Right, and pkg-config doesn't include -ltinfo when using dynamic linking.

> On the other hand, the current logic appears to be fine, -- we first
> link with just -lncurses, and if that fails, we also try pkg-config --libs --
> because, maybe, we're linking statically and in that case, additional
> libs from pkg-config may help.

Except that the test snippet in configure will successfully link
statically without -ltinfo, so configure doesn't make it to the
pkg-config test.

> From yet another point of view, we may use --as-needed linker flag
> and just ignore all the above.
>
> Here, it is interesting to note that pkg-config does not actually do
> the right thing in this case.  Because practically, it should have
> one extra flag, something like --static-libs (or --libs --static),
> and it should actually be different from plain --libs.

In fact, it does:

feynman% pkg-config --libs ncurses
-L/usr/local/lib -lncurses
feynman% pkg-config --static --libs ncurses
-L/usr/local/lib -lncurses -ltinfo

and the configure script adds --static to QEMU_PKG_CONFIG_FLAGS when necessary.

