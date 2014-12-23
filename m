Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y3SMw-0003pl-ST
	for mharc-qemu-trivial@gnu.org; Tue, 23 Dec 2014 11:31:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Y3SMr-0003mT-Ah
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 11:31:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Y3SMl-000741-MD
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 11:31:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Y3SMl-00073j-Fw; Tue, 23 Dec 2014 11:31:23 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBNGVCCY013463
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 23 Dec 2014 11:31:12 -0500
Received: from [10.36.112.28] (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBNGV8as013719
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 23 Dec 2014 11:31:10 -0500
Message-ID: <549998CB.4050809@redhat.com>
Date: Tue, 23 Dec 2014 17:31:07 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Peter Wu <peter@lekensteyn.nl>, Peter Lieven <pl@kamp.de>,
	qemu-devel@nongnu.org
References: <1419348641-20955-1-git-send-email-peter@lekensteyn.nl>
In-Reply-To: <1419348641-20955-1-git-send-email-peter@lekensteyn.nl>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block/iscsi: fix uninitialized variable
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
X-List-Received-Date: Tue, 23 Dec 2014 16:31:33 -0000



On 23/12/2014 16:30, Peter Wu wrote:
> 'ret' was never initialized in the success path.
> 
> Signed-off-by: Peter Wu <peter@lekensteyn.nl>
> ---
> Hi,
> 
> Found this warning when compiling with --enable-debug. This issue was previously
> fixed as part of Peter Lieven's patch series[1] but it never seemed to get
> merged.
> 
> Kinds regards,
> Peter
> 
>  [1]: https://lists.gnu.org/archive/html/qemu-devel/2014-03/msg04279.html
> ---
>  block/iscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index ed375fc..12ddbfb 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -1286,7 +1286,7 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
>      QemuOpts *opts;
>      Error *local_err = NULL;
>      const char *filename;
> -    int i, ret;
> +    int i, ret = 0;
>  
>      if ((BDRV_SECTOR_SIZE % 512) != 0) {
>          error_setg(errp, "iSCSI: Invalid BDRV_SECTOR_SIZE. "
> 

Thanks.

Paolo

