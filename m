Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCHfd-0006gD-CS
	for mharc-qemu-trivial@gnu.org; Tue, 19 Apr 2011 16:37:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCHfa-0006cH-QI
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 16:37:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCHfa-0002sO-1F
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 16:37:10 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:58822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QCHfY-0002s6-0C; Tue, 19 Apr 2011 16:37:08 -0400
Received: by vws17 with SMTP id 17so84386vws.4
	for <multiple recipients>; Tue, 19 Apr 2011 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JiDEA6uh8ZrYsig4bBgznIk1GyE/9kysvnMPPX3YxAc=;
	b=NfWw7erGMsvlloSlSfxTtZ3WPr/lneYhRlQ0oQ9t5tRDfp2E3etD5d3WgQotAHDXBl
	bYgmPdBsved9GzJZfsVHh9xtsLkOnm5wNuqKP444Hw6Be4oe76ciJNGrveJ9Ag0n1PU5
	feCTS7mG6YkwY1cMpvblMVOAhOqGjR8VFrRh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=L4BIeTmfqWggZmYRNSKe11J5IkUnouH4mfUYeVReZBBeI+DU65Dkejt3SkINqYZXwP
	cvHbJNZWTcu2Xs/xlULyPzoHRb4tbKy3kpqWkdGhm+SbGDtgfp4OFJPIJGHNZZ81EEYu
	R5n6wU2h1OytwVmWwaPJ0Mjbw8el+N5nnDnSE=
Received: by 10.52.177.35 with SMTP id cn3mr190777vdc.307.1303245427070; Tue,
	19 Apr 2011 13:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.115.103 with HTTP; Tue, 19 Apr 2011 13:36:47 -0700 (PDT)
In-Reply-To: <BANLkTinvEQJH46DTuJOpADo30SqJ2V=xBg@mail.gmail.com>
References: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
	<BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
	<BANLkTik3bYHBHufOzd1D8SAy7G7RjQVH-A@mail.gmail.com>
	<BANLkTik3Xi_0Std-TXRmDOz=WmxB3YhhXA@mail.gmail.com>
	<BANLkTinvEQJH46DTuJOpADo30SqJ2V=xBg@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Tue, 19 Apr 2011 23:36:47 +0300
Message-ID: <BANLkTi=Rnq-5OPDSEMPHZmjhQXRPLddWxA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Make
 epoll_create1 test work around SPARC glibc bug
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2011 20:37:11 -0000

On Tue, Apr 19, 2011 at 11:16 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 19 April 2011 20:59, Blue Swirl <blauwirbel@gmail.com> wrote:
>> On Tue, Apr 19, 2011 at 10:48 PM, Peter Maydell
>> <peter.maydell@linaro.org> wrote:
>>> On 19 April 2011 20:37, Blue Swirl <blauwirbel@gmail.com> wrote:
>>>> But then epoll would not be used.
>>>
>>> I think that's fine -- on a system which isn't advertising epoll
>>> in its include files we shouldn't be trying to use it. It might
>>> be buggy, or not the same function at all, for instance.
>>>
>>> Anybody who actually cares about epoll can upgrade their libc :-)
>>
>> Maybe epoll is not so interesting as madvise.
>
> Indeed, it isn't; the only reason we check for it in configure is
> so we know whether we can pass through the relevant syscalls for
> linux-user mode. it's a pretty recent innovation so any guest app
> using it should have a fallback path if it gets ENOSYS.
> Incidentally, note that this configure check is for epoll_create1(),
> not epoll_create(). [Some systems have only the former, so it has
> a separate configure check.]
>
> madvise() is used by qemu itself, so we care more there.
>
>> But the check is not very specific, there could be some unrelated
>> warning with the headers.
>
> The check isn't supposed to be very specific; the idea is that it
> does basically what the actual qemu source code does, ie just
> use the function in a program that's compiled with -Werror. If there's
> an unrelated problem with the header that produces a compile
> warning then we also want that to cause the test to fail, because
> that too will cause qemu compilation to fail later.
>
> I think that the ideal for configure tests is that they test
> for exactly the set of functionality used by the program itself;
> that's what I'm trying to do here.
>
>> How about checking in the compiled file for
>> for example EPOLLIN, that should give a clear build failure if the
>> header is missing?
>
> If the header was missing then that would already be causing a
> compilation failure. The issue with this particular version of
> SPARC glibc is that the header is present but doesn't declare the
> function.
>
> Looking for EPOLLIN isn't a useful test for "is epoll_create1()
> present and OK?" because:
> (1) EPOLLIN will be defined on systems which only have epoll_create(),
> so "is EPOLLIN present?" can be true when "is epoll_create1() OK?" is false
> (2) we don't ever actually use EPOLLIN, so checking for it could
> potentially cause us to not use epoll_create1() even if it was
> present and usable

Sorry, I just picked a define without much thought. A more specific
one would be flags parameter of epoll_create1(), like EPOLL_CLOEXEC or
EPOLL_NONBLOCK. We don't use them now since the target system call
argument is passed untranslated to host, but that is actually not
correct, since the bit definitions could be different. So checking for
one of those should be OK.

