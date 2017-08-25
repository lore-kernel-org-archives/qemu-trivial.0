Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dlHp0-00030A-5N
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2017 12:51:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dlHox-0002yq-Sy
	for qemu-trivial@nongnu.org; Fri, 25 Aug 2017 12:51:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dlHox-0002Vs-57
	for qemu-trivial@nongnu.org; Fri, 25 Aug 2017 12:50:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dlHor-0002Tg-2P; Fri, 25 Aug 2017 12:50:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 513A65F7B7;
	Fri, 25 Aug 2017 16:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 513A65F7B7
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E70E380E81;
	Fri, 25 Aug 2017 16:50:47 +0000 (UTC)
Date: Fri, 25 Aug 2017 17:50:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Eduardo Otubo <otubo@redhat.com>
Message-ID: <20170825165044.GO2090@work-vm>
References: <1503551270-30648-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503551270-30648-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 25 Aug 2017 16:50:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.11] tests/test-hmp: Remove puv3 and
 tricore_testboard from the blacklist
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Aug 2017 16:51:00 -0000

* Thomas Huth (thuth@redhat.com) wrote:
> The problem with puv3 has been fixed with 0ac241bcf9f9d99a252a352a162f
> ('unicore32: abort when entering "x 0" on the monitor') and the problem
> with tricore_testboard has been fixed with b190f477e29c7cd03a8fee49c96d
> ('qemu-system-tricore: segfault when entering "x 0" on the monitor').
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/test-hmp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/test-hmp.c b/tests/test-hmp.c
> index 4382df0..9f286bf 100644
> --- a/tests/test-hmp.c
> +++ b/tests/test-hmp.c
> @@ -192,8 +192,7 @@ static void add_machine_test_case(const char *mname)
>      char *path;
>  
>      /* Ignore blacklisted machines that have known problems */
> -    if (!strcmp("puv3", mname) || !strcmp("tricore_testboard", mname) ||
> -        !strcmp("xenfv", mname) || !strcmp("xenpv", mname)) {
> +    if (!strcmp("xenfv", mname) || !strcmp("xenpv", mname)) {
>          return;
>      }
>  
> -- 
> 1.8.3.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

