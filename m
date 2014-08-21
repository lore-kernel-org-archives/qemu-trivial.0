Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKNwB-0001Jl-Oy
	for mharc-qemu-trivial@gnu.org; Thu, 21 Aug 2014 04:41:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jmattsson@dius.com.au>) id 1XKN01-0005jy-8Z
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 03:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jmattsson@dius.com.au>) id 1XKMzw-0008E3-DW
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 03:41:33 -0400
Received: from mail-oa0-f49.google.com ([209.85.219.49]:40953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jmattsson@dius.com.au>) id 1XKMzw-0008Ds-7V
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 03:41:28 -0400
Received: by mail-oa0-f49.google.com with SMTP id eb12so7135965oac.8
	for <qemu-trivial@nongnu.org>; Thu, 21 Aug 2014 00:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=z9vysgfzUsOxwUuy6kHQSXITLSem18ccVAZmWPC1AwA=;
	b=iQZyakHQZqgkdXuwvC2cpydIYfOMkdd0Dx6mTZiAWhBihky0mEwK62sTqgfk9tvAWk
	IIZ/9o1yh6K+IQ1c8IsV4OQPF4+gdTmJ45XKHLwgKmdEBGID12BpmZRWZ8t9LIiV68Ax
	VjMASy6pdBbm13b1aInIM8tjoc4gfxJAQFb0jxQ/O+Sw5RxTwOOZe14K3tLEwYX6LiB6
	7VfZ82bqZVBnfFJ7gXAnCyZWH2hi5l6sDRAI6e18WJ55w2+E+RAoP/LM0/iPrcx7S83W
	2nlsOjVMf+gZVfT9FA/cF7Sv/I30W8TrGn7F/BrX8eSTQPy0Hi7lUVXztuIqCU4KjkFa
	02xQ==
X-Gm-Message-State: ALoCoQnp/KLo4c7ZoiZyynY/Q++YlUoj9tbGlG97yYZjZ8P8Xdvxo4nDETWM4jGRBuLgGtVoTR8k
MIME-Version: 1.0
X-Received: by 10.60.51.9 with SMTP id g9mr24448785oeo.63.1408606525780; Thu,
	21 Aug 2014 00:35:25 -0700 (PDT)
Received: by 10.182.93.240 with HTTP; Thu, 21 Aug 2014 00:35:25 -0700 (PDT)
Date: Thu, 21 Aug 2014 17:35:25 +1000
Message-ID: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
From: Johny Mattsson <jmattsson@dius.com.au>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=001a11c30628990a8905011ec3b2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.49
X-Mailman-Approved-At: Thu, 21 Aug 2014 04:41:38 -0400
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] Fix pflash_cfi01 to restore flash
	command/array state after migration
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
X-List-Received-Date: Thu, 21 Aug 2014 07:41:38 -0000

--001a11c30628990a8905011ec3b2
Content-Type: text/plain; charset=UTF-8

When using snapshots on e.g. the VersatilePB board, the pflash driver
would report an error and get reset at times after resuming the snapshot.
This was traced down to the 'romd' flag in the pflash emulation which was
not being persisted in the snapshot.

Author: Bernd Meyer <bmeyer@dius.com.au>
Signed-off-by: Johny Mattsson <jmattsson@dius.com.au>

