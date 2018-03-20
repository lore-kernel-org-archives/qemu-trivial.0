Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyEXZ-0006Hy-Nn
	for mharc-qemu-trivial@gnu.org; Tue, 20 Mar 2018 06:30:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eyEXU-0006FI-RV
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 06:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eyEXT-0001Bt-Vt
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 06:30:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38984 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1eyEXL-0000xE-9C; Tue, 20 Mar 2018 06:30:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC240EBFEA;
	Tue, 20 Mar 2018 10:30:34 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.7.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A55E6215CDB7;
	Tue, 20 Mar 2018 10:30:33 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	Fam Zheng <famz@redhat.com>
Cc: qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>
References: <20180319215335.1119213-1-eblake@redhat.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <56ec7ba5-a6e1-2268-3313-8babc640c024@redhat.com>
Date: Tue, 20 Mar 2018 12:30:31 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180319215335.1119213-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 10:30:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 10:30:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH for-2.12] rdma: Fix 32-bit compilation
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
X-List-Received-Date: Tue, 20 Mar 2018 10:30:48 -0000

Hi Eric,

On 19/03/2018 23:53, Eric Blake wrote:
> Use the correct printf formats, so that a 32-bit compile doesn't
> spit out lots of warnings about %lx being incompatible with uint64_t.
> Broken since initial commit ef6d4ccd.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> I don't know if 'make vm-build-ubuntu.i368' would catch this (it failed
> for me for other reasons); I found it via a 32-bit rawhide VM.
> 

I couldn't run 'make vm-build-ubuntu.i368' either. (Stuck on "Booting from Hard Disk...")

I run make docker-test-build@debian-win32-cross to be sure it compiles on 32bit arch,
however I found out the docker configuration results in 'RDMA support no', so it will not help.

Fam, is there any way the docker image can be updated with the RDMA libraries
so we can check this too?

>  hw/rdma/rdma_backend.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
> index e306fba5344..89020fdcf62 100644
> --- a/hw/rdma/rdma_backend.c
> +++ b/hw/rdma/rdma_backend.c
> @@ -656,7 +656,8 @@ void rdma_backend_destroy_qp(RdmaBackendQP *qp)
>  #define CHK_ATTR(req, dev, member, fmt) ({ \
>      pr_dbg("%s="fmt","fmt"\n", #member, dev.member, req->member); \
>      if (req->member > dev.member) { \
> -        warn_report("%s = 0x%lx is higher than host device capability 0x%lx", \
> +        warn_report("%s = 0x%" PRIx64 " is higher than host device " \
> +                    "capability 0x%" PRIx64, \
>                      #member, (uint64_t)req->member, (uint64_t)dev.member); \
>          req->member = dev.member; \
>      } \
> 

Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>


Thanks,
Marcel

