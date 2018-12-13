Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXYS8-0001w4-E9
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 16:23:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gXYS5-0001r6-Ft
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 16:23:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gXYS4-0005WO-5Z
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 16:23:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gXYRz-0005Fr-3K; Thu, 13 Dec 2018 16:23:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1DBF653C7;
	Thu, 13 Dec 2018 21:23:17 +0000 (UTC)
Received: from [10.10.122.76] (ovpn-122-76.rdu2.redhat.com [10.10.122.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 610211054FAE;
	Thu, 13 Dec 2018 21:23:17 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20181213173113.11211-1-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1443f6a6-4d31-8e5c-0ec3-3f906b102e04@redhat.com>
Date: Thu, 13 Dec 2018 15:23:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213173113.11211-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 13 Dec 2018 21:23:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] error: Remove NULL checks
 on error_propagate() calls
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
X-List-Received-Date: Thu, 13 Dec 2018 21:23:26 -0000

On 12/13/18 11:31 AM, Markus Armbruster wrote:
> Patch created mechanically by rerunning:
> 
>    $  spatch --sp-file scripts/coccinelle/error_propagate_null.cocci \
>              --macro-file scripts/cocci-macro-file.h \
>              --dir . --in-place
> 
> Whitespace tidied up manually.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   blockdev.c              | 4 +---
>   hw/s390x/s390-pci-bus.c | 4 +---
>   qga/commands-posix.c    | 7 ++-----
>   3 files changed, 4 insertions(+), 11 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

