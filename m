Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SBkMi-000503-DZ
	for mharc-qemu-trivial@gnu.org; Sun, 25 Mar 2012 06:08:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SBkMf-0004zP-Uz
	for qemu-trivial@nongnu.org; Sun, 25 Mar 2012 06:07:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SBkMe-0006ta-7k
	for qemu-trivial@nongnu.org; Sun, 25 Mar 2012 06:07:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1SBkMd-0006tP-WB; Sun, 25 Mar 2012 06:07:56 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2PA7rf4013977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 25 Mar 2012 06:07:53 -0400
Received: from garlic (vpn-201-59.tlv.redhat.com [10.35.201.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2P9L9Cr016805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Sun, 25 Mar 2012 05:21:13 -0400
Date: Sun, 25 Mar 2012 11:21:08 +0200
From: Alon Levy <alevy@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120325092108.GN23394@garlic>
Mail-Followup-To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <1332573214-8485-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332573214-8485-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace-events: Fix broken build caused by
 wrong format specifier
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
X-List-Received-Date: Sun, 25 Mar 2012 10:07:59 -0000

On Sat, Mar 24, 2012 at 08:13:34AM +0100, Stefan Weil wrote:
> mem is an uint64_t value, so %lx was wrong.
> 

Thanks,

ACK

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  trace-events |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/trace-events b/trace-events
> index 70f059d..db2cd39 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -726,7 +726,7 @@ ppm_save(const char *filename, void *display_surface) "%s surface=%p"
>  # hw/qxl.c
>  disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
>  disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint32_t val) "%d %s addr=%u val=%u"
> -qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %dx%d mem=%lx %d,%d"
> +qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %ux%u mem=%" PRIx64 " %u,%u"
>  qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, uint32_t flags) "%d %d,%d,%d"
>  qxl_destroy_primary(int qid) "%d"
>  qxl_enter_vga_mode(int qid) "%d"
> -- 
> 1.7.0.4
> 

