Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyuyI-0007cB-Lu
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 03:49:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mapfelba@redhat.com>) id 1eyuyE-0007X7-03
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 03:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mapfelba@redhat.com>) id 1eyuyA-0000cM-7Q
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 03:49:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58130)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mapfelba@redhat.com>)
	id 1eyuy1-0000Xk-S8; Thu, 22 Mar 2018 03:48:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C84CC057FA0;
	Thu, 22 Mar 2018 07:48:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CD555D9C7;
	Thu, 22 Mar 2018 07:48:56 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 426ED4CA98;
	Thu, 22 Mar 2018 07:48:56 +0000 (UTC)
Date: Thu, 22 Mar 2018 03:48:56 -0400 (EDT)
From: Marcel Apfelbaum <marcel@redhat.com>
To: yuval shaia <yuval.shaia@oracle.com>, qemu-devel@nongnu.org
Cc: famz@redhat.com, eblake@redhat.com, qemu-trivial@nongnu.org
Message-ID: <1232053152.12730389.1521704936150.JavaMail.zimbra@redhat.com>
In-Reply-To: <152169525471.222.10982135661238361362@71c20359a636>
References: <152169525471.222.10982135661238361362@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.35.206.35, 10.4.195.7]
Thread-Topic: hw/rdma: Fix 32-bit compilation
Thread-Index: NYqADLZJFpLUSo9mDWWgkexij9WICw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 22 Mar 2018 07:48:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] hw/rdma: Fix 32-bit
 compilation
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
X-List-Received-Date: Thu, 22 Mar 2018 07:49:14 -0000


Hi Yuval,

----- Original Message -----
> From: no-reply@patchew.org
> To: "yuval shaia" <yuval.shaia@oracle.com>
> Cc: famz@redhat.com, "yuval shaia" <yuval.shaia@oracle.com>, marcel@redhat.com, eblake@redhat.com,
> qemu-devel@nongnu.org, qemu-trivial@nongnu.org
> Sent: Thursday, March 22, 2018 7:07:35 AM
> Subject: Re: [Qemu-devel] [PATCH 0/3] hw/rdma: Fix 32-bit compilation
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 

[...]

> === OUTPUT BEGIN ===
> Checking PATCH 1/3: hw/rdma: Change host_virt to void *...
> Checking PATCH 2/3: hw/rdma: Use correct print format in CHK_ATTR macro...
> Checking PATCH 3/3: hw/rdma: Fix 32-bit compilation...
> WARNING: line over 80 characters
> #40: FILE: hw/rdma/rdma_backend.c:180:
> +            pr_dbg("ibv_create_ah failed for gid <0x%" PRIx64 ", 0x%" PRIx64
> ">\n",
> 
> ERROR: space prohibited before that close parenthesis ')'
> #78: FILE: hw/rdma/rdma_backend.c:673:
> +    CHK_ATTR(dev_attr, backend_dev->dev_attr, max_mr_size, "%" PRId64 );
> 
> WARNING: line over 80 characters
> #244: FILE: hw/rdma/vmw/pvrdma_main.c:345:
> +        pr_err("Error trying to set REG value, addr=0x%" PRIx64 ", val=0x%"
> PRIx64 "\n",
> 
> total: 1 errors, 2 warnings, 248 lines checked
> 

Can you please fix and resend?

Thanks,
Marcel

> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@freelists.org

