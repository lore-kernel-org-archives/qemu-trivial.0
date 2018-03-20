Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyHLZ-0002nQ-PW
	for mharc-qemu-trivial@gnu.org; Tue, 20 Mar 2018 09:30:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyEkO-0001Z1-B3
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 06:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyEkL-0001Gd-7k
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 06:44:04 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:53036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eyEkK-0001Fb-UI; Tue, 20 Mar 2018 06:44:01 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2KAfGNk048740; Tue, 20 Mar 2018 10:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2017-10-26;
	bh=fNUU5W6xkrda6rzeWA/P3/SSUNfVTrV3ekD98nnROQM=;
	b=Knf7DYvi6ySZdgs4Hc7ZgEVa7AxF86dYAJUYTTHGvEOiVzYHcUCfPsBWaNeqgS4la9yL
	whj1G8kwBdcS44aE94RW7mSBhgT8JfjcKbwZvkkVh8becTlCmMc0zLSXpajqpiWPd8Mi
	BiYyw5H2VgDWB2WGBLDQvyY/oRD3wxdybZ8LJss7/d1f90r0v5Nce4rmBYk7JuFzSMJ/
	gBs2ho8CPXDQzuLcDptT3c0OP0n103OzmX78TkmVUilA9GoDTzdqHjqphb7mNkg1Q0B5
	m/RE92FOQS/XDlxNsw0CpTh3yzM2KmvTCP6GXLUhiCFgBbtxXAJ+xBg4Vt8b8S/NWlnk
	BQ== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
	by aserp2130.oracle.com with ESMTP id 2gu0s201y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Mar 2018 10:43:56 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2KAhtFC028041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 20 Mar 2018 10:43:56 GMT
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w2KAht1b003002;
	Tue, 20 Mar 2018 10:43:55 GMT
Received: from yuvallap (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 20 Mar 2018 03:43:54 -0700
Date: Tue, 20 Mar 2018 12:43:49 +0200
From: Yuval Shaia <yuval.shaia@oracle.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>, yuval.shaia@oracle.com
Message-ID: <20180320104348.GA3268@yuvallap>
References: <20180319215335.1119213-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180319215335.1119213-1-eblake@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8837
	signatures=668693
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1803200125
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.79
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:30:36 -0400
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
X-List-Received-Date: Tue, 20 Mar 2018 10:44:05 -0000

On Mon, Mar 19, 2018 at 04:53:35PM -0500, Eric Blake wrote:
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

Hmmm, interesting.
I wonder why in first place to cast all members to uint64_t.
Can you try the method that is used above in the call to pr_dbg, i.e. to
use the given argument fmt?

Something like this:
	warn_report("%s = "fmt" is higher than host device capability "fmt, \
	            #member, req->member, dev.member); \

>          req->member = dev.member; \
>      } \
> -- 
> 2.14.3
> 

