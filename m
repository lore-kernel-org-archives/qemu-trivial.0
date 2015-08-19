Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZS5l3-0003Vh-E0
	for mharc-qemu-trivial@gnu.org; Wed, 19 Aug 2015 11:58:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZS5ks-0003MS-8F
	for qemu-trivial@nongnu.org; Wed, 19 Aug 2015 11:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZS5kr-0003oK-AA
	for qemu-trivial@nongnu.org; Wed, 19 Aug 2015 11:58:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1ZS5kl-0003iN-7F; Wed, 19 Aug 2015 11:58:15 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id B35E1461DF;
	Wed, 19 Aug 2015 15:58:14 +0000 (UTC)
Received: from localhost (ovpn-113-190.phx2.redhat.com [10.3.113.190])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7JFwELI001181; Wed, 19 Aug 2015 11:58:14 -0400
Date: Wed, 19 Aug 2015 08:58:13 -0700
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20150819155813.GA32203@thinpad.lan.raisama.net>
References: <1437573590-2801-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437573590-2801-1-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Wed, 19 Aug 2015 15:58:24 -0000

On Wed, Jul 22, 2015 at 03:59:50PM +0200, Thomas Huth wrote:
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
> +                    "sockets (%u) * cores (%u) * threads (%u) > maxcpus (%u)\n",
> +                    sockets, cores, threads, max_cpus);
> +            exit(1);
> +        }

I am always afraid of breaking existing setups when we do that, because
there may be existing VMs running with these weird configurations, and
people won't be able to live-migrate them to a newer QEMU.

But I think we really have to start refusing to run obviously broken
configurations one day, or we will never fix this mess, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I want to apply this through the x86 tree, but I would like to get some
Acked-by from other maintainers first.

-- 
Eduardo

