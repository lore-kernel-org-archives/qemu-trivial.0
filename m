Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLu60-0002v6-S5
	for mharc-qemu-trivial@gnu.org; Mon, 04 Dec 2017 11:59:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eLu5z-0002tn-1M
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 11:59:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eLu5y-0007IF-Ci
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 11:59:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:14654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eLu5s-0007EQ-94; Mon, 04 Dec 2017 11:59:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 733D3C049D57;
	Mon,  4 Dec 2017 16:59:46 +0000 (UTC)
Received: from [10.18.17.231] (dhcp-17-231.bos.redhat.com [10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB1B6C43B;
	Mon,  4 Dec 2017 16:59:45 +0000 (UTC)
To: Michael McConville <mmcco@mykolab.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <A6478011-CD5E-4FDF-A212-6D9BB0E70028@mykolab.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <0fdf8830-4202-59f4-59c0-a99506cde4d9@redhat.com>
Date: Mon, 4 Dec 2017 11:59:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <A6478011-CD5E-4FDF-A212-6D9BB0E70028@mykolab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 04 Dec 2017 16:59:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] mmap(2) returns MAP_FAILED,
 not NULL, on failure
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
X-List-Received-Date: Mon, 04 Dec 2017 16:59:56 -0000



On 12/01/2017 01:31 PM, Michael McConville wrote:
> Signed-off-by: Michael McConville <mmcco@mykolab.com>
> ---
>  hw/i386/xen/xen-mapcache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index baab93b614..efa35dc6e0 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -199,7 +199,7 @@ static void xen_remap_bucket(MapCacheEntry *entry,
>           */
>          vaddr_base = mmap(vaddr, size, PROT_READ | PROT_WRITE,
>                            MAP_ANON | MAP_SHARED, -1, 0);
> -        if (vaddr_base == NULL) {
> +        if (vaddr_base == MAP_FAILED) {
>              perror("mmap");
>              exit(-1);
>          }
> 

Reviewed-by: John Snow <jsnow@redhat.com>

