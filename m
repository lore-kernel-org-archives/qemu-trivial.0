Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wnwpl-0005Rf-E6
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 17:16:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnwpe-0005Io-EZ
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 17:16:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwpZ-0005DG-0t
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 17:16:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WnwpL-00051g-TF; Fri, 23 May 2014 17:16:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 59E5642B94;
	Sat, 24 May 2014 01:16:29 +0400 (MSK)
Message-ID: <537FBAAD.4080907@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 01:16:29 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>, qemu-devel@nongnu.org
References: <y> <cover.1399641611.git.tamlokveer@gmail.com>
	<1d899df865235022831f0733c874dae9f0ba21ed.1399641611.git.tamlokveer@gmail.com>
In-Reply-To: <1d899df865235022831f0733c874dae9f0ba21ed.1399641611.git.tamlokveer@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, jan.kiszka@web.de, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH 4/4] bsd-user: replace fprintf(stderr,
 ...) with error_report()
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
X-List-Received-Date: Fri, 23 May 2014 21:16:56 -0000

10.05.2014 03:55, Le Tan wrote:
> Replace fprintf(stderr,...) with error_report() in files bsd-user/*.
> The trailing "\n"s of the @fmt argument have been removed
> because @fmt of error_report() should not contain newline.

I'd fix two issues in there:

...
>          default:
>              pc = env->segs[R_CS].base + env->eip;
> -            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
> -                    (long)pc, trapnr);
> +            error_report("qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting",
> +                         (long)pc, trapnr);
>              abort();

Wrapping this line differently to fit in 80 columns.
Yes, the original line was even longer.

>      if ((envlist = envlist_create()) == NULL) {
> -        (void) fprintf(stderr, "Unable to allocate envlist\n");
> +        (void) error_report("Unable to allocate envlist");

And removed these void casts (here and elsewhere), these aern't
needed, error_report() is a function returning void.

>          exit(1);

I think we may use some other function here and in all other places,
which combines error_report with exit/abort.  What's the proper
function for this?

Anyway, applying this patch for now, with the fixed outlined.
Please always check your patches using checkpatch.pl before
sending.

Thanks,

/mjt

