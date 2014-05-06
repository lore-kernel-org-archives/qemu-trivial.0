Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Whgl4-0002ud-Vk
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 10:54:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Whgkx-0002kH-BR
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 10:54:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Whgko-000370-Kc
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 10:54:07 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:59769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Whgko-00036Q-Ca
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 10:53:58 -0400
Received: by mail-lb0-f177.google.com with SMTP id s7so362208lbd.36
	for <qemu-trivial@nongnu.org>; Tue, 06 May 2014 07:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uxCjJ0pwS8Sm00ILU7X6GOHEbC9wQ04hY/xtqDKkolI=;
	b=UmQgXDOfRGd1ygyuuu8rBR/ls2e9mL4+G3BMms4N+uxD8cU9ILSUoYXlEAdNDHi/c5
	X66YzJrY7DFS2E2NQkt8llU7XNDpQcanmeuHcV0TWfdC8evoO4qudf/bVDQKaIUanseA
	fwlXE9zw4VbAW52NGsTeJdwSJH5yHdZ22WwvJwQ0Mh3D/h5xPdRkA4WWy6iG4kjQGqND
	+x4n51fc36Mez1e5aj0O+0AYrshl7IGNNOKoVPwVwl3S/a8/rAQPJV3HFTxLaTOEU1Rj
	Br+cnqVWDclpDDRGvfFuSquPhf5IicND99GbapmcuTaNYcLuuTsavrIXAYrxRhGayBeG
	cL7w==
X-Gm-Message-State: ALoCoQk63ncjh0LlcJBsN6Zc0cRO7RMUAtahMPXERB5trlo64e3h7DbBHlzCDJSCe9YTjndWN+xh
X-Received: by 10.112.17.102 with SMTP id n6mr8696458lbd.39.1399388036911;
	Tue, 06 May 2014 07:53:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Tue, 6 May 2014 07:53:35 -0700 (PDT)
In-Reply-To: <5368F36B.3040804@redhat.com>
References: <1399382220-14874-1-git-send-email-peter.maydell@linaro.org>
	<5368F36B.3040804@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 May 2014 15:53:35 +0100
Message-ID: <CAFEAcA_muHezDUmdcvkEqp0pFmCBJ55kUXrSZkuUv05vxpJybw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Don Slutz <dslutz@verizon.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Put tempfiles in
 subdir so we can clean up libtool files
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
X-List-Received-Date: Tue, 06 May 2014 14:54:13 -0000

On 6 May 2014 15:36, Eric Blake <eblake@redhat.com> wrote:
> mktemp is not POSIX.  BSD mktemp lacks -t:
>
> http://www.freebsd.org/cgi/man.cgi?query=mktemp&apropos=0&sektion=1&manpath=Red+Hat+Linux%2Fi386+9&format=html

Sigh.

> and there are probably systems that lack mktemp(1) altogether.  You'll
> need to come up with a more portable alternative.
>
> Here's what autoconf recommends (modify to fit...):
>
> # Create a (secure) tmp directory for tmp files.
>
> {
>   tmp=`(umask 077 && mktemp -d "./confXXXXXX") 2>/dev/null` &&
>   test -d "$tmp"
> }  ||
> {
>   tmp=./conf$$-$RANDOM
>   (umask 077 && mkdir "$tmp")
> } || as_fn_error $? "cannot create a temporary directory in ." "$LINENO" 5
> ac_tmp=$tmp

Yuck.

> The use of $$ and $RANDOM is safe (even on shells that lack $RANDOM)
> because of the fact that mkdir is atomic and the umask is correctly set
> prior to the mkdir.

I dislike the use of $RANDOM, because it means we behave
inconsistently. If it's OK for $RANDOM to expand to "" then we
should just not use it at all, because that's OK and the same
everywhere.

Similarly, if it's OK not to use mktemp on some systems,
we should use the same non-mktemp code everywhere.

We could sidestep this rubbish by not trying to put our temp
files in /tmp/, and instead just put them in the build directory
(ie ./conf-temps/ or something similar, which we blow away
and recreate every time).

thanks
-- PMM

