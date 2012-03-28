Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCtHA-0005WB-Cu
	for mharc-qemu-trivial@gnu.org; Wed, 28 Mar 2012 09:51:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1SCtH3-0005Us-1O
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1SCtGw-0005vf-Rc
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:50:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1SCtGw-0005vA-Jg
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:50:46 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2SDoiGM029705
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <qemu-trivial@nongnu.org>; Wed, 28 Mar 2012 09:50:44 -0400
Received: from rincewind.home.kraxel.org (vpn1-7-153.ams2.redhat.com
	[10.36.7.153])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2SDohlB017299; Wed, 28 Mar 2012 09:50:43 -0400
Message-ID: <4F731732.4020307@redhat.com>
Date: Wed, 28 Mar 2012 15:50:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120307 Thunderbird/10.0.3
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1332927008-559-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1332927008-559-1-git-send-email-alevy@redhat.com>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace-events: remove unused
	qxl_vga_ioport_while_not_in_vga_mode
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
X-List-Received-Date: Wed, 28 Mar 2012 13:50:58 -0000

On 03/28/12 11:30, Alon Levy wrote:
> The resulting stp file fails to load because of an unresolvable probe.
> 
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  trace-events |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/trace-events b/trace-events
> index 0924666..322662b 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -781,7 +781,6 @@ qxl_spice_reset_memslots(int qid) "%d"
>  qxl_spice_update_area(int qid, uint32_t surface_id, uint32_t left, uint32_t right, uint32_t top, uint32_t bottom) "%d sid=%d [%d,%d,%d,%d]"
>  qxl_spice_update_area_rest(int qid, uint32_t num_dirty_rects, uint32_t clear_dirty_region) "%d #d=%d clear=%d"
>  qxl_surfaces_dirty(int qid, int surface, int offset, int size) "%d surface=%d offset=%d size=%d"
> -qxl_vga_ioport_while_not_in_vga_mode(int qid) "%d (int qid, reset to VGA mode because of VGA io)"
>  
>  # hw/qxl-render.c
>  qxl_render_blit_guest_primary_initialized(void) ""

Patch added to spice patch queue.

thanks,
  Gerd

