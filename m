Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ15r-0002Wq-LX
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:45:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ15p-0002WA-Ad
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ15o-00006B-1U
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:45:01 -0400
Received: from moutng.kundenserver.de ([212.227.17.9]:53292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ15n-000067-LA; Fri, 27 May 2011 13:44:59 -0400
Received: from flocke.weilnetz.de (p5086FC6B.dip.t-dialin.net [80.134.252.107])
	by mrelayeu.kundenserver.de (node=mrbap0) with ESMTP (Nemesis)
	id 0LuJK3-1PfrCf1t4R-0110jU; Fri, 27 May 2011 19:39:54 +0200
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ10r-0001Sn-K8; Fri, 27 May 2011 19:39:53 +0200
Message-ID: <4DDFE1E9.3060508@mail.berlios.de>
Date: Fri, 27 May 2011 19:39:53 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110307 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Alexandre Raymond <cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-7-git-send-email-cerbere@gmail.com>
In-Reply-To: <1306516951-31105-7-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:Gs7QTmgqnJT5rV/Pp06YyyQN9Ud5sBh6Fsa2QATGAxx
	RxdqT4ZgtODNCnrNYhCPwGuwXtnmuktJLGS6QEmq0Dmi14vSF5
	2/xI/qbRnsZ6lkyk0efNG83ZB3Wdmwmj/ld9tXOBCj1EPkoNIf
	Hh1zBRzlETnBsXyxDka3LFqvyhOjzSHH6Ll7PksXBxyeeGEFjU
	Vdrc3c8vQMj9NyFP91CGmrztzEKddkEABsBIAmno9GWUmiPJKf AzNCtK5ig0Ali
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.9
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 6/6] Avoid compilation
 warning regarding kvm	under darwin
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
X-List-Received-Date: Fri, 27 May 2011 17:45:02 -0000

Am 27.05.2011 19:22, schrieb Alexandre Raymond:
> ----8<----
> qemu/target-s390x/helper.c:32:23: warning: linux/kvm.h: No such file 
> or director
> ----8<----
>
> kvm.h, which is included right after this line, already includes 
> linux/kvm.h
> with the proper CONFIG_KVM guard. Remove redundant include.
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
> target-s390x/helper.c | 1 -
> 1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/target-s390x/helper.c b/target-s390x/helper.c
> index c79af46..5dc42f1 100644
> --- a/target-s390x/helper.c
> +++ b/target-s390x/helper.c
> @@ -29,7 +29,6 @@
> #include "qemu-timer.h"
>
> #if !defined(CONFIG_USER_ONLY)
> -#include <linux/kvm.h>
> #include "kvm.h"
> #endif

See http://patchwork.ozlabs.org/patch/97191/.

Regards,
Stefan W.



