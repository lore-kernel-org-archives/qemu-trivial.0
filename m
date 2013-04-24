Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UV83B-0007ls-1Y
	for mharc-qemu-trivial@gnu.org; Wed, 24 Apr 2013 18:20:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.o.ratnikov@gmail.com>) id 1UV835-0007l4-Dc
	for qemu-trivial@nongnu.org; Wed, 24 Apr 2013 18:20:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <m.o.ratnikov@gmail.com>) id 1UV832-0005UH-1R
	for qemu-trivial@nongnu.org; Wed, 24 Apr 2013 18:20:23 -0400
Received: from mail-ob0-x243.google.com ([2607:f8b0:4003:c01::243]:34870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.o.ratnikov@gmail.com>) id 1UV831-0005TR-RZ
	for qemu-trivial@nongnu.org; Wed, 24 Apr 2013 18:20:19 -0400
Received: by mail-ob0-f195.google.com with SMTP id tb18so502918obb.6
	for <qemu-trivial@nongnu.org>; Wed, 24 Apr 2013 15:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=9Zg3qjQHdDOxGzrsuJP4Ml926fvqOqMI2UML16+4ngs=;
	b=A9BAI0JH92ji+vKi1bZsIrCj9YcPR7ceA6bVP9RBYnMUxv5jgDxM+M2Jgry8E1Qz1h
	yPuFzqtxNDWRUkD25lccqnJ7wyGgbgxCL+Wc1J5XUZZsSKj7hlq+s5yAxM2Vfu0DpHhi
	VoAS4NBjl70IFAHDcxaRAY0aHKvCX92gvk7R1APY3zsxFfWq6MFc4kwM2UnmZtSrmu6y
	aUr7CBhZDcTIoCHG9B/ZjSM5tTu5R7kyZflTO1sTQXy2kc69EiSEvxLY6E07tMncx3ap
	ETeDeti/lB5eOfr+fmba3kkbTOrnxDmaeAjJdpCQXDXqTyYpZdM76hZJIXuwXg8gKOvx
	4ifw==
MIME-Version: 1.0
X-Received: by 10.182.160.106 with SMTP id xj10mr18519767obb.98.1366842018519; 
	Wed, 24 Apr 2013 15:20:18 -0700 (PDT)
Received: by 10.76.150.138 with HTTP; Wed, 24 Apr 2013 15:20:18 -0700 (PDT)
Date: Thu, 25 Apr 2013 02:20:18 +0400
Message-ID: <CAAWx3aQJh=nK5Tfi1nYTnREXzMRwOG6u4bUOd0Gx2n28OpG3pg@mail.gmail.com>
From: Maksim Ratnikov <m.o.ratnikov@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=f46d04478905fa628b04db22b4c5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::243
Subject: [Qemu-trivial]  [PATCH] SMBUS module update.
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
X-List-Received-Date: Wed, 24 Apr 2013 22:20:28 -0000

--f46d04478905fa628b04db22b4c5
Content-Type: text/plain; charset=ISO-8859-1

Subject: [PATCH] SMBUS module update. Previous realization doesn't consider
flags in the status register. In this patch processing of bits of DS and
INTR of the register HST_STS is added. Mechanism of clearing bits value in
the register HST_STS is updated. Error processing is updated: if DEV_ERR
bit are set transaction isn't evaluated.
Signed-off-by: Maksim Ratnikov <m.o.ratnikov@gmail.com>
---
 hw/pm_smbus.c |   26 ++++++++++++++++++--------
 1 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/hw/pm_smbus.c b/hw/pm_smbus.c
index ea1380c..3a7b42d 100644
--- a/hw/pm_smbus.c
+++ b/hw/pm_smbus.c
@@ -17,10 +17,10 @@
  * License along with this library; if not, see
  * <http://www.gnu.org/licenses/>.
  */
-#include "hw.h"
-#include "pc.h"
-#include "pm_smbus.h"
-#include "smbus.h"
+#include "hw/hw.h"
+#include "hw/pc.h"
+#include "hw/pm_smbus.h"
+#include "hw/smbus.h"

 /* no save/load? */

@@ -40,7 +40,6 @@
 # define SMBUS_DPRINTF(format, ...)     do { } while (0)
 #endif

