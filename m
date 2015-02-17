Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNdQ4-0002rv-78
	for mharc-qemu-trivial@gnu.org; Tue, 17 Feb 2015 03:22:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNdQ1-0002nb-2R
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 03:22:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNdPx-0004HB-1k
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 03:22:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YNdPw-0004H4-RT; Tue, 17 Feb 2015 03:22:04 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1H8M0lL031103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Feb 2015 03:22:01 -0500
Received: from [10.36.116.45] (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1H8LwR3013077; Tue, 17 Feb 2015 03:21:59 -0500
Message-ID: <1424161317.6014.14.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Date: Tue, 17 Feb 2015 09:21:57 +0100
In-Reply-To: <1424122891-9390-3-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424122891-9390-3-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH 2/4] ui/console: Removed unused functions
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
X-List-Received-Date: Tue, 17 Feb 2015 08:22:10 -0000

On Mo, 2015-02-16 at 22:41 +0100, Thomas Huth wrote:
> Remove dpy_gfx_update_dirty(), qemu_console_get_head(),
> qemu_console_get_ui_info(), qemu_console_get_width(),
> qemu_console_get_height(), emu_console_displaystate(),
> qemu_different_endianness_pixelformat(), void cpkey(),
> qemu_pixman_linebuf_copy(), qemu_pixman_color(),
> emu_remove_kbd_event_handler() and vnc_stop_worker_thread()
> since they are completely unused.

Vetoing this one.  Some of them belong to work-in-progress bits and
should not be removed.

Also I think this kind of cleanup should be splitted into smaller
pieces, so it is easier to get specific bits back via "git revert"
should the need arise.

> -void dpy_gfx_update_dirty(QemuConsole *con,

Keep.

> -QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con)

Keep.

> -int qemu_console_get_width(QemuConsole *con, int fallback)
> -int qemu_console_get_height(QemuConsole *con, int fallback)

Hmm, not sure.  Separate patch please.

> -DisplayState *qemu_console_displaystate(QemuConsole *console)

Ok.

> -PixelFormat qemu_different_endianness_pixelformat(int bpp)

Ok.

> -void cpkey(register unsigned long *into)

Ok.

> -void qemu_remove_kbd_event_handler(QEMUPutKbdEntry *entry)

Ok.

> -void qemu_input_handler_deactivate(QemuInputHandlerState *s)

Hmm, might be needed in the future.  Separate patch please.

> -/* copy linebuf to framebuffer */
> -void qemu_pixman_linebuf_copy(pixman_image_t *fb, int width, int x, int y,
> -                              pixman_image_t *linebuf)
> -{
> -    pixman_image_composite(PIXMAN_OP_SRC, linebuf, NULL, fb,
> -                           0, 0, 0, 0, x, y, width, 1);
> -}

Keep.

> -pixman_color_t qemu_pixman_color(PixelFormat *pf, uint32_t color)
> -{
> -    pixman_color_t c;
> -
> -    c.red   = ((color & pf->rmask) >> pf->rshift) << (16 - pf->rbits);
> -    c.green = ((color & pf->gmask) >> pf->gshift) << (16 - pf->gbits);
> -    c.blue  = ((color & pf->bmask) >> pf->bshift) << (16 - pf->bbits);
> -    c.alpha = ((color & pf->amask) >> pf->ashift) << (16 - pf->abits);
> -    return c;
> -}

Not sure.  Separate patch please.

> -void vnc_stop_worker_thread(void)

Probably ok.  Separate patch would be nice.

cheers,
  Gerd



