Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWy4L-000291-5o
	for mharc-qemu-trivial@gnu.org; Sat, 03 Dec 2011 17:28:29 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RWy4I-0001zL-28
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2011 17:28:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RWy4G-0004Zr-UW
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2011 17:28:25 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:53701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RWy4E-0004X3-57; Sat, 03 Dec 2011 17:28:22 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	43C5D728188C; Sat,  3 Dec 2011 23:28:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id IQ9-Xca11OFz; Sat,  3 Dec 2011 23:27:40 +0100 (CET)
Received: from flocke.weilnetz.de (p54ADBCC3.dip.t-dialin.net [84.173.188.195])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	8B4B1728188A; Sat,  3 Dec 2011 23:27:40 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RWy3N-0002Pv-TQ; Sat, 03 Dec 2011 23:27:29 +0100
Message-ID: <4EDAA251.6090305@weilnetz.de>
Date: Sat, 03 Dec 2011 23:27:29 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: rui chen <chennrui@gmail.com>
References: <CAMOKqh+d7d56d+3jgaAH2yncMJSq-Z23dVZO7YHVgw9xTesBZQ@mail.gmail.com>	<m3y5vha1n3.fsf@blackfin.pond.sub.org>
	<CAMOKqhKB_JD91CRGie7WMKz24OgGW55W=XOMkAZQFJ=gNEkL-Q@mail.gmail.com>
In-Reply-To: <CAMOKqhKB_JD91CRGie7WMKz24OgGW55W=XOMkAZQFJ=gNEkL-Q@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------000402050005070102010602"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	aurelien@aurel32.net, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] endless loop when use
 qemu-system-mipsel to load bios
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
X-List-Received-Date: Sat, 03 Dec 2011 22:28:27 -0000

This is a multi-part message in MIME format.
--------------000402050005070102010602
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 16.11.2011 16:21, schrieb rui chen:
> sorry, here is my new patch file:
>
> From 05f4abe8d8c37f1585f2bb7cb89b15426044bb65 Mon Sep 17 00:00:00 2001
> From: Chen Rui <chennrui@gmail.com <mailto:chennrui@gmail.com>>
> Date: Sun, 13 Nov 2011 19:42:42 +0800
> Subject: [PATCH] resolve an endless loop when use qemu-system-mipsel 
> to load bios
>
>
> Signed-off-by: Chen Rui <chennrui@gmail.com <mailto:chennrui@gmail.com>>
> ---
>  hw/mips_malta.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/hw/mips_malta.c b/hw/mips_malta.c
> index bb49749..e7dfbd6 100644
> --- a/hw/mips_malta.c
> +++ b/hw/mips_malta.c
> @@ -911,6 +911,7 @@ void mips_malta_init (ram_addr_t ram_size,
>              uint32_t *end = addr + bios_size;
>              while (addr < end) {
>                  bswap32s(addr);
> +                addr++;
>              }
>          }
>  #endif
> -- 
> 1.7.1

This patch fixes a regression introduced by commit
d758525180e0efff8a59cfea11f5f8348014ff6a
(More phys_ram_base elimination).

Please apply it to QEMU git master (with a modified subject, s/use/using/).

Tested-by: Stefan Weil <sw@weilnetz.de>

Regards,
Stefan Weil


--------------000402050005070102010602
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="Content-Type">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<tt>Am 16.11.2011 16:21, schrieb rui chen:</tt>
<blockquote
 cite="mid:CAMOKqhKB_JD91CRGie7WMKz24OgGW55W=XOMkAZQFJ=gNEkL-Q@mail.gmail.com"
 type="cite">
  <meta http-equiv="Context-Type"
 content="text/html; charset=ISO-8859-1">
  <tt>sorry, here is my new patch file:<br>
  <br>
From 05f4abe8d8c37f1585f2bb7cb89b15426044bb65 Mon Sep 17 00:00:00 2001<br>
From: Chen Rui &lt;<a moz-do-not-send="true"
 href="mailto:chennrui@gmail.com">chennrui@gmail.com</a>&gt;<br>
Date: Sun, 13 Nov 2011 19:42:42 +0800<br>
Subject: [PATCH] resolve an endless loop when use qemu-system-mipsel to
load bios<br>
  <br>
  <br>
Signed-off-by: Chen Rui &lt;<a moz-do-not-send="true"
 href="mailto:chennrui@gmail.com">chennrui@gmail.com</a>&gt;<br>
---<br>
&nbsp;hw/mips_malta.c |&nbsp;&nbsp;&nbsp; 1 +<br>
&nbsp;1 files changed, 1 insertions(+), 0 deletions(-)<br>
  <br>
diff --git a/hw/mips_malta.c b/hw/mips_malta.c<br>
index bb49749..e7dfbd6 100644<br>
--- a/hw/mips_malta.c<br>
+++ b/hw/mips_malta.c<br>
@@ -911,6 +911,7 @@ void mips_malta_init (ram_addr_t ram_size,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *end = addr + bios_size;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (addr &lt; end) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bswap32s(addr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;#endif<br>
-- <br>
1.7.1<br>
  </tt></blockquote>
<tt><br>
This patch fixes a regression introduced by commit<br>
d758525180e0efff8a59cfea11f5f8348014ff6a<br>
(More phys_ram_base elimination).<br>
<br>
Please apply it to QEMU git master (with a modified subject,
s/use/using/).<br>
<br>
Tested-by: Stefan Weil <a class="moz-txt-link-rfc2396E" href="mailto:sw@weilnetz.de">&lt;sw@weilnetz.de&gt;</a><br>
<br>
Regards,<br>
Stefan Weil<br>
<br>
</tt>
</body>
</html>

--------------000402050005070102010602--

