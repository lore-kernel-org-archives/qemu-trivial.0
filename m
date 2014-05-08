Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WiNdV-0006at-UO
	for mharc-qemu-trivial@gnu.org; Thu, 08 May 2014 08:41:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WiNdQ-0006RM-0L
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 08:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WiNdL-0002qJ-7A
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 08:41:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WiNdB-0002pB-H1; Thu, 08 May 2014 08:40:57 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s48Ceunp004217
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 8 May 2014 08:40:56 -0400
Received: from localhost (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s48CetNt023176; Thu, 8 May 2014 08:40:55 -0400
Date: Thu, 8 May 2014 20:41:08 +0800
From: Fam Zheng <famz@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140508124108.GB23579@T430.nay.redhat.com>
References: <1399546949-16197-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1399546949-16197-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Alon Levy <alevy@redhat.com>, qemu-devel@nongnu.org,
	Hollis Blanchard <hollis@penguinppc.org>
Subject: Re: [Qemu-trivial] [PATCH] Makefile.target: use $(INSTALL_PROG) for
 installing, not $(INSTALL)
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
X-List-Received-Date: Thu, 08 May 2014 12:41:16 -0000

On Thu, 05/08 15:02, Michael Tokarev wrote:
> $(INSTALL_PROG) is evaluated to libtool if using libtool, while
> $(INSTALL) is not.  Use $(INSTALL_PROG) so that libtool is used
> with target too when necessary.  This allows, for example, to
> link qemu with shared libcacard.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Fam Zheng <famz@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Alon Levy <alevy@redhat.com>
> Cc: qemu-trivial@nongnu.org

Reviewed-by: Fam Zheng <famz@redhat.com>

> --
> This is done on top of previous patch (using $(STRIP)), but it can
> be used by its own.
> ---
>  Makefile.target |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile.target b/Makefile.target
> index 8de8b12..3b75ade 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -194,7 +194,7 @@ endif
>  
>  install: all
>  ifneq ($(PROGS),)
> -	$(INSTALL) -m 755 $(PROGS) "$(DESTDIR)$(bindir)"
> +	$(INSTALL_PROG) $(PROGS) "$(DESTDIR)$(bindir)"
>  ifneq ($(STRIP),)
>  	$(STRIP) $(PROGS:%="$(DESTDIR)$(bindir)/%")
>  endif
> -- 
> 1.7.10.4
> 