-
 static void smb_transaction(PMSMBus *s)
 {
     uint8_t prot = (s->smb_ctl >> 2) & 0x07;
@@ -48,11 +47,16 @@ static void smb_transaction(PMSMBus *s)
     uint8_t cmd = s->smb_cmd;
     uint8_t addr = s->smb_addr >> 1;
     i2c_bus *bus = s->smbus;
-
+
+    if ( (s->smb_stat & 0x04) != 0) goto error;            // DEV_ERR
evaluate
+
+
     SMBUS_DPRINTF("SMBus trans addr=0x%02x prot=0x%02x\n", addr, prot);
     switch(prot) {
     case 0x0:
-        smbus_quick_command(bus, addr, read);
+        smbus_quick_command(bus, addr, read);
+     s->smb_stat |= 0x82;            // set ByteDoneStatus = 1 (bit #7)
and INTR = (bit #1)
+
         break;
     case 0x1:
         if (read) {
@@ -60,6 +64,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_send_byte(bus, addr, cmd);
         }
+     s->smb_stat |= 0x82;            // set ByteDoneStatus = 1 (bit #7)
and INTR = (bit #1)
         break;
     case 0x2:
         if (read) {
@@ -67,6 +72,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_write_byte(bus, addr, cmd, s->smb_data0);
         }
+     s->smb_stat |= 0x82;            // set ByteDoneStatus = 1 (bit #7)
and INTR = (bit #1)
         break;
     case 0x3:
         if (read) {
@@ -77,6 +83,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_write_word(bus, addr, cmd, (s->smb_data1 << 8) |
s->smb_data0);
         }
+     s->smb_stat |= 0x82;            // set ByteDoneStatus = 1 (bit #7)
and INTR = (bit #1)
         break;
     case 0x5:
         if (read) {
@@ -84,6 +91,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_write_block(bus, addr, cmd, s->smb_data, s->smb_data0);
         }
+     s->smb_stat |= 0x82;            // set ByteDoneStatus = 1 (bit #7)
and INTR = (bit #1)
         break;
     default:
         goto error;
@@ -102,7 +110,8 @@ static void smb_ioport_writeb(void *opaque, hwaddr
addr, uint64_t val,
     SMBUS_DPRINTF("SMB writeb port=0x%04x val=0x%02x\n", addr, val);
     switch(addr) {
     case SMBHSTSTS:
-        s->smb_stat = 0;
+
+    s->smb_stat = (~(val & 0xff)) & s->smb_stat;            // clear that
bits of smb_stat where _val_ have "1"
         s->smb_index = 0;
         break;
     case SMBHSTCNT:
@@ -140,6 +149,7 @@ static uint64_t smb_ioport_readb(void *opaque, hwaddr
addr, unsigned width)
     switch(addr) {
     case SMBHSTSTS:
         val = s->smb_stat;
+        //val = 0x1e;
         break;
     case SMBHSTCNT:
         s->smb_index = 0;
-- 
1.7.3.4

--f46d04478905fa628b04db22b4c5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Subject: [PATCH] SMBUS module update. Previous realization=
 doesn&#39;t consider flags in the status register. In this patch processin=
g of bits of DS and INTR of the register HST_STS is added. Mechanism of cle=
aring bits value in the register HST_STS is updated. Error processing is up=
dated: if DEV_ERR bit are set transaction isn&#39;t evaluated.<br>
Signed-off-by: Maksim Ratnikov &lt;<a href=3D"mailto:m.o.ratnikov@gmail.com=
">m.o.ratnikov@gmail.com</a>&gt;<br>---<br>=A0hw/pm_smbus.c |=A0=A0 26 ++++=
++++++++++++++--------<br>=A01 files changed, 18 insertions(+), 8 deletions=
(-)<br>
<br>diff --git a/hw/pm_smbus.c b/hw/pm_smbus.c<br>index ea1380c..3a7b42d 10=
0644<br>--- a/hw/pm_smbus.c<br>+++ b/hw/pm_smbus.c<br>@@ -17,10 +17,10 @@<b=
r>=A0 * License along with this library; if not, see<br>=A0 * &lt;<a href=
=3D"http://www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>&gt;.<br>
=A0 */<br>-#include &quot;hw.h&quot;<br>-#include &quot;pc.h&quot;<br>-#inc=
lude &quot;pm_smbus.h&quot;<br>-#include &quot;smbus.h&quot;<br>+#include &=
quot;hw/hw.h&quot;<br>+#include &quot;hw/pc.h&quot;<br>+#include &quot;hw/p=
m_smbus.h&quot;<br>
+#include &quot;hw/smbus.h&quot;<br>=A0<br>=A0/* no save/load? */<br>=A0<br=
>@@ -40,7 +40,6 @@<br>=A0# define SMBUS_DPRINTF(format, ...)=A0=A0=A0=A0 do=
 { } while (0)<br>=A0#endif<br>=A0<br>-<br>=A0static void smb_transaction(P=
MSMBus *s)<br>=A0{<br>
=A0=A0=A0=A0 uint8_t prot =3D (s-&gt;smb_ctl &gt;&gt; 2) &amp; 0x07;<br>@@ =
-48,11 +47,16 @@ static void smb_transaction(PMSMBus *s)<br>=A0=A0=A0=A0 ui=
nt8_t cmd =3D s-&gt;smb_cmd;<br>=A0=A0=A0=A0 uint8_t addr =3D s-&gt;smb_add=
r &gt;&gt; 1;<br>=A0=A0=A0=A0 i2c_bus *bus =3D s-&gt;smbus;<br>
-<br>+=A0 <br>+=A0=A0=A0 if ( (s-&gt;smb_stat &amp; 0x04) !=3D 0) goto erro=
r;=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 // DEV_ERR evaluate<br>+=A0 <br>+=A0=A0=A0 =
<br>=A0=A0=A0=A0 SMBUS_DPRINTF(&quot;SMBus trans addr=3D0x%02x prot=3D0x%02=
x\n&quot;, addr, prot);<br>=A0=A0=A0=A0 switch(prot) {<br>
=A0=A0=A0=A0 case 0x0:<br>-=A0=A0=A0=A0=A0=A0=A0 smbus_quick_command(bus, a=
ddr, read);<br>+=A0=A0=A0=A0=A0=A0=A0 smbus_quick_command(bus, addr, read);=
=A0=A0=A0 <br>+=A0=A0=A0 =A0s-&gt;smb_stat |=3D 0x82;=A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 // set ByteDoneStatus =3D 1 (bit #7) and INTR =3D (bit #1)<br>
+=A0=A0=A0 =A0<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x1:=
<br>=A0=A0=A0=A0=A0=A0=A0=A0 if (read) {<br>@@ -60,6 +64,7 @@ static void s=
mb_transaction(PMSMBus *s)<br>=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 smbus_send_byte(bus, addr, cmd);<br>=A0=A0=
=A0=A0=A0=A0=A0=A0 }<br>+=A0=A0=A0 =A0s-&gt;smb_stat |=3D 0x82;=A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 // set ByteDoneStatus =3D 1 (bit #7) and INTR =3D (bit =
#1)=A0=A0=A0=A0=A0 <br>
=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x2:<br>=A0=A0=A0=A0=
=A0=A0=A0=A0 if (read) {<br>@@ -67,6 +72,7 @@ static void smb_transaction(P=
MSMBus *s)<br>=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 smbus_write_byte(bus, addr, cmd, s-&gt;smb_data0);<br>=A0=A0=
=A0=A0=A0=A0=A0=A0 }<br>
+=A0=A0=A0 =A0s-&gt;smb_stat |=3D 0x82;=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 // set=
 ByteDoneStatus =3D 1 (bit #7) and INTR =3D (bit #1)=A0=A0=A0=A0=A0=A0=A0 <=
br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x3:<br>=A0=A0=A0=
=A0=A0=A0=A0=A0 if (read) {<br>@@ -77,6 +83,7 @@ static void smb_transactio=
n(PMSMBus *s)<br>
=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s=
mbus_write_word(bus, addr, cmd, (s-&gt;smb_data1 &lt;&lt; 8) | s-&gt;smb_da=
ta0);<br>=A0=A0=A0=A0=A0=A0=A0=A0 }<br>+=A0=A0=A0 =A0s-&gt;smb_stat |=3D 0x=
82;=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 // set ByteDoneStatus =3D 1 (bit #7) and I=
NTR =3D (bit #1)=A0=A0=A0=A0=A0 <br>
=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x5:<br>=A0=A0=A0=A0=
=A0=A0=A0=A0 if (read) {<br>@@ -84,6 +91,7 @@ static void smb_transaction(P=
MSMBus *s)<br>=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 smbus_write_block(bus, addr, cmd, s-&gt;smb_data, s-&gt;smb_da=
ta0);<br>
=A0=A0=A0=A0=A0=A0=A0=A0 }<br>+=A0=A0=A0 =A0s-&gt;smb_stat |=3D 0x82;=A0=A0=
=A0 =A0=A0=A0 =A0=A0=A0 // set ByteDoneStatus =3D 1 (bit #7) and INTR =3D (=
bit #1)=A0=A0=A0=A0=A0 <br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 =
default:<br>=A0=A0=A0=A0=A0=A0=A0=A0 goto error;<br>@@ -102,7 +110,8 @@ sta=
tic void smb_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,<br>
=A0=A0=A0=A0 SMBUS_DPRINTF(&quot;SMB writeb port=3D0x%04x val=3D0x%02x\n&qu=
ot;, addr, val);<br>=A0=A0=A0=A0 switch(addr) {<br>=A0=A0=A0=A0 case SMBHST=
STS:<br>-=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_stat =3D 0;<br>+<br>+=A0=A0=A0 s-&=
gt;smb_stat =3D (~(val &amp; 0xff)) &amp; s-&gt;smb_stat;=A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0 // clear that bits of smb_stat where _val_ have &quot;1&quot;=
=A0=A0=A0 <br>
=A0=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_index =3D 0;<br>=A0=A0=A0=A0=A0=A0=A0=A0=
 break;<br>=A0=A0=A0=A0 case SMBHSTCNT:<br>@@ -140,6 +149,7 @@ static uint6=
4_t smb_ioport_readb(void *opaque, hwaddr addr, unsigned width)<br>=A0=A0=
=A0=A0 switch(addr) {<br>=A0=A0=A0=A0 case SMBHSTSTS:<br>
=A0=A0=A0=A0=A0=A0=A0=A0 val =3D s-&gt;smb_stat;<br>+=A0=A0=A0=A0=A0=A0=A0 =
//val =3D 0x1e;<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case SMB=
HSTCNT:<br>=A0=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_index =3D 0;<br>-- <br>1.7.3.=
4<br><br></div>

--f46d04478905fa628b04db22b4c5--

