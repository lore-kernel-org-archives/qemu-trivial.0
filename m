Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIeQS-0006na-ED
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 14:11:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fIeQQ-0006ma-GQ
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 14:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fIeQP-0004ZQ-Cg
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 14:11:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46710 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fIeQJ-0004XW-Ks; Tue, 15 May 2018 14:11:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A47054201AE5;
	Tue, 15 May 2018 18:11:42 +0000 (UTC)
Received: from [10.10.124.57] (ovpn-124-57.rdu2.redhat.com [10.10.124.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED7711C4C3;
	Tue, 15 May 2018 18:11:39 +0000 (UTC)
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
References: <20180515134950.3755-1-muriloo@linux.ibm.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7abb9c3c-524d-16cb-4bbd-7a27c5c6e676@redhat.com>
Date: Tue, 15 May 2018 13:11:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180515134950.3755-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 15 May 2018 18:11:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 15 May 2018 18:11:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] HACKING: document
 preference for g_new instead of g_malloc
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
X-List-Received-Date: Tue, 15 May 2018 18:11:51 -0000

adding qemu-trivial as a potential tree for this to go through

On 05/15/2018 08:49 AM, Murilo Opsfelder Araujo wrote:
> This patch documents the preference for g_new instead of g_malloc. The
> reasons were adapted from commit b45c03f585ea9bb1af76c73e82195418c294919d.
> 
> Discussion in QEMU's mailing list:
>    http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg03238.html
> 
> Cc: qemu-devel@nongnu.org
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> ---
>   HACKING | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/HACKING b/HACKING
> index 4125c97d8d..0fc3e0fc04 100644
> --- a/HACKING
> +++ b/HACKING
> @@ -118,6 +118,15 @@ Please note that g_malloc will exit on allocation failure, so there
>   is no need to test for failure (as you would have to with malloc).
>   Calling g_malloc with a zero size is valid and will return NULL.
>   
> +Prefer g_new(T, n) instead of g_malloc(sizeof(T) * n) for the following
> +reasons:
> +
> +  a. It catches multiplication overflowing size_t;
> +  b. It returns T * instead of void *, letting compiler catch more type
> +     errors.
> +
> +Declarations like T *v = g_malloc(sizeof(*v)) are acceptable, though.
> +
>   Memory allocated by qemu_memalign or qemu_blockalign must be freed with
>   qemu_vfree, since breaking this will cause problems on Win32.
>   
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

