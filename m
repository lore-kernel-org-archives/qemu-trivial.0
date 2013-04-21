Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UTw8Y-0004ux-2S
	for mharc-qemu-trivial@gnu.org; Sun, 21 Apr 2013 11:25:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1UTw8U-0004o2-1j
	for qemu-trivial@nongnu.org; Sun, 21 Apr 2013 11:25:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1UTw8R-0004DT-Ka
	for qemu-trivial@nongnu.org; Sun, 21 Apr 2013 11:25:01 -0400
Received: from mail-ia0-x236.google.com ([2607:f8b0:4001:c02::236]:38196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1UTw8O-0004Bi-D4; Sun, 21 Apr 2013 11:24:56 -0400
Received: by mail-ia0-f182.google.com with SMTP id u20so4701991iag.27
	for <multiple recipients>; Sun, 21 Apr 2013 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=pG18FowsT5+nX2lwTsnrVbra6GZuDp8sOUitTrRlnZw=;
	b=cJLMu8fCs8v+AAhXEvq3zHC53KXvrTpYd1SkN0pQ+0iwyGLBgS9zUSAtFGXfcEYsDE
	RhAerYM/TUGrV0KVMJIDgVOhz4Nhc+Wji9HotvvYox9nz5iKfjIDQOJaNXr1QUn4qXpf
	1OGpFuS7SbMeDdjRY54tf3NCmtfe8f6NV6vgMHA6opWl2O22FP5uyZAH9zoU2dALikuJ
	wcCVrIUlJCjI9ZecRo6xxs66HuM5gjpzlOWqwxyqNo8OmU+LTeWfLlG99nEpa8yRwAJh
	b6qvAqQNL+gf5gT+4tOrHMPIwD/KVXe8l2fYKynmXP8ENBJNRLTquxlzWdXzbZAqc4AD
	1v+g==
X-Received: by 10.50.18.74 with SMTP id u10mr7841992igd.42.1366557895874; Sun,
	21 Apr 2013 08:24:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.81.83 with HTTP; Sun, 21 Apr 2013 08:24:35 -0700 (PDT)
In-Reply-To: <1366551003-16649-1-git-send-email-peter.maydell@linaro.org>
References: <1366551003-16649-1-git-send-email-peter.maydell@linaro.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 21 Apr 2013 15:24:35 +0000
Message-ID: <CAAu8pHvSgchUgM9Hz8JT-_AWCeSsk-OnOkS+TOsogdLkA-pjog@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c02::236
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] qtest: Handle addresses and values for
	{in, out}[bwl] as unsigned
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
X-List-Received-Date: Sun, 21 Apr 2013 15:25:03 -0000

On Sun, Apr 21, 2013 at 1:30 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Handle the addresses and values for {in,out}[bwl] as unsigned (ie
> with strtoul), as per the protocol specification comment. This fixes
> a test failure in test_i440fx_defaults on 32-bit hosts where the test
> tries to write 0x80000000 and qtest was instead writing 0x7fffffff.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Fixes the problem for me.
Tested-by: Blue Swirl <blauwirbel@gmail.com>

> ---
> This fixes the actual parsing error; checking strtol errors is
> a separate bug which should be done for the whole file.
>
>  qtest.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/qtest.c b/qtest.c
> index 3bba3e5..07a9612 100644
> --- a/qtest.c
> +++ b/qtest.c
> @@ -271,8 +271,8 @@ static void qtest_process_command(CharDriverState *chr, gchar **words)
>          uint32_t value;
>
>          g_assert(words[1] && words[2]);
> -        addr = strtol(words[1], NULL, 0);
> -        value = strtol(words[2], NULL, 0);
> +        addr = strtoul(words[1], NULL, 0);
> +        value = strtoul(words[2], NULL, 0);
>
>          if (words[0][3] == 'b') {
>              cpu_outb(addr, value);
> @@ -290,7 +290,7 @@ static void qtest_process_command(CharDriverState *chr, gchar **words)
>          uint32_t value = -1U;
>
>          g_assert(words[1]);
> -        addr = strtol(words[1], NULL, 0);
> +        addr = strtoul(words[1], NULL, 0);
>
>          if (words[0][2] == 'b') {
>              value = cpu_inb(addr);
> --
> 1.7.10.4
>

