Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iURvh-0004aV-UR
	for mharc-qemu-trivial@gnu.org; Tue, 12 Nov 2019 03:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iURvf-0004Zn-BT
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 03:53:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iURve-0003r6-7Q
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 03:53:39 -0500
Received: from 18.mo4.mail-out.ovh.net ([188.165.54.143]:56498)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iURve-0003ch-1g
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 03:53:38 -0500
Received: from player735.ha.ovh.net (unknown [10.109.160.251])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 081C8211821
 for <qemu-trivial@nongnu.org>; Tue, 12 Nov 2019 09:53:28 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player735.ha.ovh.net (Postfix) with ESMTPSA id 7BAC8BFDC3C1;
 Tue, 12 Nov 2019 08:53:23 +0000 (UTC)
Date: Tue, 12 Nov 2019 09:53:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH qemu] scripts: Detect git worktrees for
 get_maintainer.pl --git
Message-ID: <20191112095321.0b42ade4@bahia.lan>
In-Reply-To: <20191112034532.69079-1-aik@ozlabs.ru>
References: <20191112034532.69079-1-aik@ozlabs.ru>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8288875114856290805
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqthhrihhvihgrlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.54.143
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
X-List-Received-Date: Tue, 12 Nov 2019 08:53:40 -0000

On Tue, 12 Nov 2019 14:45:32 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> Recent git versions support worktrees where .git is not a directory but
> a file with a path to the .git repository; however the get_maintainer.pl
> script only recognises the .git directory, let's fix it.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Makes sense. The script in the linux kernel tree has this since 2014 BTW :)

Reviewed-by: Greg Kurz <groug@kaod.org>

>  scripts/get_maintainer.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 71415e3c7061..27991eb1cfb4 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -81,7 +81,7 @@ my %VCS_cmds;
>  
>  my %VCS_cmds_git = (
>      "execute_cmd" => \&git_execute_cmd,
> -    "available" => '(which("git") ne "") && (-d ".git")',
> +    "available" => '(which("git") ne "") && (-e ".git")',
>      "find_signers_cmd" =>
>  	"git log --no-color --follow --since=\$email_git_since " .
>  	    '--format="GitCommit: %H%n' .


