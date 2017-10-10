Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1vlQ-0006T0-Po
	for mharc-qemu-trivial@gnu.org; Tue, 10 Oct 2017 10:44:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1e1vlH-0006Kg-06
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 10:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1e1vlD-0003G6-2l
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 10:43:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33340)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1e1vl5-0003Cs-Ev; Tue, 10 Oct 2017 10:43:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7901F25776;
	Tue, 10 Oct 2017 14:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7901F25776
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (unknown [10.33.36.82])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84F086954D;
	Tue, 10 Oct 2017 14:43:41 +0000 (UTC)
Date: Tue, 10 Oct 2017 15:43:37 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20171010144337.GG30015@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20171009150231.GN2954@redhat.com>
	<20171010102418.13487-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20171010102418.13487-1-anthony.perard@citrix.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 10 Oct 2017 14:43:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] ui/gtk: Fix deprecation of
 vte_terminal_copy_clipboard
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
X-List-Received-Date: Tue, 10 Oct 2017 14:44:07 -0000

On Tue, Oct 10, 2017 at 11:24:18AM +0100, Anthony PERARD wrote:
> vte_terminal_copy_clipboard() is deprecated in VTE 0.50.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  ui/gtk.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 5bd87c265a..342e96fbe9 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1702,7 +1702,12 @@ static void gd_menu_copy(GtkMenuItem *item, void *opaque)
>      GtkDisplayState *s = opaque;
>      VirtualConsole *vc = gd_vc_find_current(s);
>  
> +#if VTE_CHECK_VERSION(0, 50, 0)
> +    vte_terminal_copy_clipboard_format(VTE_TERMINAL(vc->vte.terminal),
> +                                       VTE_FORMAT_TEXT);
> +#else
>      vte_terminal_copy_clipboard(VTE_TERMINAL(vc->vte.terminal));
> +#endif
>  }
>  
>  static void gd_vc_adjustment_changed(GtkAdjustment *adjustment, void *opaque)

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

