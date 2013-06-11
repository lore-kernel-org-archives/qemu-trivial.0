Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmMLT-0004l1-3u
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:02:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1UmMLM-0004cW-Rd
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1UmMLL-00011G-I1
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:02:28 -0400
Received: from smtp02.citrix.com ([66.165.176.63]:57829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1UmMLD-0000zz-T6; Tue, 11 Jun 2013 07:02:19 -0400
X-IronPort-AV: E=Sophos;i="4.87,844,1363132800"; d="scan'208";a="28957838"
Received: from accessns.citrite.net (HELO FTLPEX01CL01.citrite.net)
	([10.9.154.239]) by FTLPIPO02.CITRIX.COM with ESMTP/TLS/AES128-SHA;
	11 Jun 2013 11:02:19 +0000
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Jun 2013 07:02:18 -0400
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1UmMLC-0001Pn-5w;
	Tue, 11 Jun 2013 12:02:18 +0100
Date: Tue, 11 Jun 2013 12:02:14 +0100
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <1370896582-11910-1-git-send-email-sw@weilnetz.de>
Message-ID: <alpine.DEB.2.02.1306111200260.4548@kaball.uk.xensource.com>
References: <1370896582-11910-1-git-send-email-sw@weilnetz.de>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: qemu-trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/xen: Use g_free instead of free and
 fix potential memory leaks
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
X-List-Received-Date: Tue, 11 Jun 2013 11:02:33 -0000

On Mon, 10 Jun 2013, Stefan Weil wrote:
> The wrong functions and the missing calls of g_free were reported
> by cppcheck.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Are you happy to get this patch upstream via qemu-trivial? Or do you
want me to pick it up?


>  hw/xen/xen_pt_config_init.c |    4 ++--
>  xen-all.c                   |    8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index 01872db..8ccc2e4 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -1777,12 +1777,12 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
>          rc = reg->init(s, reg_entry->reg,
>                         reg_grp->base_offset + reg->offset, &data);
>          if (rc < 0) {
> -            free(reg_entry);
> +            g_free(reg_entry);
>              return rc;
>          }
>          if (data == XEN_PT_INVALID_REG) {
>              /* free unused BAR register entry */
> -            free(reg_entry);
> +            g_free(reg_entry);
>              return 0;
>          }
>          /* set register value */
> diff --git a/xen-all.c b/xen-all.c
> index bc105f1..1a1d7bb 100644
> --- a/xen-all.c
> +++ b/xen-all.c
> @@ -389,7 +389,7 @@ static int xen_remove_from_physmap(XenIOState *state,
>      if (state->log_for_dirtybit == physmap) {
>          state->log_for_dirtybit = NULL;
>      }
> -    free(physmap);
> +    g_free(physmap);
>  
>      return 0;
>  }
> @@ -1030,7 +1030,7 @@ static void xen_read_physmap(XenIOState *state)
>                  xen_domid, entries[i]);
>          value = xs_read(state->xenstore, 0, path, &len);
>          if (value == NULL) {
> -            free(physmap);
> +            g_free(physmap);
>              continue;
>          }
>          physmap->start_addr = strtoull(value, NULL, 16);
> @@ -1041,7 +1041,7 @@ static void xen_read_physmap(XenIOState *state)
>                  xen_domid, entries[i]);
>          value = xs_read(state->xenstore, 0, path, &len);
>          if (value == NULL) {
> -            free(physmap);
> +            g_free(physmap);
>              continue;
>          }
>          physmap->size = strtoull(value, NULL, 16);
> @@ -1069,12 +1069,14 @@ int xen_hvm_init(void)
>      state->xce_handle = xen_xc_evtchn_open(NULL, 0);
>      if (state->xce_handle == XC_HANDLER_INITIAL_VALUE) {
>          perror("xen: event channel open");
> +        g_free(state);
>          return -errno;
>      }
>  
>      state->xenstore = xs_daemon_open();
>      if (state->xenstore == NULL) {
>          perror("xen: xenstore open");
> +        g_free(state);
>          return -errno;
>      }
>  
> -- 
> 1.7.10.4
> 

