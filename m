Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk4u8-00059f-LL
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 02:42:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZhgvT-0001D8-GE
	for qemu-trivial@nongnu.org; Thu, 01 Oct 2015 12:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZhgvP-0001Td-GF
	for qemu-trivial@nongnu.org; Thu, 01 Oct 2015 12:41:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42762)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZhgvL-0001RL-Az; Thu, 01 Oct 2015 12:41:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B6184AC1A1;
	Thu,  1 Oct 2015 16:41:38 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-48-83.rdu2.redhat.com [10.10.48.83])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t91GfbPj024928; Thu, 1 Oct 2015 12:41:38 -0400
To: qemu-devel@nongnu.org
References: <1443117055-29240-1-git-send-email-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <560D6241.3080103@redhat.com>
Date: Thu, 1 Oct 2015 12:41:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443117055-29240-1-git-send-email-jsnow@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Small IDE/FDC
	touchup
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
X-List-Received-Date: Thu, 01 Oct 2015 16:41:51 -0000



On 09/24/2015 01:50 PM, John Snow wrote:
> libqos/ahci and tests/fdc-test are under my purview also,
> include them in the appropriate stanzas.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf02890..7d97bd8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -634,6 +634,7 @@ F: hw/block/cdrom.c
>  F: hw/block/hd-geometry.c
>  F: tests/ide-test.c
>  F: tests/ahci-test.c
> +F: tests/libqos/ahci*
>  T: git git://github.com/jnsnow/qemu.git ide
>  
>  Floppy
> @@ -642,6 +643,7 @@ L: qemu-block@nongnu.org
>  S: Supported
>  F: hw/block/fdc.c
>  F: include/hw/block/fdc.h
> +F: tests/fdc-test.c
>  T: git git://github.com/jnsnow/qemu.git ide
>  
>  OMAP
> 

I am assuming this is OK to pull through my tree...

Tentatively staged. Barring objections, I will send a pull request for
this tomorrow, thanks.

https://github.com/jnsnow/qemu/commits/ide
https://github.com/jnsnow/qemu.git

--js

