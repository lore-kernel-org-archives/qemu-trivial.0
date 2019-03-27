Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h97qe-0005V4-Lb
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 08:40:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h97qa-0005Sr-Ip
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 08:40:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h97qW-0002zo-TT
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 08:39:58 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:38480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h97qS-0002y2-0M; Wed, 27 Mar 2019 08:39:52 -0400
Received: by mail-yw1-f66.google.com with SMTP id m207so3225030ywd.5;
	Wed, 27 Mar 2019 05:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KXytxB4uN6Do30DH65O/pMJ5TK0v+t3lpTyWtrCZ7Gc=;
	b=apUDyD/OLZ7uU2wp8nBA6KUeM8kzTXkrQUcieDqmIGseYuZwalM+wLHUm8MOE44MY3
	23bAo9Infqy+zPSPCgQRC+qg2K/+FDyJ+LZAA4TEsDh5vGCGcBMSeK6TbVFvA58lGDil
	IDO2d+HHxzwVRI8SgqzmOtbA1fiNUxXMJfxpYKfIV5Ei/YJShwFs5DyTAIxqtWqth1BE
	WwtUcH5kwvgVjk4FKhYF8S8LtsVGp7JBLH8P6hvMvxtcmOEUsQx1OOx6OvIgq8OGeR0p
	UgqgySvrlB1aR/QzvPEe3Z/Q1VBoHC1E1gKCqrq+WfoFbERLNFF0Sqq2qX44uuL0crsi
	n8jg==
X-Gm-Message-State: APjAAAUa4n8jkvfAGzvYOekVt66eXVdOMe/CM2JBmPBwxlo0sjW8MSDI
	tNL0Xrylr01TWGGLce0mdy5fdQgR2Yhrd+dtbtc=
X-Google-Smtp-Source: APXvYqyZH6wYucrUo3g9LNmmpORP9E9gdRAgy8fSsYzfBoA/w1TecIdwD1QJmPw0DrdAc1If2h9TpYIq9Z9qjZKKX8M=
X-Received: by 2002:a5b:642:: with SMTP id o2mr29165509ybq.32.1553690390298;
	Wed, 27 Mar 2019 05:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190327095634.53038-1-sgarzare@redhat.com>
	<20190327095634.53038-3-sgarzare@redhat.com>
In-Reply-To: <20190327095634.53038-3-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 27 Mar 2019 13:39:38 +0100
Message-ID: <CAAdtpL5R4jrZa7M1gcUTN0FgR5nTiM8e-khh5BPyDjON_XWFjw@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, 
	John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Jeff Cody <codyprime@gmail.com>, 
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ce0486058512bb87"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.66
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] block/vhdx: Use IEC binary
 prefixes for size constants
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
X-List-Received-Date: Wed, 27 Mar 2019 12:40:02 -0000

--000000000000ce0486058512bb87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 27 mars 2019 10:56, Stefano Garzarella <sgarzare@redhat.com> a
=C3=A9crit :

