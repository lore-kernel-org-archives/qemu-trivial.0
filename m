Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBKu9-0008I2-D1
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 04:33:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBKu2-0008Hm-EQ
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:33:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBKtx-0007vK-Au
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:33:30 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:57194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBKtx-0007v9-4i
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:33:25 -0400
Received: by mail-lb0-f173.google.com with SMTP id 10so2772775lbf.4
	for <qemu-trivial@nongnu.org>; Mon, 19 Aug 2013 01:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XcOwopgsWIaKc7hS+8GQdeSEHl5fUEhn96l/rOOOIZk=;
	b=heBQ2kscAPcm9g+PVgQWWE6pTUXg3Gex33NDe+ocJ8cgztYP5p0oyMST6D2wzlRt/8
	zqf17u5pXUmUiNrpQFN0y50nQAXcaui3y0xkMcWOx6MudxNTowonbx0rX5A/r3kxo9Cc
	UyZE3RNbl3cD/SEBkA2BkC3ulz77eQ8+cl2617sk3PlJlagDQyUoEF0hq04WJe/iAyU5
	BU2U5kofW+j2hNTj++JfzJ3S27bgbkMKK7Yz8MnxdKZcfji/uG4ts/gqLbsDDZxdWZ2Z
	iK/3AhpBwcGk2s2gq0z6dDa+R37rCHGfpgwQUeR6u+8edcD3YfP+YNq8YDu2b0/rwTSD
	3KZg==
X-Gm-Message-State: ALoCoQnXfO6X1lyYXDJBNkBKkZDs07iKZlj3y7PnEGdPHKMLGysEDv9ND3vJse8Gspp3bDvozRPI
X-Received: by 10.112.42.103 with SMTP id n7mr10714268lbl.6.1376901204177;
	Mon, 19 Aug 2013 01:33:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Mon, 19 Aug 2013 01:33:04 -0700 (PDT)
In-Reply-To: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Aug 2013 09:33:04 +0100
Message-ID: <CAFEAcA_yfEtT=JXfa56A8Fa1a=yHMY8NPdPf02j=f+8Fqfjzjg@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Improve Monitor disas
	with symbol lookup
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
X-List-Received-Date: Mon, 19 Aug 2013 08:33:36 -0000

On 2 August 2013 13:48, Fabien Chouteau <chouteau@adacore.com> wrote:
> Part of M731-018.

What is this a reference to?

> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  disas.c |   16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/disas.c b/disas.c
> index 71007fb..3ffb3ae 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -480,11 +480,19 @@ void monitor_disas(Monitor *mon, CPUArchState *env,
>  #endif
>
>      for(i = 0; i < nb_insn; i++) {
> -       monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
> +        const char *sym = lookup_symbol(pc);
> +
> +        monitor_printf(mon, "0x" TARGET_FMT_lx " ", pc);
> +        if (sym[0] != '\0') {
> +            monitor_printf(mon, "<%s>:  ", sym);
> +        } else {
> +            monitor_printf(mon, ":  ");
> +        }

It feels to me like this is at the wrong level:
shouldn't it be in the disassembly layer so that you
can get symbols in both monitor disassembly and
debug-log disassembly?

thanks
-- PMM

