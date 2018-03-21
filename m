Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eymAa-0006vJ-Me
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 18:25:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eymAY-0006tX-C4
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 18:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eymAX-0006SQ-8T
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 18:25:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40254 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eymAQ-0006JI-KE; Wed, 21 Mar 2018 18:25:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06A53D1432;
	Wed, 21 Mar 2018 22:25:00 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F4F6202322F;
	Wed, 21 Mar 2018 22:24:53 +0000 (UTC)
To: Yuval Shaia <yuval.shaia@oracle.com>, marcel@redhat.com,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180321211056.3339-1-yuval.shaia@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <159b2ec9-a8a4-ec03-51c1-5bbc097c0de9@redhat.com>
Date: Wed, 21 Mar 2018 17:24:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321211056.3339-1-yuval.shaia@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 22:25:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 22:25:00 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 0/3] hw/rdma: Fix 32-bit compilation
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
X-List-Received-Date: Wed, 21 Mar 2018 22:25:19 -0000

On 03/21/2018 04:10 PM, Yuval Shaia wrote:
> Hi all,
> Following are three patches which fixes various compilation warnings and
> errors detected when compiling rdma device in 32bit host.
> 
> All three patches are based on Eric Blake patch for rdma device.
> Thanks!
> 
> Patch #1: Change host_virt to void *
> Low level IB verbs library accept void * argument so let's make sure this
> is what we supply. This issue reported by Eric Blake.
> 
> Patch #2: Use correct print format in CHK_ATTR macro
> This macro can utilize the given 'format' argument and not need to cast all
> members to u64. This patch is an alternative to suggested patch by Eric
> Blake.
> 
> Patch #3: Fix 32-bit compilation
> Based on Eric Blake patch this patch replaces all %ld/%lx with the platform
> independent PRIx64/PRId64 format.
> 
> Again, thanks Eric Blake for the report.
> 
> Yuval Shaia (3):
>    hw/rdma: Change host_virt to void *
>    hw/rdma: Use correct print format in CHK_ATTR macro

Your fix was nicer than my proposal.

>    hw/rdma: Fix 32-bit compilation

Reviewed-by: Eric Blake <eblake@redhat.com>

and it fixes the build on my 32-bit rawhide VM, so

Tested-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

