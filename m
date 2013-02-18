Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U7O9f-0003wM-Mu
	for mharc-qemu-trivial@gnu.org; Mon, 18 Feb 2013 05:41:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U7O9a-0001hv-18
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2013 05:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U7O4d-0008Jw-T9
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2013 05:36:00 -0500
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234]:54674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U7O4d-0008JN-GR
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2013 05:35:51 -0500
Received: by mail-la0-f52.google.com with SMTP id fs12so5182957lab.25
	for <qemu-trivial@nongnu.org>; Mon, 18 Feb 2013 02:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=garMBa5VQNEQLaNu5U8u2o4dtdfIFmMPg7RT+4NOzOk=;
	b=V/PfDp8SROJm0Yuhm1wOIWVczJrW+K7F6sLZjoqhvh1s7qeaAiJtmHV/x7QdlhURp2
	3+4sTdd/CQw4D/o/dBaZg5QIi/kbJTyfc1Yj7lyoJfF1jKS8Zblt37n+/3su1X+R/p0T
	XGs9oA9UUW/VLV0M1wIXFB3WfizyFSUkht/DiHgRT4gkDK4LVZX/wgRcdQnYuBhwbP0V
	yE62Ba/1+wMfjOhgWxbj3kEHzXO12vDTAmAO/NmXXDAid6oELwuZahouy+1PeBN0XJcm
	EX0Ehs0152S//3IQ1pxtnQaxlJW/TizIrP7ogix0FYfhxUu9hgKu+gsG3GPQUCUIvYF7
	gGuw==
X-Received: by 10.152.132.138 with SMTP id ou10mr10179076lab.56.1361183386518; 
	Mon, 18 Feb 2013 02:29:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.47.68 with HTTP; Mon, 18 Feb 2013 02:29:26 -0800 (PST)
In-Reply-To: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
References: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Feb 2013 10:29:26 +0000
Message-ID: <CAFEAcA9Fi4t1+d_Jn8+jsbnTmw1gEUD4TKpTqb=FSZTcxS6c8A@mail.gmail.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnXg7V86uSj9454pKJX/VkGk8f2QZsyVbDEDDBmNn1BZb25L5R8EnvKvcjvdQQoZPy6ykTp
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::234
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	patches@linaro.org
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
X-List-Received-Date: Mon, 18 Feb 2013 10:41:02 -0000

Post-unfreeze ping for trivial...
( patchwork url: http://patchwork.ozlabs.org/patch/217696/ )

thanks
-- PMM

On 2 February 2013 17:17, Peter Maydell <peter.maydell@linaro.org> wrote:
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

