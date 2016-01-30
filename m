Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPS64-0006B9-Vl
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 04:45:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPS63-00069Q-91
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPS62-0003L3-Em
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:45:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aPS5y-0003KZ-6d; Sat, 30 Jan 2016 04:45:30 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DB0DD41CA2;
	Sat, 30 Jan 2016 12:45:27 +0300 (MSK)
To: Wei Yang <richard.weiyang@gmail.com>, qemu-trivial@nongnu.org
References: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56AC8637.20304@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 12:45:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: amit.shah@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] rdma: remove check on time_spent
	when calculating mbs
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
X-List-Received-Date: Sat, 30 Jan 2016 09:45:36 -0000

24.01.2016 17:09, Wei Yang wrote:
> Within the if statement, time_spent is assured to be non-zero.
> 
> This patch just removes the check on time_spent when calculating mbs.

The if statement is this one:

        if (current_time >= initial_time + BUFFER_DELAY) {

Note that we use time_spent as a divisor to calculate
bandwidth too.

This is indeed a trivial patch, I'm applying it to -trivial,
but please the next time post it to qemu-devel (the main
mailinglist), and Cc qemu-trivial if it is trivial.

Thanks!

/mjt

> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> ---
>  migration/migration.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index c842499..40b87f2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1677,8 +1677,8 @@ static void *migration_thread(void *opaque)
>              double bandwidth = (double)transferred_bytes / time_spent;
>              max_size = bandwidth * migrate_max_downtime() / 1000000;
>  
> -            s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
> -                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0 : -1;
> +            s->mbps = (((double) transferred_bytes * 8.0) /
> +                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0;
>  
>              trace_migrate_transferred(transferred_bytes, time_spent,
>                                        bandwidth, max_size);
> 


