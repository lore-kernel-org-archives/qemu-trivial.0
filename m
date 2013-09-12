Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJvdH-0002G7-JH
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 21:23:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VJvdB-00028e-Fy
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 21:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VJvd6-0005UL-Nj
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 21:23:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1VJvcw-0005RA-SX; Wed, 11 Sep 2013 21:23:23 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8C1NKHc001477
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 Sep 2013 21:23:20 -0400
Received: from localhost ([10.66.5.155])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8C1NJXP020316; Wed, 11 Sep 2013 21:23:20 -0400
Date: Thu, 12 Sep 2013 09:23:18 +0800
From: Fam Zheng <famz@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130912012318.GA9134@T430s.nay.redhat.com>
References: <1378918197-9036-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378918197-9036-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] ui/Makefile.objs: delete unnecessary
	cocoa.o dependency
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: famz@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2013 01:23:42 -0000

On Wed, 09/11 17:49, Peter Maydell wrote:
> Delete an unnecessary dependency for cocoa.o; we already have
> a general rule that tells Make that we can build a .o file
> from a .m source using an ObjC compiler, so this specific
> rule is unnecessary. Further, it is using the dubious construct
> "$(SRC_PATH)/$(obj)" to get at the source directory, which will
> break when $(obj) is redefined as part of the preparation for
> per-object library support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This needs to go in before Fam's patchset for modules
> can be applied, either via a cocoa maintainer queue or via
> -trivial or just as a first patch on the front of Fam's
> patches if they would otherwise be being held up by this.
> 

Sure, I'll apply to my tree and rebase if it's merged.

Thanks,

Fam

>  ui/Makefile.objs | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/ui/Makefile.objs b/ui/Makefile.objs
> index 6ddc0de..f33be47 100644
> --- a/ui/Makefile.objs
> +++ b/ui/Makefile.objs
> @@ -17,6 +17,4 @@ common-obj-$(CONFIG_GTK) += gtk.o x_keymap.o
>  
>  $(obj)/sdl.o $(obj)/sdl_zoom.o: QEMU_CFLAGS += $(SDL_CFLAGS) 
>  
> -$(obj)/cocoa.o: $(SRC_PATH)/$(obj)/cocoa.m
> -
>  $(obj)/gtk.o: QEMU_CFLAGS += $(GTK_CFLAGS) $(VTE_CFLAGS)
> -- 
> 1.7.11.4
> 

