Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esvgb-0007PT-Az
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 14:22:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=595409ade=anthony.perard@citrix.com>)
	id 1esvgZ-0007OD-CR
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 14:22:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=595409ade=anthony.perard@citrix.com>)
	id 1esvgW-0001ip-OE
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 14:22:11 -0500
Received: from smtp.citrix.com ([66.165.176.89]:31188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <prvs=595409ade=anthony.perard@citrix.com>)
	id 1esvgW-0001iY-HT
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 14:22:08 -0500
X-IronPort-AV: E=Sophos;i="5.47,428,1515456000"; d="scan'208";a="466384539"
Date: Mon, 5 Mar 2018 18:52:51 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
CC: <qemu-trivial@nongnu.org>, <qemu-devel@nongnu.org>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Stefano
	Stabellini <sstabellini@kernel.org>, "open list:X86"
	<xen-devel@lists.xenproject.org>
Message-ID: <20180305185251.GB1921@perard.uk.xensource.com>
References: <20180305112732.26471-1-f4bug@amsat.org>
	<20180305112732.26471-23-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180305112732.26471-23-f4bug@amsat.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Subject: Re: [Qemu-trivial] [PATCH v2 22/30] hw/display: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 19:22:12 -0000

On Mon, Mar 05, 2018 at 08:27:24AM -0300, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
> 
> and modified manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/xenfb.c      |  2 +-
> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> index f5afcc0358..1ae660519a 100644
> --- a/hw/display/xenfb.c
> +++ b/hw/display/xenfb.c
> @@ -889,7 +889,7 @@ static int fb_initialise(struct XenDevice *xendev)
>  	return rc;
>  
>      fb_page = fb->c.page;
> -    rc = xenfb_configure_fb(fb, videoram * 1024 * 1024U,
> +    rc = xenfb_configure_fb(fb, videoram * M_BYTE,
>  			    fb_page->width, fb_page->height, fb_page->depth,
>  			    fb_page->mem_length, 0, fb_page->line_length);
>      if (rc != 0)

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

