Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SdxXD-0007b7-QA
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2012 01:51:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SdxXB-0007St-3B
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2012 01:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SdxX9-0007ff-Fj
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2012 01:51:24 -0400
Received: from mx3-phx2.redhat.com ([209.132.183.24]:56663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1SdxX6-0007ez-BS; Mon, 11 Jun 2012 01:51:20 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id q5B5pGNk014760;
	Mon, 11 Jun 2012 01:51:16 -0400
Date: Mon, 11 Jun 2012 01:51:16 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Message-ID: <623e85e3-4c0d-4af4-8c74-28162091981f@zmail13.collab.prod.int.phx2.redhat.com>
In-Reply-To: <1339243002-13760-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Originating-IP: [10.36.112.17]
X-Mailer: Zimbra 7.1.2_GA_3268 (ZimbraWebClient - FF3.0 (Linux)/7.1.2_GA_3268)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.24
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile.user: Define CONFIG_USER_ONLY
	for libuser/
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
X-List-Received-Date: Mon, 11 Jun 2012 05:51:26 -0000



----- Messaggio originale -----
> Da: "Andreas F=C3=A4rber" <afaerber@suse.de>
> A: qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, "Andreas F=C3=A4rber" <=
afaerber@suse.de>
> Inviato: Sabato, 9 giugno 2012 13:56:42
> Oggetto: [PATCH] Makefile.user: Define CONFIG_USER_ONLY for libuser/
> 
> In *-*-user/ build dirs CONFIG_USER_ONLY is defined via
> config-target.h.
> In libuser/ it is not defined.
> 
> Add it via QEMU_CFLAGS.
> 
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> ---
>  Soon needed for cpu.c.
> 
>  Makefile.user |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/Makefile.user b/Makefile.user
> index b717820..ab70eb3 100644
> --- a/Makefile.user
> +++ b/Makefile.user
> @@ -10,6 +10,7 @@ $(call set-vpath, $(SRC_PATH))
>  
>  QEMU_CFLAGS+=3D-I..
>  QEMU_CFLAGS +=3D -I$(SRC_PATH)/include
> +QEMU_CFLAGS +=3D -DCONFIG_USER_ONLY
>  
>  include $(SRC_PATH)/Makefile.objs
>  
> --
> 1.7.7
> 
> 

