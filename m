Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z1ub4-0007Nl-16
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2015 06:48:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z1uaz-0007GL-Bs
	for qemu-trivial@nongnu.org; Mon, 08 Jun 2015 06:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z1uay-0007cl-Ct
	for qemu-trivial@nongnu.org; Mon, 08 Jun 2015 06:47:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Z1uav-0007aE-W8; Mon, 08 Jun 2015 06:47:54 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 8FB2A9176E;
	Mon,  8 Jun 2015 10:47:53 +0000 (UTC)
Received: from [10.36.112.50] (ovpn-112-50.ams2.redhat.com [10.36.112.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t58AlnFX003198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 8 Jun 2015 06:47:51 -0400
Message-ID: <557572D5.3050103@redhat.com>
Date: Mon, 08 Jun 2015 12:47:49 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-devel@nongnu.org
References: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
In-Reply-To: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] memory_mapping: Rework cpu related
	includes
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
X-List-Received-Date: Mon, 08 Jun 2015 10:47:58 -0000



On 07/06/2015 23:59, Peter Crosthwaite wrote:
> This makes it more consistent with all other core code files, which
> either just rely on qemu-common.h inclusion or precede cpu.h with
> qemu-common.h.
> 
> cpu-all.h should not be included in addition to cpu.h. Remove it.
> 
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> changed since v1:
> Leave in cpu.h include
> 
> Picked up by my multi arch WIP where target-multi/cpu.h cant handle
> random core code inclusion without preceeded qemu-common.h. I guess
> this is the only one in tree?
> ---
>  memory_mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memory_mapping.c b/memory_mapping.c
> index 7b69801..36d6b26 100644
> --- a/memory_mapping.c
> +++ b/memory_mapping.c
> @@ -13,8 +13,8 @@
>  
>  #include <glib.h>
>  
> +#include "qemu-common.h"
>  #include "cpu.h"
> -#include "exec/cpu-all.h"
>  #include "sysemu/memory_mapping.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

About to leave on vacation, so someone else will have to pick it up.

Paolo

