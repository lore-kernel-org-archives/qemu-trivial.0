Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIFHy-0001SB-AM
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2015 08:07:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ZIFHw-0001Qb-9q
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 08:07:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ZIFHv-0001FW-50
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 08:07:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1ZIFHm-0001CI-S1; Thu, 23 Jul 2015 08:07:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 1B1F432C424;
	Thu, 23 Jul 2015 12:07:38 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-18.brq.redhat.com
	[10.40.204.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6NC7ZkB029243; Thu, 23 Jul 2015 08:07:36 -0400
Date: Thu, 23 Jul 2015 14:07:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20150723140729.6da9c1f5@igors-macbook-pro.local>
In-Reply-To: <1437573590-2801-1-git-send-email-thuth@redhat.com>
References: <1437573590-2801-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add another sanity check to
 smp_parse() function
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
X-List-Received-Date: Thu, 23 Jul 2015 12:07:49 -0000

On Wed, 22 Jul 2015 15:59:50 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The code in smp_parse already checks the topology information for
> sockets * cores * threads < cpus and bails out with an error in
> that case. However, it is still possible to supply a bad configuration
> the other way round, e.g. with:
> 
>  qemu-system-xxx -smp 4,sockets=1,cores=4,threads=2
> 
> QEMU then still starts the guest, with topology configuration that
> is rather incomprehensible and likely not what the user wanted.
> So let's add another check to refuse such wrong configurations.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  vl.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/vl.c b/vl.c
> index 5856396..c8d24b1 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1224,7 +1224,13 @@ static void smp_parse(QemuOpts *opts)
>              exit(1);
>          }
>  
> -        max_cpus = qemu_opt_get_number(opts, "maxcpus", 0);
> +        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
> +        if (sockets * cores * threads > max_cpus) {
> +            fprintf(stderr, "cpu topology: error: "
> +                    "sockets (%u) * cores (%u) * threads (%u) >
> maxcpus (%u)\n",
just a nit, maybe s/maxcpus/[max]cpus/

> +                    sockets, cores, threads, max_cpus);
> +            exit(1);
> +        }
>  
>          smp_cpus = cpus;
>          smp_cores = cores > 0 ? cores : 1;


