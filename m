Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhNFW-0008OX-Gq
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 14:36:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhNFN-0008DQ-Mv
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 14:36:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhNFH-0000I2-DJ
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 14:36:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhNF4-0000G0-Kc; Thu, 23 Oct 2014 14:36:10 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 63ABE45C9E;
	Thu, 23 Oct 2014 22:36:08 +0400 (MSK)
Message-ID: <54494A98.5030908@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 22:36:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
	<5448A1C3.5030703@msgid.tls.msk.ru>
	<20141023123202.GD19316@thinpad.lan.raisama.net>
In-Reply-To: <20141023123202.GD19316@thinpad.lan.raisama.net>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] bitops: Header dependency fixes
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
X-List-Received-Date: Thu, 23 Oct 2014 18:36:36 -0000

On 10/23/2014 04:32 PM, Eduardo Habkost wrote:
> On Thu, Oct 23, 2014 at 10:35:47AM +0400, Michael Tokarev wrote:
>> On 09/26/2014 11:46 PM, Eduardo Habkost wrote:
>>> This series adds a missing include, kills a circular header dependency, and
>>> avoid including qemu-common.h from a header to avoid new circular dependencies.
>>>
>>> Eduardo Habkost (3):
>>>   tests: Add missing include to test-bitops.c
>>>   bitops.h: Don't include qemu-common.h
>>>   bitmap.h: Don't include qemu-common.h
>>
>> Applied all 3 to -trivial, _finally_ :)
> 
> Thanks!
> 
> But applying the series after commit be4d57c1ea7f17b9cadb0150b330efd9b6026972
> breaks build, because now bitmap.h needs stdlib.h (for abort()). Can you
> squash the following into patch 3/3?

Heh.  I already fixed it in local git, -- it become obvious right when I tried
to verify the whole lot, -- I usually perform build tests after applying all
patches, not after each of them (actually maybe this is not good, because this
way I can't catch "intermediate" breakage which breaks git bisection).

Yes, squashed it in.  Thank you!

/mjt

> ---
>  include/qemu/bitmap.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
> index 955627f..f0273c9 100644
> --- a/include/qemu/bitmap.h
> +++ b/include/qemu/bitmap.h
> @@ -14,6 +14,7 @@
>  
>  #include <glib.h>
>  #include <string.h>
> +#include <stdlib.h>
>  
>  #include "qemu/osdep.h"
>  #include "qemu/bitops.h"
> 


