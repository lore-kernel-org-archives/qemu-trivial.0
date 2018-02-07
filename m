Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ejVMz-00030U-1L
	for mharc-qemu-trivial@gnu.org; Wed, 07 Feb 2018 14:27:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ejVMx-0002xF-8K
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 14:27:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ejVMw-0004gX-Bj
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 14:26:59 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44772 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ejVMr-0004cg-T8; Wed, 07 Feb 2018 14:26:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FC5776F94;
	Wed,  7 Feb 2018 19:26:43 +0000 (UTC)
Received: from [10.36.117.115] (ovpn-117-115.ams2.redhat.com [10.36.117.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9AE32024CA5;
	Wed,  7 Feb 2018 19:26:35 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	armbru@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180207160302.15651-1-eblake@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <16675663-c4fc-3d2a-9d90-9731c904e46c@redhat.com>
Date: Wed, 7 Feb 2018 20:26:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180207160302.15651-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 07 Feb 2018 19:26:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 07 Feb 2018 19:26:43 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop unneeded system header
 includes
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
X-List-Received-Date: Wed, 07 Feb 2018 19:27:00 -0000

On 07.02.2018 17:03, Eric Blake wrote:
> <memory.h> is a non-standard obsolete header that was long ago
> replaced by <string.h>.
> 
> <malloc.h> is a non-standard header; it is not obsolete (we must
> use it for malloc_trim, for example), but generally should not
> be used in files that just need malloc() and friends, where
> <stdlib.h> is the standard header.
> 
> And since osdep.h already guarantees string.h and stdlib.h, we
> can drop these unusual system header includes as redundant
> rather than replacing them.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Based-on: <20180207124009.12376-1-armbru@redhat.com>
> ([PULL 00/20] Miscellaneous patches for 2018-02-07)
> 
>  target/i386/hax-windows.h | 2 --
>  target/i386/hvf/x86_mmu.c | 1 -
>  2 files changed, 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

