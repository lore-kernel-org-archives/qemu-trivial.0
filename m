Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSKqc-0006hN-1j
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2019 07:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iSKqX-0006g5-W5
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 07:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iSKqW-0004D6-38
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 07:55:37 -0500
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:51847)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iSKqS-00046z-OW
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 07:55:34 -0500
Received: from player158.ha.ovh.net (unknown [10.109.159.68])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id AA2F71AB9A1
 for <qemu-trivial@nongnu.org>; Wed,  6 Nov 2019 13:55:29 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id C257ABB5AB5D;
 Wed,  6 Nov 2019 12:55:25 +0000 (UTC)
Date: Wed, 6 Nov 2019 13:55:24 +0100
From: Greg Kurz <groug@kaod.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] numa: Add missing \n to error message
Message-ID: <20191106135524.10147af8@bahia.lan>
In-Reply-To: <157304440026.351774.14607704217028190097.stgit@bahia.lan>
References: <157304440026.351774.14607704217028190097.stgit@bahia.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14033497917966489942
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddujedggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqthhrihhvihgrlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.48.182
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2019 12:55:39 -0000

Oops I hadn't realized that Marcel had a new e-mail address... since last
year :-\ Sorry for the noise.

On Wed, 06 Nov 2019 13:46:40 +0100
Greg Kurz <groug@kaod.org> wrote:

> If memory allocation fails when using -mem-path, QEMU is supposed to print
> out a message to indicate that fallback to anonymous RAM is deprecated. This
> is done with error_printf() which does output buffering. As a consequence,
> the message is only printed at the next flush, eg. when quiting QEMU, and
> it also lacks a trailing newline:
> 
> qemu-system-ppc64: unable to map backing store for guest RAM: Cannot allocate memory
> qemu-system-ppc64: warning: falling back to regular RAM allocation
> QEMU 4.1.50 monitor - type 'help' for more information
> (qemu) q
> This is deprecated. Make sure that -mem-path  specified path has sufficient resources to allocate -m specified RAM amountgreg@boss02:~/Work/qemu/qemu-spapr$
> 
> Add the missing \n to fix both issues.
> 
> Fixes: cb79224b7e4b "deprecate -mem-path fallback to anonymous RAM"
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/core/numa.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 038c96d4abc6..e3332a984f7c 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -503,7 +503,7 @@ static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
>              warn_report("falling back to regular RAM allocation");
>              error_printf("This is deprecated. Make sure that -mem-path "
>                           " specified path has sufficient resources to allocate"
> -                         " -m specified RAM amount");
> +                         " -m specified RAM amount\n");
>              /* Legacy behavior: if allocation failed, fall back to
>               * regular RAM allocation.
>               */
> 
> 


