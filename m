Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBccR-0003Ac-6Q
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 04:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1fBccO-00038L-SE
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 04:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1fBccJ-0004Uh-U2
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 04:51:08 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:46042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1fBccJ-0004SI-Fg; Thu, 26 Apr 2018 04:51:03 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w3Q8k6hK032374; Thu, 26 Apr 2018 08:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2017-10-26;
	bh=JUrk4Y75OO/+uti/dKtRZBlpOsly7hlt7gg8KfxpFFc=;
	b=FmtPbC3cPEAHtBr8GX2gSy5OeV+RMdZSW4esogRrLf9gC6WbSAhLY9ccmkPQH+JiQQUn
	lrIEDSty9gZRkUruvqMob6jRvLYLh0Z4XijR8DX0BfHgKsndJ9E1YVom3+b8feF2Iw0V
	BOJm5efxq9aJnwqP0o3/AkFA5J8W5d84D0zdtsf4aG8pey/A3t5n7rsuSogpnHqm8rjL
	aBv6BKjr6MWVDA34kJ4/aU59FXk7fogsTEO4JHs59nKBvj8L2iVRepog4PnHRoWodLk2
	4ZwsHWiIkA8MasEHm8uDLhpvx/BUY16ErTIXlxoWAEC3YrsBUYtZQUK7I3D1IeCV4HvN
	PA== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by aserp2120.oracle.com with ESMTP id 2hfw9aj5xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Apr 2018 08:50:59 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w3Q8owxs004795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 26 Apr 2018 08:50:58 GMT
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w3Q8ov2j005939;
	Thu, 26 Apr 2018 08:50:58 GMT
Received: from yuvallap (/10.175.19.215)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 26 Apr 2018 01:50:57 -0700
Date: Thu, 26 Apr 2018 11:50:52 +0300
From: Yuval Shaia <yuval.shaia@oracle.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, ehabkost@redhat.com,
	mst@redhat.com
Message-ID: <20180426085052.GA4515@yuvallap>
References: <20180426084523.10565-1-marcel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180426084523.10565-1-marcel@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8874
	signatures=668698
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=970
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1804260086
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: update Marcel
 Apfelbaum email
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
X-List-Received-Date: Thu, 26 Apr 2018 08:51:09 -0000

On Thu, Apr 26, 2018 at 11:45:23AM +0300, Marcel Apfelbaum wrote:
> Use my gmail account for maintainer tasks.
> 
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>  MAINTAINERS | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24b70169bc..459e3594e1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -909,7 +909,7 @@ X86 Machines
>  ------------
>  PC
>  M: Michael S. Tsirkin <mst@redhat.com>
> -M: Marcel Apfelbaum <marcel@redhat.com>
> +M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>  S: Supported
>  F: include/hw/i386/
>  F: hw/i386/
> @@ -959,7 +959,7 @@ F: include/hw/timer/mc146818rtc*
>  
>  Machine core
>  M: Eduardo Habkost <ehabkost@redhat.com>
> -M: Marcel Apfelbaum <marcel@redhat.com>
> +M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>  S: Supported
>  F: hw/core/machine.c
>  F: hw/core/null-machine.c
> @@ -1033,7 +1033,7 @@ F: hw/ipack/
>  
>  PCI
>  M: Michael S. Tsirkin <mst@redhat.com>
> -M: Marcel Apfelbaum <marcel@redhat.com>
> +M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>  S: Supported
>  F: include/hw/pci/*
>  F: hw/misc/pci-testdev.c
> @@ -2075,7 +2075,7 @@ F: docs/block-replication.txt
>  
>  PVRDMA
>  M: Yuval Shaia <yuval.shaia@oracle.com>
> -M: Marcel Apfelbaum <marcel@redhat.com>
> +M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

:(

Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>

>  S: Maintained
>  F: hw/rdma/*
>  F: hw/rdma/vmw/*
> -- 
> 2.13.6
> 

