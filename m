Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T45vK-0006Go-7h
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 04:04:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1T45vE-000625-GG
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 04:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1T45v7-0000UB-7D
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 04:04:16 -0400
Received: from mout.web.de ([212.227.17.11]:55567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1T45uv-0000Se-FD; Wed, 22 Aug 2012 04:03:57 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb001) with ESMTPSA (Nemesis) id 0M2Mq4-1Ttj8C04qS-00sIU6;
	Wed, 22 Aug 2012 10:03:56 +0200
Message-ID: <5034926B.5020808@web.de>
Date: Wed, 22 Aug 2012 10:03:55 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <Pine.GSO.4.64.1208212333210.11653@mono>
In-Reply-To: <Pine.GSO.4.64.1208212333210.11653@mono>
X-Enigmail-Version: 1.4.3
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig17BF3780804E49EDA0A467DD"
X-Provags-ID: V02:K0:ojoJn7RW6WdUIEuOuLp8KLAirU10Y0Z8By1L+772t99
	oJ+XvLflzfu3m5BGIl/eibcXuMr8bKvRf+uhSVO9/kJm5t5qag
	TxEub1gb1UYZhEIFkHu0T/eiambjs0nAeNSYGq4pzGFbC5DRxw
	KC8qQt0v5kMJp+gMQJvsDaQbJKQr3tgOrDiLQtky0qBGUsAPEh
	4KHkELZJY8fXZXbbeI7/w==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.11
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmware_vga: Cleanup and allow simple
 drivers to work without the fifo
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
X-List-Received-Date: Wed, 22 Aug 2012 08:04:20 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig17BF3780804E49EDA0A467DD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2012-08-21 23:33, BALATON Zoltan wrote:
>=20
> Detailed changes: Removing info available elsewhere from vmsvga_state.
> Fix mixup between depth and bits per pixel. Return a value for FB_SIZE
> even before enabled (according to the documentation, drivers should
> read this value before enabling the device). Postpone stopping the
> dirty log to the point where the command fifo is configured to allow
> drivers which don't use the fifo to work too. (Without this the
> picture rendered into the vram never got to the screen but the
> DIRECT_VRAM option meant to support this case was removed a year ago.)

This is a rather big patch. I strongly suspect you can break it up into
smaller pieces that address separate aspects one-by-one. Also, it is
definitely to heavy for "qemu-trivial".

Jan

