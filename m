Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U9Iha-00075R-Ol
	for mharc-qemu-trivial@gnu.org; Sat, 23 Feb 2013 12:15:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1U9IhW-0006td-GJ
	for qemu-trivial@nongnu.org; Sat, 23 Feb 2013 12:15:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1U9IhR-0005Wu-AZ
	for qemu-trivial@nongnu.org; Sat, 23 Feb 2013 12:15:54 -0500
Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a]:49431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1U9IhM-0005Vg-B1; Sat, 23 Feb 2013 12:15:44 -0500
Received: by mail-ie0-f170.google.com with SMTP id c11so1902630ieb.29
	for <multiple recipients>; Sat, 23 Feb 2013 09:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FOQJqdcp+39RrVDf2l1o9128ye7W/Z2fgJvdtX35mFE=;
	b=JBO8cSKMd/7SOJMVfi78pZtFxhbVCAL73zzsSvbxN1GPdn13GW+ZRyIj4+o6uz6SZ2
	45La9pWLwobNPyVU3DX8/6A2vhUCVfdqitaL7qdmerifXag5apOdcTjotT63v9NEh4hm
	hdb2f5JjzqWwokZ9HFr26IWMFnkZc4GKOLbgH6k0L4EPWsxAJzAwW3kUU211YM8JjWSU
	0Wmf39ZCYu22KCuEnfzLgXT3hCzM7eekSgEW+kzliTJoPWv5oGQ8lTHM+0tXnWmtdfzj
	qlN0qDXIiqv768KpDRYoFhOmmIq1ATN7skKMRnK5o9g+De0N8BgDssUg4j3baJtKCrv1
	3+GQ==
X-Received: by 10.50.88.129 with SMTP id bg1mr1074840igb.33.1361638198446;
	Sat, 23 Feb 2013 08:49:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.81.83 with HTTP; Sat, 23 Feb 2013 08:49:38 -0800 (PST)
In-Reply-To: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
References: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 23 Feb 2013 16:49:38 +0000
Message-ID: <CAAu8pHt_RJz9aSy5zT+fCP=LkKwNSZMrpo8fLuL6fm6M0nzaJQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c03::22a
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] disas/i386.c: Add explicit
 braces round empty for-loop body
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
X-List-Received-Date: Sat, 23 Feb 2013 17:15:57 -0000

Thanks, applied.

On Sat, Feb 2, 2013 at 5:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
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
>
>  disas/i386.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/disas/i386.c b/disas/i386.c
> index 3b006b1..dbecf1f 100644
> --- a/disas/i386.c
> +++ b/disas/i386.c
> @@ -4720,7 +4720,8 @@ print_operand_value (char *buf, size_t bufsize, int hex, bfd_vma disp)
>           buf[0] = '0';
>           buf[1] = 'x';
>            snprintf_vma (tmp, sizeof(tmp), disp);
> -         for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++);
> +          for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++) {
> +          }
>            pstrcpy (buf + 2, bufsize - 2, tmp + i);
>         }
>        else
> --
> 1.7.11.4
>
>

