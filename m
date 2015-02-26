Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQxOG-0000TE-6x
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 07:18:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YQxOD-0000LP-2N
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 07:18:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YQxOC-0006gr-90
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 07:18:01 -0500
Received: from cantor2.suse.de ([195.135.220.15]:58265 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1YQxO7-0006gE-Cy; Thu, 26 Feb 2015 07:17:55 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D7287AB09;
	Thu, 26 Feb 2015 12:17:54 +0000 (UTC)
Message-ID: <54EF0EF1.1010000@suse.de>
Date: Thu, 26 Feb 2015 13:17:53 +0100
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Fabien Chouteau <chouteau@adacore.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1424857165-26277-1-git-send-email-chouteau@adacore.com>
In-Reply-To: <1424857165-26277-1-git-send-email-chouteau@adacore.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: Tristan Gingold <gingold@adacore.com>
Subject: Re: [Qemu-trivial] [PATCH] [POWERPC] display cpu id dump state
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
X-List-Received-Date: Thu, 26 Feb 2015 12:18:02 -0000



On 25.02.15 10:39, Fabien Chouteau wrote:
> From: Tristan Gingold <gingold@adacore.com>
> 
> 
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>

Same nit here - please always provide a commit message stating your
rationale. I can guess (debugging SMP guests), but it's nicer when you
can look through the logs and there's no need to guess.


Alex

> ---
>  target-ppc/translate.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target-ppc/translate.c b/target-ppc/translate.c
> index 88c18e3..2a78e99 100644
> --- a/target-ppc/translate.c
> +++ b/target-ppc/translate.c
> @@ -11214,8 +11214,9 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
>      int i;
>  
>      cpu_fprintf(f, "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx " CTR "
> -                TARGET_FMT_lx " XER " TARGET_FMT_lx "\n",
> -                env->nip, env->lr, env->ctr, cpu_read_xer(env));
> +                TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\n",
> +                env->nip, env->lr, env->ctr, cpu_read_xer(env),
> +                cs->cpu_index);
>      cpu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
>                  TARGET_FMT_lx " idx %d\n", env->msr, env->spr[SPR_HID0],
>                  env->hflags, env->mmu_idx);
> 