>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  console.h       |   20 +++++
>  hw/vga.c        |    2 +-
>  hw/vga_int.h    |    1 +
>  hw/vmware_vga.c |  243
> ++++++++++++++++++++++++++-----------------------------
>  4 files changed, 137 insertions(+), 129 deletions(-)
>=20
> diff --git a/console.h b/console.h
> index 4334db5..00baf5b 100644
> --- a/console.h
> +++ b/console.h
> @@ -328,6 +328,26 @@ static inline int
> ds_get_bytes_per_pixel(DisplayState *ds)
>      return ds->surface->pf.bytes_per_pixel;
>  }
>=20
> +static inline int ds_get_depth(DisplayState *ds)
> +{
> +    return ds->surface->pf.depth;
> +}
> +
> +static inline int ds_get_rmask(DisplayState *ds)
> +{
> +    return ds->surface->pf.rmask;
> +}
> +
> +static inline int ds_get_gmask(DisplayState *ds)
> +{
> +    return ds->surface->pf.gmask;
> +}
> +
> +static inline int ds_get_bmask(DisplayState *ds)
> +{
> +    return ds->surface->pf.bmask;
> +}
> +
>  #ifdef CONFIG_CURSES
>  #include <curses.h>
>  typedef chtype console_ch_t;
> diff --git a/hw/vga.c b/hw/vga.c
> index f82ced8..7e6dc41 100644
> --- a/hw/vga.c
> +++ b/hw/vga.c
> @@ -1611,7 +1611,7 @@ void vga_invalidate_scanlines(VGACommonState *s,
> int y1, int y2)
>      }
>  }
>=20
> -static void vga_sync_dirty_bitmap(VGACommonState *s)
> +void vga_sync_dirty_bitmap(VGACommonState *s)
>  {
>      memory_region_sync_dirty_bitmap(&s->vram);
>  }
> diff --git a/hw/vga_int.h b/hw/vga_int.h
> index 8938093..16d53ef 100644
> --- a/hw/vga_int.h
> +++ b/hw/vga_int.h
> @@ -195,6 +195,7 @@ MemoryRegion *vga_init_io(VGACommonState *s,
>                            const MemoryRegionPortio **vbe_ports);
>  void vga_common_reset(VGACommonState *s);
>=20
> +void vga_sync_dirty_bitmap(VGACommonState *s);
>  void vga_dirty_log_start(VGACommonState *s);
>  void vga_dirty_log_stop(VGACommonState *s);
>=20
> diff --git a/hw/vmware_vga.c b/hw/vmware_vga.c
> index f5e4f44..2b77766 100644
> --- a/hw/vmware_vga.c
> +++ b/hw/vmware_vga.c
> @@ -32,16 +32,19 @@
>  #define HW_FILL_ACCEL
>  #define HW_MOUSE_ACCEL
>=20
> -# include "vga_int.h"
> +#include "vga_int.h"
> +
> +/* See http://vmware-svga.sf.net/ for some documentation on VMWare SVG=
A */
>=20
>  struct vmsvga_state_s {
>      VGACommonState vga;
>=20
> -    int width;
> -    int height;
> +/* -*- The members marked are now unused and could be removed but they=
 are
> + *     contained in the VMState thus need special handling. Maybe they=

> could
> + *     be removed the next time a new machine type is added.
> + */
>      int invalidated;
> -    int depth;
> -    int bypp;
> +    int depth;  /* -*- */
>      int enable;
>      int config;
>      struct {
> @@ -58,11 +61,8 @@ struct vmsvga_state_s {
>      int new_height;
>      uint32_t guest;
>      uint32_t svgaid;
> -    uint32_t wred;
> -    uint32_t wgreen;
> -    uint32_t wblue;
>      int syncing;
> -    int fb_size;
> +    int fb_size;  /* -*- */
>=20
>      MemoryRegion fifo_ram;
>      uint8_t *fifo_ptr;
> @@ -298,40 +298,33 @@ static inline void vmsvga_update_rect(struct
> vmsvga_state_s *s,
>      uint8_t *src;
>      uint8_t *dst;
>=20
> -    if (x + w > s->width) {
> +    if (x + w > ds_get_width(s->vga.ds)) {
>          fprintf(stderr, "%s: update width too large x: %d, w: %d\n",
> -                        __FUNCTION__, x, w);
> -        x =3D MIN(x, s->width);
> -        w =3D s->width - x;
> +                        __func__, x, w);
> +        x =3D MIN(x, ds_get_width(s->vga.ds));
> +        w =3D ds_get_width(s->vga.ds) - x;
>      }
>=20
> -    if (y + h > s->height) {
> +    if (y + h > ds_get_height(s->vga.ds)) {
>          fprintf(stderr, "%s: update height too large y: %d, h: %d\n",
> -                        __FUNCTION__, y, h);
> -        y =3D MIN(y, s->height);
> -        h =3D s->height - y;
> +                        __func__, y, h);
> +        y =3D MIN(y, ds_get_height(s->vga.ds));
> +        h =3D ds_get_height(s->vga.ds) - y;
>      }
>=20
> -    line =3D h;
> -    bypl =3D s->bypp * s->width;
> -    width =3D s->bypp * w;
> -    start =3D s->bypp * x + bypl * y;
> +    bypl =3D ds_get_linesize(s->vga.ds);
> +    width =3D ds_get_bytes_per_pixel(s->vga.ds) * w;
> +    start =3D ds_get_bytes_per_pixel(s->vga.ds) * x + bypl * y;
>      src =3D s->vga.vram_ptr + start;
>      dst =3D ds_get_data(s->vga.ds) + start;
>=20
> -    for (; line > 0; line --, src +=3D bypl, dst +=3D bypl)
> +    for (line =3D h; line > 0; line--, src +=3D bypl, dst +=3D bypl) {=

>          memcpy(dst, src, width);
> +    }
>=20
>      dpy_update(s->vga.ds, x, y, w, h);
>  }
>=20
> -static inline void vmsvga_update_screen(struct vmsvga_state_s *s)
> -{
> -    memcpy(ds_get_data(s->vga.ds), s->vga.vram_ptr,
> -           s->bypp * s->width * s->height);
> -    dpy_update(s->vga.ds, 0, 0, s->width, s->height);
> -}
> -
>  static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s *s=
,
>                  int x, int y, int w, int h)
>  {
> @@ -364,20 +357,21 @@ static inline void vmsvga_copy_rect(struct
> vmsvga_state_s *s,
>                  int x0, int y0, int x1, int y1, int w, int h)
>  {
>      uint8_t *vram =3D s->vga.vram_ptr;
> -    int bypl =3D s->bypp * s->width;
> -    int width =3D s->bypp * w;
> +    int bypl =3D ds_get_linesize(s->vga.ds);
> +    int bypp =3D ds_get_bytes_per_pixel(s->vga.ds);
> +    int width =3D bypp * w;
>      int line =3D h;
>      uint8_t *ptr[2];
>=20
>      if (y1 > y0) {
> -        ptr[0] =3D vram + s->bypp * x0 + bypl * (y0 + h - 1);
> -        ptr[1] =3D vram + s->bypp * x1 + bypl * (y1 + h - 1);
> +        ptr[0] =3D vram + bypp * x0 + bypl * (y0 + h - 1);
> +        ptr[1] =3D vram + bypp * x1 + bypl * (y1 + h - 1);
>          for (; line > 0; line --, ptr[0] -=3D bypl, ptr[1] -=3D bypl) =
{
>              memmove(ptr[1], ptr[0], width);
>          }
>      } else {
> -        ptr[0] =3D vram + s->bypp * x0 + bypl * y0;
> -        ptr[1] =3D vram + s->bypp * x1 + bypl * y1;
> +        ptr[0] =3D vram + bypp * x0 + bypl * y0;
> +        ptr[1] =3D vram + bypp * x1 + bypl * y1;
>          for (; line > 0; line --, ptr[0] +=3D bypl, ptr[1] +=3D bypl) =
{
>              memmove(ptr[1], ptr[0], width);
>          }
> @@ -391,13 +385,11 @@ static inline void vmsvga_copy_rect(struct
> vmsvga_state_s *s,
>  static inline void vmsvga_fill_rect(struct vmsvga_state_s *s,
>                  uint32_t c, int x, int y, int w, int h)
>  {
> -    uint8_t *vram =3D s->vga.vram_ptr;
> -    int bypp =3D s->bypp;
> -    int bypl =3D bypp * s->width;
> -    int width =3D bypp * w;
> +    int bypl =3D ds_get_linesize(s->vga.ds);
> +    int width =3D ds_get_bytes_per_pixel(s->vga.ds) * w;
>      int line =3D h;
>      int column;
> -    uint8_t *fst =3D vram + bypp * x + bypl * y;
> +    uint8_t *fst;
>      uint8_t *dst;
>      uint8_t *src;
>      uint8_t col[4];
> @@ -407,12 +399,14 @@ static inline void vmsvga_fill_rect(struct
> vmsvga_state_s *s,
>      col[2] =3D c >> 16;
>      col[3] =3D c >> 24;
>=20
> +    fst =3D s->vga.vram_ptr + ds_get_bytes_per_pixel(s->vga.ds) * x +
> bypl * y;
> +
>      if (line--) {
>          dst =3D fst;
>          src =3D col;
>          for (column =3D width; column > 0; column--) {
>              *(dst++) =3D *(src++);
> -            if (src - col =3D=3D bypp) {
> +            if (src - col =3D=3D ds_get_bytes_per_pixel(s->vga.ds)) {
>                  src =3D col;
>              }
>          }
> @@ -474,7 +468,7 @@ static inline void vmsvga_cursor_define(struct
> vmsvga_state_s *s,
>          break;
>      default:
>          fprintf(stderr, "%s: unhandled bpp %d, using fallback cursor\n=
",
> -                __FUNCTION__, c->bpp);
> +                        __func__, c->bpp);
>          cursor_put(qc);
>          qc =3D cursor_builtin_left_ptr();
>      }
> @@ -665,7 +659,7 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *=
s)
>              while (args --)
>                  vmsvga_fifo_read(s);
>              printf("%s: Unknown command 0x%02x in SVGA command FIFO\n"=
,
> -                            __FUNCTION__, cmd);
> +                   __func__, cmd);
>              break;
>=20
>          rewind:
> @@ -701,10 +695,10 @@ static uint32_t vmsvga_value_read(void *opaque,
> uint32_t address)
>          return s->enable;
>=20
>      case SVGA_REG_WIDTH:
> -        return s->width;
> +        return ds_get_width(s->vga.ds);
>=20
>      case SVGA_REG_HEIGHT:
> -        return s->height;
> +        return ds_get_height(s->vga.ds);
>=20
>      case SVGA_REG_MAX_WIDTH:
>          return SVGA_MAX_WIDTH;
> @@ -713,23 +707,25 @@ static uint32_t vmsvga_value_read(void *opaque,
> uint32_t address)
>          return SVGA_MAX_HEIGHT;
>=20
>      case SVGA_REG_DEPTH:
> -        return s->depth;
> +        return ds_get_depth(s->vga.ds);
>=20
>      case SVGA_REG_BITS_PER_PIXEL:
> -        return (s->depth + 7) & ~7;
> +        return ds_get_bits_per_pixel(s->vga.ds);
>=20
>      case SVGA_REG_PSEUDOCOLOR:
>          return 0x0;
>=20
>      case SVGA_REG_RED_MASK:
> -        return s->wred;
> +        return ds_get_rmask(s->vga.ds);
> +
>      case SVGA_REG_GREEN_MASK:
> -        return s->wgreen;
> +        return ds_get_gmask(s->vga.ds);
> +
>      case SVGA_REG_BLUE_MASK:
> -        return s->wblue;
> +        return ds_get_bmask(s->vga.ds);
>=20
>      case SVGA_REG_BYTES_PER_LINE:
> -        return ((s->depth + 7) >> 3) * s->new_width;
> +        return ds_get_bytes_per_pixel(s->vga.ds) * s->new_width;
>=20
>      case SVGA_REG_FB_START: {
>          struct pci_vmsvga_state_s *pci_vmsvga
> @@ -741,10 +737,10 @@ static uint32_t vmsvga_value_read(void *opaque,
> uint32_t address)
>          return 0x0;
>=20
>      case SVGA_REG_VRAM_SIZE:
> -        return s->vga.vram_size;
> +        return s->vga.vram_size; /* No physical VRAM besides the
> framebuffer */
>=20
>      case SVGA_REG_FB_SIZE:
> -        return s->fb_size;
> +        return s->vga.vram_size;
>=20
>      case SVGA_REG_CAPABILITIES:
>          caps =3D SVGA_CAP_NONE;
> @@ -793,7 +789,7 @@ static uint32_t vmsvga_value_read(void *opaque,
> uint32_t address)
>          return s->cursor.on;
>=20
>      case SVGA_REG_HOST_BITS_PER_PIXEL:
> -        return (s->depth + 7) & ~7;
> +        return ds_get_bits_per_pixel(s->vga.ds);
>=20
>      case SVGA_REG_SCRATCH_SIZE:
>          return s->scratch_size;
> @@ -808,7 +804,7 @@ static uint32_t vmsvga_value_read(void *opaque,
> uint32_t address)
>          if (s->index >=3D SVGA_SCRATCH_BASE &&
>                  s->index < SVGA_SCRATCH_BASE + s->scratch_size)
>              return s->scratch[s->index - SVGA_SCRATCH_BASE];
> -        printf("%s: Bad register %02x\n", __FUNCTION__, s->index);
> +        printf("%s: Bad register %02x\n", __func__, s->index);
>      }
>=20
>      return 0;
> @@ -824,14 +820,10 @@ static void vmsvga_value_write(void *opaque,
> uint32_t address, uint32_t value)
>          break;
>=20
>      case SVGA_REG_ENABLE:
> -        s->enable =3D value;
> -        s->config &=3D !!value;
> -        s->width =3D -1;
> -        s->height =3D -1;
> +        s->enable =3D !!value;
>          s->invalidated =3D 1;
>          s->vga.invalidate(&s->vga);
> -        if (s->enable) {
> -            s->fb_size =3D ((s->depth + 7) >> 3) * s->new_width *
> s->new_height;
> +        if (s->enable && s->config) {
>              vga_dirty_log_stop(&s->vga);
>          } else {
>              vga_dirty_log_start(&s->vga);
> @@ -839,19 +831,26 @@ static void vmsvga_value_write(void *opaque,
> uint32_t address, uint32_t value)
>          break;
>=20
>      case SVGA_REG_WIDTH:
> -        s->new_width =3D value;
> -        s->invalidated =3D 1;
> +        if (value <=3D SVGA_MAX_WIDTH) {
> +            s->new_width =3D value;
> +            s->invalidated =3D 1;
> +        } else {
> +            printf("%s: Bad width: %i\n", __func__, value);
> +        }
>          break;
>=20
>      case SVGA_REG_HEIGHT:
> -        s->new_height =3D value;
> -        s->invalidated =3D 1;
> +        if (value <=3D SVGA_MAX_HEIGHT) {
> +            s->new_height =3D value;
> +            s->invalidated =3D 1;
> +        } else {
> +            printf("%s: Bad height: %i\n", __func__, value);
> +        }
>          break;
>=20
> -    case SVGA_REG_DEPTH:
>      case SVGA_REG_BITS_PER_PIXEL:
> -        if (value !=3D s->depth) {
> -            printf("%s: Bad colour depth: %i bits\n", __FUNCTION__,
> value);
> +        if (value !=3D ds_get_bits_per_pixel(s->vga.ds)) {
> +            printf("%s: Bad bits per pixel: %i bits\n", __func__, valu=
e);
>              s->config =3D 0;
>          }
>          break;
> @@ -860,15 +859,19 @@ static void vmsvga_value_write(void *opaque,
> uint32_t address, uint32_t value)
>          if (value) {
>              s->fifo =3D (uint32_t *) s->fifo_ptr;
>              /* Check range and alignment.  */
> -            if ((CMD(min) | CMD(max) |
> -                        CMD(next_cmd) | CMD(stop)) & 3)
> +            if ((CMD(min) | CMD(max) | CMD(next_cmd) | CMD(stop)) & 3)=
 {
>                  break;
> -            if (CMD(min) < (uint8_t *) s->cmd->fifo - (uint8_t *) s->f=
ifo)
> +            }
> +            if (CMD(min) < (uint8_t *) s->cmd->fifo - (uint8_t *)
> s->fifo) {
>                  break;
> -            if (CMD(max) > SVGA_FIFO_SIZE)
> +            }
> +            if (CMD(max) > SVGA_FIFO_SIZE) {
>                  break;
> -            if (CMD(max) < CMD(min) + 10 * 1024)
> +            }
> +            if (CMD(max) < CMD(min) + 10 * 1024) {
>                  break;
> +            }
> +            vga_dirty_log_stop(&s->vga);
>          }
>          s->config =3D !!value;
>          break;
> @@ -883,8 +886,8 @@ static void vmsvga_value_write(void *opaque,
> uint32_t address, uint32_t value)
>  #ifdef VERBOSE
>          if (value >=3D GUEST_OS_BASE && value < GUEST_OS_BASE +
>                  ARRAY_SIZE(vmsvga_guest_id))
> -            printf("%s: guest runs %s.\n", __FUNCTION__,
> -                            vmsvga_guest_id[value - GUEST_OS_BASE]);
> +            printf("%s: guest runs %s.\n", __func__,
> +                   vmsvga_guest_id[value - GUEST_OS_BASE]);
>  #endif
>          break;
>=20
> @@ -909,6 +912,7 @@ static void vmsvga_value_write(void *opaque,
> uint32_t address, uint32_t value)
>  #endif
>          break;
>=20
> +    case SVGA_REG_DEPTH:
>      case SVGA_REG_MEM_REGS:
>      case SVGA_REG_NUM_DISPLAYS:
>      case SVGA_REG_PITCHLOCK:
> @@ -921,28 +925,26 @@ static void vmsvga_value_write(void *opaque,
> uint32_t address, uint32_t value)
>              s->scratch[s->index - SVGA_SCRATCH_BASE] =3D value;
>              break;
>          }
> -        printf("%s: Bad register %02x\n", __FUNCTION__, s->index);
> +        printf("%s: Bad register %02x\n", __func__, s->index);
>      }
>  }
>=20
>  static uint32_t vmsvga_bios_read(void *opaque, uint32_t address)
>  {
> -    printf("%s: what are we supposed to return?\n", __FUNCTION__);
> +    printf("%s: what are we supposed to return?\n", __func__);
>      return 0xcafe;
>  }
>=20
>  static void vmsvga_bios_write(void *opaque, uint32_t address, uint32_t=

> data)
>  {
> -    printf("%s: what are we supposed to do with (%08x)?\n",
> -                    __FUNCTION__, data);
> +    printf("%s: what are we supposed to do with (%08x)?\n", __func__,
> data);
>  }
>=20
> -static inline void vmsvga_size(struct vmsvga_state_s *s)
> +static inline void vmsvga_check_size(struct vmsvga_state_s *s)
>  {
> -    if (s->new_width !=3D s->width || s->new_height !=3D s->height) {
> -        s->width =3D s->new_width;
> -        s->height =3D s->new_height;
> -        qemu_console_resize(s->vga.ds, s->width, s->height);
> +    if (s->new_width !=3D ds_get_width(s->vga.ds) ||
> +        s->new_height !=3D ds_get_height(s->vga.ds)) {
> +        qemu_console_resize(s->vga.ds, s->new_width, s->new_height);
>          s->invalidated =3D 1;
>      }
>  }
> @@ -950,12 +952,14 @@ static inline void vmsvga_size(struct
> vmsvga_state_s *s)
>  static void vmsvga_update_display(void *opaque)
>  {
>      struct vmsvga_state_s *s =3D opaque;
> +    bool dirty =3D false;
> +
>      if (!s->enable) {
>          s->vga.update(&s->vga);
>          return;
>      }
>=20
> -    vmsvga_size(s);
> +    vmsvga_check_size(s);
>=20
>      vmsvga_fifo_run(s);
>      vmsvga_update_rect_flush(s);
> @@ -964,9 +968,23 @@ static void vmsvga_update_display(void *opaque)
>       * Is it more efficient to look at vram VGA-dirty bits or wait
>       * for the driver to issue SVGA_CMD_UPDATE?
>       */
> -    if (s->invalidated) {
> +    if (memory_region_is_logging(&s->vga.vram)) {
> +        vga_sync_dirty_bitmap(&s->vga);
> +        dirty =3D memory_region_get_dirty(&s->vga.vram, 0,
> +            ds_get_linesize(s->vga.ds) * ds_get_height(s->vga.ds),
> +            DIRTY_MEMORY_VGA);
> +    }
> +    if (s->invalidated || dirty) {
>          s->invalidated =3D 0;
> -        vmsvga_update_screen(s);
> +        memcpy(ds_get_data(s->vga.ds), s->vga.vram_ptr,
> +               ds_get_linesize(s->vga.ds) * ds_get_height(s->vga.ds));=

> +        dpy_update(s->vga.ds, 0, 0,
> +               ds_get_width(s->vga.ds), ds_get_height(s->vga.ds));
> +    }
> +    if (dirty) {
> +        memory_region_reset_dirty(&s->vga.vram, 0,
> +            ds_get_linesize(s->vga.ds) * ds_get_height(s->vga.ds),
> +            DIRTY_MEMORY_VGA);
>      }
>  }
>=20
> @@ -979,8 +997,6 @@ static void vmsvga_reset(DeviceState *dev)
>      s->index =3D 0;
>      s->enable =3D 0;
>      s->config =3D 0;
> -    s->width =3D -1;
> -    s->height =3D -1;
>      s->svgaid =3D SVGA_ID;
>      s->cursor.on =3D 0;
>      s->redraw_fifo_first =3D 0;
> @@ -1011,9 +1027,13 @@ static void vmsvga_screen_dump(void *opaque,
> const char *filename, bool cswitch)
>          return;
>      }
>=20
> -    if (s->depth =3D=3D 32) {
> -        DisplaySurface *ds =3D qemu_create_displaysurface_from(s->widt=
h,
> -                s->height, 32, ds_get_linesize(s->vga.ds),
> s->vga.vram_ptr);
> +    if (ds_get_bits_per_pixel(s->vga.ds) =3D=3D 32) {
> +        DisplaySurface *ds =3D qemu_create_displaysurface_from(
> +                                 ds_get_width(s->vga.ds),
> +                                 ds_get_height(s->vga.ds),
> +                                 32,
> +                                 ds_get_linesize(s->vga.ds),
> +                                 s->vga.vram_ptr);
>          ppm_save(filename, ds);
>          g_free(ds);
>      }
> @@ -1098,36 +1118,6 @@ static void vmsvga_init(struct vmsvga_state_s *s=
,
>      vga_common_init(&s->vga);
>      vga_init(&s->vga, address_space, io, true);
>      vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
> -
> -    s->depth =3D ds_get_bits_per_pixel(s->vga.ds);
> -    s->bypp =3D ds_get_bytes_per_pixel(s->vga.ds);
> -    switch (s->depth) {
> -    case 8:
> -        s->wred   =3D 0x00000007;
> -        s->wgreen =3D 0x00000038;
> -        s->wblue  =3D 0x000000c0;
> -        break;
> -    case 15:
> -        s->wred   =3D 0x0000001f;
> -        s->wgreen =3D 0x000003e0;
> -        s->wblue  =3D 0x00007c00;
> -        break;
> -    case 16:
> -        s->wred   =3D 0x0000001f;
> -        s->wgreen =3D 0x000007e0;
> -        s->wblue  =3D 0x0000f800;
> -        break;
> -    case 24:
> -        s->wred   =3D 0x00ff0000;
> -        s->wgreen =3D 0x0000ff00;
> -        s->wblue  =3D 0x000000ff;
> -        break;
> -    case 32:
> -        s->wred   =3D 0x00ff0000;
> -        s->wgreen =3D 0x0000ff00;
> -        s->wblue  =3D 0x000000ff;
> -        break;
> -    }
>  }
>=20
>  static uint64_t vmsvga_io_read(void *opaque, target_phys_addr_t addr,
> @@ -1175,9 +1165,6 @@ static int pci_vmsvga_initfn(PCIDevice *dev)
>  {
>      struct pci_vmsvga_state_s *s =3D
>          DO_UPCAST(struct pci_vmsvga_state_s, card, dev);
> -    MemoryRegion *iomem;
> -
> -    iomem =3D &s->chip.vga.vram;
>=20
>      s->card.config[PCI_CACHE_LINE_SIZE]    =3D 0x08;        /* Cache l=
ine
> size */
>      s->card.config[PCI_LATENCY_TIMER] =3D 0x40;        /* Latency time=
r */
> @@ -1187,10 +1174,10 @@ static int pci_vmsvga_initfn(PCIDevice *dev)
>                            "vmsvga-io", 0x10);
>      pci_register_bar(&s->card, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_ba=
r);
>=20
> -    vmsvga_init(&s->chip, pci_address_space(dev),
> -                pci_address_space_io(dev));
> +    vmsvga_init(&s->chip, pci_address_space(dev),
> pci_address_space_io(dev));
>=20
> -    pci_register_bar(&s->card, 1, PCI_BASE_ADDRESS_MEM_PREFETCH, iomem=
);
> +    pci_register_bar(&s->card, 1, PCI_BASE_ADDRESS_MEM_PREFETCH,
> +                     &s->chip.vga.vram);
>      pci_register_bar(&s->card, 2, PCI_BASE_ADDRESS_MEM_PREFETCH,
>                       &s->chip.fifo_ram);
>=20



--------------enig17BF3780804E49EDA0A467DD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlA0kmsACgkQitSsb3rl5xSsHgCfVqvx8ihlLxja300R5FTwAyD+
xtQAoLg/6Espcuo0Tjmtgwf7j21UeY52
=0nlZ
-----END PGP SIGNATURE-----

--------------enig17BF3780804E49EDA0A467DD--