---
 hw/block/pflash_cfi01.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index f9507b4..83cb1d3 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -80,6 +80,7 @@ struct pflash_t {
     int ro;
     uint8_t cmd;
     uint8_t status;
+    uint8_t romd;
     uint16_t ident0;
     uint16_t ident1;
     uint16_t ident2;
@@ -94,14 +95,25 @@ struct pflash_t {
     void *storage;
 };

+static int sync_romd(void* opaque, int version_id)
+{
+  (void)version_id;
+  pflash_t *pfl = opaque;
+
+  memory_region_rom_device_set_romd(&pfl->mem,!!pfl->romd);
+  return 0;
+}
+
 static const VMStateDescription vmstate_pflash = {
     .name = "pflash_cfi01",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = sync_romd,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(wcycle, pflash_t),
         VMSTATE_UINT8(cmd, pflash_t),
         VMSTATE_UINT8(status, pflash_t),
+        VMSTATE_UINT8(romd, pflash_t),
         VMSTATE_UINT64(counter, pflash_t),
         VMSTATE_END_OF_LIST()
     }
@@ -114,6 +126,7 @@ static void pflash_timer (void *opaque)
     DPRINTF("%s: command %02x done\n", __func__, pfl->cmd);
     /* Reset flash */
     pfl->status ^= 0x80;
+    pfl->romd=1;
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0;
@@ -453,6 +466,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,

     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
+        pfl->romd=0;
         memory_region_rom_device_set_romd(&pfl->mem, false);
     }

@@ -638,6 +652,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);

  reset_flash:
+    pfl->romd=1;
     memory_region_rom_device_set_romd(&pfl->mem, true);

     pfl->wcycle = 0;
@@ -804,6 +819,7 @@ static void pflash_cfi01_realize(DeviceState *dev,
Error **errp)
     pfl->wcycle = 0;
     pfl->cmd = 0;
     pfl->status = 0;
+    pfl->romd = 1;
     /* Hardcoded CFI table */
     pfl->cfi_len = 0x52;
     /* Standard "QRY" string */
-- 
2.0.0


-- 
Johny Mattsson
Senior Software Engineer

DiUS Computing Pty. Ltd.

*where ideas are engineered *

--001a11c30628990a8905011ec3b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When using snapshots on e.g. the VersatilePB board, the pflash driver<br>wo=
uld report an error and get reset at times after resuming the snapshot.<br>=
This was traced down to the &#39;romd&#39; flag in the pflash emulation whi=
ch was<br>
not being persisted in the snapshot.<br><br>Author: Bernd Meyer &lt;<a href=
=3D"mailto:bmeyer@dius.com.au">bmeyer@dius.com.au</a>&gt;<br>Signed-off-by:=
 Johny Mattsson &lt;<a href=3D"mailto:jmattsson@dius.com.au">jmattsson@dius=
