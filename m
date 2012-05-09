Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SS8C7-0008Gb-2b
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2012 10:48:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SS8Bx-00084P-H7
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:48:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SS8Bq-0002jE-Sg
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:48:37 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:58619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SS8Bq-0002gh-Lt
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:48:30 -0400
Received: by werf3 with SMTP id f3so292649wer.4
	for <qemu-trivial@nongnu.org>; Wed, 09 May 2012 07:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=UOPhtAQ2ZFuZAcd+we/K9jPytbIFQwCgktc2fFizB1I=;
	b=KHgU14TxZgk7NjT2YDP81Ge5JV9AqhxYXAkrnI74tFCAsQ8Hiu8hMZ+PZUadrBoQ4x
	HNuhthOVw9RtvisRB7+egMKIUapKyvnDeTFAXw3ta3LKQ7iYqeaHHjzy9T9b0aeLBNhe
	S8JBWGwYYayqZAURp8QhMYReKRvIMssAGsynUweGR1EGkqeZI8jvlEGbwuD3E2l1jstt
	1LFwYOaPOyrUtFkOQnRKLtg3eTpqvnAWtcgX3XPIH28Gnpv2+HtICXarBxLE2g2d+H26
	tsVgSx3JIU8xFgIogd+cUr/Wx76wp2k/SArXfL6qUy2WoEgHzIBXARLGGgYrvfLQigmI
	6R9g==
MIME-Version: 1.0
Received: by 10.50.188.138 with SMTP id ga10mr185083igc.51.1336574907713; Wed,
	09 May 2012 07:48:27 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Wed, 9 May 2012 07:48:27 -0700 (PDT)
In-Reply-To: <87y5p1wh42.fsf@rho.meyering.net>
References: <87y5p1wh42.fsf@rho.meyering.net>
Date: Wed, 9 May 2012 15:48:27 +0100
Message-ID: <CAFEAcA8-piOQNSZ_r9Rd7_-2UjBYnZm+cAu9WHo-nYbMCLO0Sg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Jim Meyering <jim@meyering.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkdzgYIiBKTIZji/gsonm20lbUZszEsyfhuAB+qzZEAQQ4MFfSZBU0KzF/pcceoxiWc+Q9A
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix some common typos
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
X-List-Received-Date: Wed, 09 May 2012 14:48:46 -0000

On 9 May 2012 15:42, Jim Meyering <jim@meyering.net> wrote:
>
> These were identified using: http://github.com/lyda/misspell-check
> which I ran like this to create a bourne shell script using GNU sed's
> -i option:
>
> git ls-files|grep -vF .bin | misspellings -f - |grep -v '^ERROR:' |perl \
> -pe 's/^(.*?)\[(\d+)\]: (\w+) -> "(.*?)"$/sed -i '\''${2}s!$3!$4!'\'' $1/=
'
>
> Manually eliding the FP, "rela->real" and resolving "addres" to
> address (not "adders") we get this:
>
> =C2=A0sed -i '450s!thru!through!' Changelog
> =C2=A0sed -i '260s!neccessary!necessary!' coroutine-sigaltstack.c
> =C2=A0sed -i '54s!miniscule!minuscule!' disas.c
> =C2=A0sed -i '1094s!thru!through!' hw/usb/hcd-ehci.c
> =C2=A0sed -i '1095s!thru!through!' hw/usb/hcd-ehci.c
> =C2=A0sed -i '21s!unecessary!unnecessary!' qapi-schema-guest.json
> =C2=A0sed -i '307s!explictly!explicitly!' qemu-ga.c
> =C2=A0sed -i '490s!preceeding!preceding!' qga/commands-posix.c
> =C2=A0sed -i '792s!addres!address!' qga/commands-posix.c
> =C2=A0sed -i '6s!beeing!being!' tests/tcg/test-mmap.c
>
> Signed-off-by: Jim Meyering <meyering@redhat.com>
> ---
> =C2=A0Changelog =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-
> =C2=A0coroutine-sigaltstack.c | 2 +-
> =C2=A0disas.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 +-
> =C2=A0hw/usb/hcd-ehci.c =C2=A0 =C2=A0 =C2=A0 | 4 ++--
> =C2=A0qapi-schema-guest.json =C2=A0| 2 +-
> =C2=A0qemu-ga.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-
> =C2=A0qga/commands-posix.c =C2=A0 =C2=A0| 4 ++--
> =C2=A0tests/tcg/test-mmap.c =C2=A0 | 2 +-
> =C2=A08 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Changelog b/Changelog
> index 8b63258..13eebef 100644
> --- a/Changelog
> +++ b/Changelog
> @@ -447,7 +447,7 @@ version 0.5.0:
> =C2=A0 - multi-target build
> =C2=A0 - fixed: no error code in hardware interrupts
> =C2=A0 - fixed: pop ss, mov ss, x and sti disable hardware irqs for the n=
ext insn
> - =C2=A0- correct single stepping thru string operations
> + =C2=A0- correct single stepping through string operations
> =C2=A0 - preliminary SPARC target support (Thomas M. Ogrisegg)
> =C2=A0 - tun-fd option (Rusty Russell)
> =C2=A0 - automatic IDE geometry detection
> diff --git a/coroutine-sigaltstack.c b/coroutine-sigaltstack.c
> index 7ff2d33..ddcb603 100644
> --- a/coroutine-sigaltstack.c
> +++ b/coroutine-sigaltstack.c
> @@ -257,7 +257,7 @@ static Coroutine *coroutine_new(void)
> =C2=A0 =C2=A0 /*
> =C2=A0 =C2=A0 =C2=A0* Now enter the trampoline again, but this time not a=
s a signal
> =C2=A0 =C2=A0 =C2=A0* handler. Instead we jump into it directly. The func=
tionally
> - =C2=A0 =C2=A0 * redundant ping-pong pointer arithmentic is neccessary t=
o avoid
> + =C2=A0 =C2=A0 * redundant ping-pong pointer arithmentic is necessary to=
 avoid

Also "arithmetic".

Otherwise OK.

-- PMM