> Using IEC binary prefixes in order to make the code more readable,
> with the exception of DEFAULT_LOG_SIZE because it's passed to
> stringify().
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  block/vhdx-log.c |  2 +-
>  block/vhdx.c     |  4 ++--
>  block/vhdx.h     | 10 ++++++----
>  3 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/block/vhdx-log.c b/block/vhdx-log.c
> index 3149ff08d8..5e946846f1 100644
> --- a/block/vhdx-log.c
> +++ b/block/vhdx-log.c
> @@ -551,7 +551,7 @@ static int vhdx_log_flush(BlockDriverState *bs,
> BDRVVHDXState *s,
>          }
>          if (file_length < desc_entries->hdr.last_file_offset) {
>              new_file_size =3D desc_entries->hdr.last_file_offset;
> -            if (new_file_size % (1024*1024)) {
> +            if (new_file_size % (1 * MiB)) {
>                  /* round up to nearest 1MB boundary */
>                  new_file_size =3D QEMU_ALIGN_UP(new_file_size, MiB);
>                  if (new_file_size > INT64_MAX) {
> diff --git a/block/vhdx.c b/block/vhdx.c
> index 7cd1fc3731..a143a57657 100644
> --- a/block/vhdx.c
> +++ b/block/vhdx.c
> @@ -1175,7 +1175,7 @@ static int vhdx_allocate_block(BlockDriverState *bs=
,
> BDRVVHDXState *s,
>      *new_offset =3D current_len;
>
>      /* per the spec, the address for a block is in units of 1MB */
> -    *new_offset =3D ROUND_UP(*new_offset, 1024 * 1024);
> +    *new_offset =3D ROUND_UP(*new_offset, 1 * MiB);
>      if (*new_offset > INT64_MAX) {
>          return -EINVAL;
>      }
> @@ -1338,7 +1338,7 @@ static coroutine_fn int
> vhdx_co_writev(BlockDriverState *bs, int64_t sector_num,
>              case PAYLOAD_BLOCK_FULLY_PRESENT:
>                  /* if the file offset address is in the header zone,
>                   * there is a problem */
> -                if (sinfo.file_offset < (1024 * 1024)) {
> +                if (sinfo.file_offset < (1 * MiB)) {
>                      ret =3D -EFAULT;
>                      goto error_bat_restore;
>                  }
> diff --git a/block/vhdx.h b/block/vhdx.h
> index bf72090c8f..0b74924cee 100644
> --- a/block/vhdx.h
> +++ b/block/vhdx.h
> @@ -20,6 +20,8 @@
>  #include "qemu/units.h"
>
>  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
> +/* Note: can't use 1 * MiB, because it's passed to stringify() */
> +
>  /* Structures and fields present in the VHDX file */
>
>  /* The header section has the following blocks,
> @@ -32,7 +34,7 @@
>   *
> 0.........64KB...........128KB........192KB..........256KB...............=
.1MB
>   */
>
> -#define VHDX_HEADER_BLOCK_SIZE      (64 * 1024)
> +#define VHDX_HEADER_BLOCK_SIZE      (64 * KiB)
>
>  #define VHDX_FILE_ID_OFFSET         0
>  #define VHDX_HEADER1_OFFSET         (VHDX_HEADER_BLOCK_SIZE * 1)
> @@ -81,7 +83,7 @@ typedef struct QEMU_PACKED MSGUID {
>  #define guid_eq(a, b) \
>      (memcmp(&(a), &(b), sizeof(MSGUID)) =3D=3D 0)
>
> -#define VHDX_HEADER_SIZE (4 * 1024)   /* although the vhdx_header struct
> in disk
> +#define VHDX_HEADER_SIZE (4 * KiB)    /* although the vhdx_header struct
> in disk
>                                           is only 582 bytes, for purposes
> of crc
>                                           the header is the first 4KB of
> the 64KB
>                                           block */
> @@ -157,8 +159,8 @@ typedef struct QEMU_PACKED VHDXRegionTableEntry {
>
>
>  /* ---- LOG ENTRY STRUCTURES ---- */
> -#define VHDX_LOG_MIN_SIZE (1024 * 1024)
> -#define VHDX_LOG_SECTOR_SIZE 4096
> +#define VHDX_LOG_MIN_SIZE (1 * MiB)
> +#define VHDX_LOG_SECTOR_SIZE (4 * KiB)
>  #define VHDX_LOG_HDR_SIZE 64
>  #define VHDX_LOG_SIGNATURE 0x65676f6c
>  typedef struct QEMU_PACKED VHDXLogEntryHeader {
> -- 2.20.1
>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--000000000000ce0486058512bb87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
Le mer. 27 mars 2019 10:56, Stefano Garzarella &lt;<a href=3D"mailto:sgarza=
re@redhat.com">sgarzare@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Using IEC binary prefixes in order to make the =
code more readable,<br>
with the exception of DEFAULT_LOG_SIZE because it&#39;s passed to<br>
stringify().<br>
<br>
Signed-off-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">sgarzare@redhat.com</a>&gt;<br>
---<br>
=C2=A0block/vhdx-log.c |=C2=A0 2 +-<br>
=C2=A0block/vhdx.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0block/vhdx.h=C2=A0 =C2=A0 =C2=A0| 10 ++++++----<br>
=C2=A03 files changed, 9 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/block/vhdx-log.c b/block/vhdx-log.c<br>
index 3149ff08d8..5e946846f1 100644<br>
--- a/block/vhdx-log.c<br>
+++ b/block/vhdx-log.c<br>
@@ -551,7 +551,7 @@ static int vhdx_log_flush(BlockDriverState *bs, BDRVVHD=
XState *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (file_length &lt; desc_entries-&gt;hdr=
.last_file_offset) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_file_size =3D desc_entr=
ies-&gt;hdr.last_file_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_file_size % (1024*1024))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_file_size % (1 * MiB)) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* round up t=
o nearest 1MB boundary */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_file_size=
 =3D QEMU_ALIGN_UP(new_file_size, MiB);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_file_=
size &gt; INT64_MAX) {<br>
diff --git a/block/vhdx.c b/block/vhdx.c<br>
index 7cd1fc3731..a143a57657 100644<br>
--- a/block/vhdx.c<br>
+++ b/block/vhdx.c<br>
@@ -1175,7 +1175,7 @@ static int vhdx_allocate_block(BlockDriverState *bs, =
BDRVVHDXState *s,<br>
=C2=A0 =C2=A0 =C2=A0*new_offset =3D current_len;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* per the spec, the address for a block is in units of=
 1MB */<br>
-=C2=A0 =C2=A0 *new_offset =3D ROUND_UP(*new_offset, 1024 * 1024);<br>
+=C2=A0 =C2=A0 *new_offset =3D ROUND_UP(*new_offset, 1 * MiB);<br>
=C2=A0 =C2=A0 =C2=A0if (*new_offset &gt; INT64_MAX) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1338,7 +1338,7 @@ static coroutine_fn int vhdx_co_writev(BlockDriverSta=
te *bs, int64_t sector_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PAYLOAD_BLOCK_FULLY_PR=
ESENT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the fil=
e offset address is in the header zone,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * there is a=
 problem */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sinfo.file_off=
set &lt; (1024 * 1024)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sinfo.file_off=
set &lt; (1 * MiB)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret =3D -EFAULT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto error_bat_restore;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/block/vhdx.h b/block/vhdx.h<br>
index bf72090c8f..0b74924cee 100644<br>
--- a/block/vhdx.h<br>
+++ b/block/vhdx.h<br>
@@ -20,6 +20,8 @@<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
<br>
=C2=A0#define DEFAULT_LOG_SIZE 1048576 /* 1MiB */<br>
+/* Note: can&#39;t use 1 * MiB, because it&#39;s passed to stringify() */<=
br>
+<br>
=C2=A0/* Structures and fields present in the VHDX file */<br>
<br>
=C2=A0/* The header section has the following blocks,<br>
@@ -32,7 +34,7 @@<br>
=C2=A0 * 0.........64KB...........128KB........192KB..........256KB........=
........1MB<br>
=C2=A0 */<br>
<br>
-#define VHDX_HEADER_BLOCK_SIZE=C2=A0 =C2=A0 =C2=A0 (64 * 1024)<br>
+#define VHDX_HEADER_BLOCK_SIZE=C2=A0 =C2=A0 =C2=A0 (64 * KiB)<br>
<br>
=C2=A0#define VHDX_FILE_ID_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
=C2=A0#define VHDX_HEADER1_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(VHDX_HE=
ADER_BLOCK_SIZE * 1)<br>
@@ -81,7 +83,7 @@ typedef struct QEMU_PACKED MSGUID {<br>
=C2=A0#define guid_eq(a, b) \<br>
=C2=A0 =C2=A0 =C2=A0(memcmp(&amp;(a), &amp;(b), sizeof(MSGUID)) =3D=3D 0)<b=
r>
<br>
-#define VHDX_HEADER_SIZE (4 * 1024)=C2=A0 =C2=A0/* although the vhdx_heade=
r struct in disk<br>
+#define VHDX_HEADER_SIZE (4 * KiB)=C2=A0 =C2=A0 /* although the vhdx_heade=
r struct in disk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
s only 582 bytes, for purposes of crc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
he header is the first 4KB of the 64KB<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
lock */<br>
@@ -157,8 +159,8 @@ typedef struct QEMU_PACKED VHDXRegionTableEntry {<br>
<br>
<br>
=C2=A0/* ---- LOG ENTRY STRUCTURES ---- */<br>
-#define VHDX_LOG_MIN_SIZE (1024 * 1024)<br>
-#define VHDX_LOG_SECTOR_SIZE 4096<br>
+#define VHDX_LOG_MIN_SIZE (1 * MiB)<br>
+#define VHDX_LOG_SECTOR_SIZE (4 * KiB)<br>
=C2=A0#define VHDX_LOG_HDR_SIZE 64<br>
=C2=A0#define VHDX_LOG_SIGNATURE 0x65676f6c<br>
=C2=A0typedef struct QEMU_PACKED VHDXLogEntryHeader {<br>
-- 2.20.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4=
bug@amsat.org">f4bug@amsat.org</a>&gt;<br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><=
/div>

--000000000000ce0486058512bb87--