.com.au</a>&gt;<br>
<br clear=3D"all">---<br>=C2=A0hw/block/pflash_cfi01.c | 16 +++++++++++++++=
+<br>=C2=A01 file changed, 16 insertions(+)<br><br>diff --git a/hw/block/pf=
lash_cfi01.c b/hw/block/pflash_cfi01.c<br>index f9507b4..83cb1d3 100644<br>=
--- a/hw/block/pflash_cfi01.c<br>
+++ b/hw/block/pflash_cfi01.c<br>@@ -80,6 +80,7 @@ struct pflash_t {<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 int ro;<br>=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t cmd;<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t status;<br>+=C2=A0=C2=A0=C2=A0 uint8_t rom=
d;<br>=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t ident0;<br>=C2=A0=C2=A0=C2=A0=C2=A0=
 uint16_t ident1;<br>=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t ident2;<br>
@@ -94,14 +95,25 @@ struct pflash_t {<br>=C2=A0=C2=A0=C2=A0=C2=A0 void *sto=
rage;<br>=C2=A0};<br><br>+static int sync_romd(void* opaque, int version_id=
)<br>+{<br>+=C2=A0 (void)version_id;<br>+=C2=A0 pflash_t *pfl =3D opaque;<b=
r>+<br>+=C2=A0 memory_region_rom_device_set_romd(&amp;pfl-&gt;mem,!!pfl-&gt=
;romd);<br>
+=C2=A0 return 0;<br>+}<br>+<br>=C2=A0static const VMStateDescription vmsta=
te_pflash =3D {<br>=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D &quot;pflash_cfi01&qu=
ot;,<br>=C2=A0=C2=A0=C2=A0=C2=A0 .version_id =3D 1,<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 .minimum_version_id =3D 1,<br>+=C2=A0=C2=A0=C2=A0 .post_load =3D syn=
c_romd,<br>=C2=A0=C2=A0=C2=A0=C2=A0 .fields =3D (VMStateField[]) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(wcycle, pfla=
sh_t),<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(cm=
d, pflash_t),<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_U=
INT8(status, pflash_t),<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMST=
ATE_UINT8(romd, pflash_t),<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 VMSTATE_UINT64(counter, pflash_t),<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_END_OF_LIST()<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 }<br>@@ -114,6 +126,7 @@ static void pflash_timer =
(void *opaque)<br>=C2=A0=C2=A0=C2=A0=C2=A0 DPRINTF(&quot;%s: command %02x d=
one\n&quot;, __func__, pfl-&gt;cmd);<br>=C2=A0=C2=A0=C2=A0=C2=A0 /* Reset f=
lash */<br>=C2=A0=C2=A0=C2=A0=C2=A0 pfl-&gt;status ^=3D 0x80;<br>
+=C2=A0=C2=A0=C2=A0 pfl-&gt;romd=3D1;<br>=C2=A0=C2=A0=C2=A0=C2=A0 memory_re=
gion_rom_device_set_romd(&amp;pfl-&gt;mem, true);<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 pfl-&gt;wcycle =3D 0;<br>=C2=A0=C2=A0=C2=A0=C2=A0 pfl-&gt;cmd =3D 0;<br=
>@@ -453,6 +466,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,=
<br>
<br>=C2=A0=C2=A0=C2=A0=C2=A0 if (!pfl-&gt;wcycle) {<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set the device in I/O access mode */<br>+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pfl-&gt;romd=3D0;<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_rom_device_set_romd(&=
amp;pfl-&gt;mem, false);<br>=C2=A0=C2=A0=C2=A0=C2=A0 }<br><br>@@ -638,6 +65=
2,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;\n&quot;, __func__, offset, pfl-&gt=
;wcycle, pfl-&gt;cmd, value);<br><br>=C2=A0 reset_flash:<br>+=C2=A0=C2=A0=
=C2=A0 pfl-&gt;romd=3D1;<br>=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_rom_devi=
ce_set_romd(&amp;pfl-&gt;mem, true);<br><br>=C2=A0=C2=A0=C2=A0=C2=A0 pfl-&g=
t;wcycle =3D 0;<br>
@@ -804,6 +819,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Erro=
r **errp)<br>=C2=A0=C2=A0=C2=A0=C2=A0 pfl-&gt;wcycle =3D 0;<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 pfl-&gt;cmd =3D 0;<br>=C2=A0=C2=A0=C2=A0=C2=A0 pfl-&gt;status =
=3D 0;<br>+=C2=A0=C2=A0=C2=A0 pfl-&gt;romd =3D 1;<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Hardcoded CFI table */<br>
=C2=A0=C2=A0=C2=A0=C2=A0 pfl-&gt;cfi_len =3D 0x52;<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Standard &quot;QRY&quot; string */<br>-- <br>2.0.0<br><br><br>-- <br=
><font size=3D"1"><font><span style=3D"font-size:9pt"><span style=3D"color:=
rgb(153,153,153)">Johny Mattsson</span><br style=3D"color:rgb(153,153,153)"=
>
<span style=3D"color:rgb(153,153,153)">Senior Software Engineer</span><br s=
tyle=3D"color:rgb(153,153,153)"><br style=3D"color:rgb(153,153,153)"><span =
style=3D"color:rgb(153,153,153)">
DiUS Computing Pty. Ltd.</span><br style=3D"color:rgb(153,153,153)"><span s=
tyle=3D"color:rgb(153,153,153)">
</span><i><span style=3D"color:rgb(153,153,153)">where ideas are engineered=
</span><br>
</i></span></font></font>

--001a11c30628990a8905011ec3b2--

