Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZRqTV-0006az-De
	for mharc-qemu-trivial@gnu.org; Tue, 18 Aug 2015 19:39:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZRqTS-0006Y5-Kg
	for qemu-trivial@nongnu.org; Tue, 18 Aug 2015 19:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZRqTR-0008RR-S4
	for qemu-trivial@nongnu.org; Tue, 18 Aug 2015 19:39:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZRqTM-0008QH-Ou; Tue, 18 Aug 2015 19:39:16 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B425AFC0DD;
	Tue, 18 Aug 2015 23:39:15 +0000 (UTC)
Received: from [10.36.6.40] (vpn1-6-40.ams2.redhat.com [10.36.6.40])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7INdBxX028939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 18 Aug 2015 19:39:13 -0400
Message-ID: <55D3C21E.4020401@redhat.com>
Date: Tue, 18 Aug 2015 16:39:10 -0700
From: Thomas Huth <thuth@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <1437573590-2801-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1437573590-2801-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
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
X-List-Received-Date: Tue, 18 Aug 2015 23:39:23 -0000

On 22/07/15 06:59, Thomas Huth wrote:
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
>  
>          smp_cpus = cpus;
>          smp_cores = cores > 0 ? cores : 1;

*ping*

 Thomas



