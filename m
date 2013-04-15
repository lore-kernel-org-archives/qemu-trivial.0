Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URfSP-0003an-8L
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 05:12:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1URfSL-0003ZD-64
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 05:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1URfSE-0001X5-9A
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 05:12:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1URfSE-0001Wz-1O; Mon, 15 Apr 2013 05:12:02 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3F9C1Fe023889
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 15 Apr 2013 05:12:01 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-27.ams2.redhat.com
	[10.36.112.27])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3F9Bve9002729; Mon, 15 Apr 2013 05:11:58 -0400
Message-ID: <516BC458.7050301@redhat.com>
Date: Mon, 15 Apr 2013 11:11:52 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1365972770-13777-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1365972770-13777-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw: Add lost ARM core again
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
X-List-Received-Date: Mon, 15 Apr 2013 09:12:10 -0000

Il 14/04/2013 22:52, Stefan Weil ha scritto:
> Commit 0434e30afb6175212389811e0b28b948eb3c1e40 accidentally removed
> the compilation of arm11mpcore.c.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  default-configs/arm-softmmu.mak |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 31725a9..27cbe3d 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -34,8 +34,8 @@ CONFIG_PFLASH_CFI02=y
>  CONFIG_MICRODRIVE=y
>  CONFIG_USB_MUSB=y
>  
> -CONFIG_ARM5MPCORE=y
>  CONFIG_ARM9MPCORE=y
> +CONFIG_ARM11MPCORE=y
>  CONFIG_ARM15MPCORE=y
>  
>  CONFIG_ARM_GIC=y
> 

Thanks, will include in pull request.

Paolo

