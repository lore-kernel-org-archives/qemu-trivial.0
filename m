Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1hvN-0001NA-Fz
	for mharc-qemu-trivial@gnu.org; Sat, 02 Feb 2013 13:34:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1U1hvK-0001EB-4Z
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 13:34:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1U1hvJ-0000xF-2K
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 13:34:46 -0500
Received: from mout.web.de ([212.227.17.11]:58706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1U1hvG-0000wq-Gh; Sat, 02 Feb 2013 13:34:42 -0500
Received: from envy.site ([84.148.20.232]) by smtp.web.de (mrweb002) with
	ESMTPSA (Nemesis) id 0LyE7R-1V4PZy48KT-0163zs; Sat, 02 Feb 2013 19:34:40
	+0100
Message-ID: <510D5C3E.3040500@web.de>
Date: Sat, 02 Feb 2013 19:34:38 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:ROBanwvQ7z5YRqcU2mHfXRbNfknOs+A8MlpHgiw1RA9
	CII53WEiYtxWevaIHqUDuYeqIXxW3Vl8wx4UBY4kL0szbfdJNs
	Em3pHq/3BFrQCHSyh63oEUZM56y0zJ29V+xxyJbvXjjzQYGDwW
	lPA9Tz+dQUYmE68UIIKBXFzsds8EarF6Jv8KU5YaS9NvspXyCo
	ATmY7WSj9MLmSJ9qaS85g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 212.227.17.11
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] disas/i386.c: Add explicit braces round
 empty for-loop body
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
X-List-Received-Date: Sat, 02 Feb 2013 18:34:47 -0000

Am 02.02.2013 18:17, schrieb Peter Maydell:
> Add explicit braces round an empty for-loop body; this fits
> QEMU style and is easier to read than an inconspicuous semicolon
> at the end of the line. It also silences a clang warning:
> 
> disas/i386.c:4723:49: warning: for loop has empty body [-Wempty-body]
>           for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++);
>                                                        ^
> disas/i386.c:4723:49: note: put the semicolon on a separate line to silence this warning [-Wempty-body]
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is the only clang warning on MacOSX apart from the ones about
> deprecated features in audio/coreaudio.c and ui/cocoa.m, which is why
> I think it's worth zapping despite it being a style issue in one of the
> bits of disassembler code we got from binutils and which aren't generally
> in QEMU style.
> 
> checkpatch complains about the non-multiple-of-4 indent:
> WARNING: suspect code indent for conditional statements (10, 10)
> #27: FILE: disas/i386.c:4723:
> +          for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++) {
> +          }
> 
> but I didn't see any value in reindenting the whole function just to
> shut it up.
> 
> At some point in the 1.5 cycle maybe we could update the code to avoid
> the deprecated MacOS functions and then we could enable warnings-are-errors
> on MacOS too.

On v10.5.8 I'm seeing some redundant declaration warnings from
disas/s390.c and assumed we wouldn't want to fix/workaround the disas
stuff. Same for some exynos4 file.

Also some uninitialized buf2 in the Realtek NIC or so.

And test-thread-pool breaks due to undefined ___sync_fetch_and_add and
___sync_val_compare_and_swap.

With my setup long broken due to pixman, we never made any progress
fixing the main() mess - Stefan W. replaced asprintf in the command line
code but I'd rather get rid of that in some way similar to here:
http://lists.gnu.org/archive/html/qemu-devel/2012-05/msg03983.html

Cheers,
Andreas

