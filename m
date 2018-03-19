Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ey2xL-0007mJ-ST
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2018 18:08:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ey2xJ-0007kg-Rh
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2018 18:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ey2xI-0001NQ-SN
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2018 18:08:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48608 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ey2xG-0001JD-OI; Mon, 19 Mar 2018 18:08:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66DE08182D06;
	Mon, 19 Mar 2018 22:08:34 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0986A2022C01;
	Mon, 19 Mar 2018 22:08:33 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20180319215335.1119213-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <831cddaa-3803-10b1-8d6a-e878c97cca73@redhat.com>
Date: Mon, 19 Mar 2018 17:08:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180319215335.1119213-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 19 Mar 2018 22:08:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 19 Mar 2018 22:08:34 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] rdma: Fix 32-bit
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
X-List-Received-Date: Mon, 19 Mar 2018 22:08:38 -0000

On 03/19/2018 04:53 PM, Eric Blake wrote:
> Use the correct printf formats, so that a 32-bit compile doesn't
> spit out lots of warnings about %lx being incompatible with uint64_t.
> Broken since initial commit ef6d4ccd.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> I don't know if 'make vm-build-ubuntu.i368' would catch this (it failed
> for me for other reasons); I found it via a 32-bit rawhide VM.

That fixes most of the warnings, but not:

/home/dummy/qemu/hw/rdma/rdma_backend.c: In function 
'rdma_backend_create_mr':
/home/dummy/qemu/hw/rdma/rdma_backend.c:409:37: error: cast to pointer 
from integer of different size [-Werror=int-to-pointer-cast]
      m4->ibmr = ibv_reg_m4(pd->ibpd, (void *)addr, length, access);
                                      ^

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

