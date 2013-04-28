Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWWJA-00019N-Lk
	for mharc-qemu-trivial@gnu.org; Sun, 28 Apr 2013 14:26:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.o.ratnikov@gmail.com>) id 1UWWJ5-00012J-PT
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2013 14:26:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <m.o.ratnikov@gmail.com>) id 1UWWJ3-0000ah-0N
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2013 14:26:39 -0400
Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231]:49766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.o.ratnikov@gmail.com>) id 1UWWJ2-0000aX-Q5
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2013 14:26:36 -0400
Received: by mail-ob0-f177.google.com with SMTP id ef5so4795420obb.22
	for <qemu-trivial@nongnu.org>; Sun, 28 Apr 2013 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=FePMmT7QZBS1cD0VAPDvxkRYkkoG1eH54VDbRL5X6vc=;
	b=EmoCN4noK7rAGd3Sr6wMhhBydcZS599zsYxl5tUGWX8+ipUG5DLsgMSgFJk4GfD/o4
	eCpcqRrQRe5iYfQUSWZxeDCd3poyXBZXAih0U0SB6aOVmtwCScJk/KAlNKZU04ldgBcT
	2pnjP3MzvRXTCRmMhDUzQzn5eZX0SXByyrhxFm8aYJlHEzyLHQgmBKwrH3DKYXe3exUR
	2ia4QxuJISAIhI9nffuFIg0ICFUAEzpdV615uB6we9V/zSdBuMfZGiMi1sgUPLfSJILq
	5JvwDqPXO9fNJ7euHnOU034danlqmwYPglmYbBFRKhgjch9LRBzwRpANULvQSLmafcN3
	OwFg==
MIME-Version: 1.0
X-Received: by 10.60.179.7 with SMTP id dc7mr18403692oec.3.1367173596297; Sun,
	28 Apr 2013 11:26:36 -0700 (PDT)
Received: by 10.76.150.138 with HTTP; Sun, 28 Apr 2013 11:26:36 -0700 (PDT)
Date: Sun, 28 Apr 2013 22:26:36 +0400
Message-ID: <CAAWx3aSdhAdZfPiKodbCo6sHhHPX4kk1_yZ6h1j4PU8EyNBQFg@mail.gmail.com>
From: Maksim Ratnikov <m.o.ratnikov@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=089e0122881e8dbd7204db6fe8cf
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::231
Subject: Re: [Qemu-trivial] [PATCH] SMBUS module update.
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
X-List-Received-Date: Sun, 28 Apr 2013 18:26:43 -0000

--089e0122881e8dbd7204db6fe8cf
Content-Type: text/plain; charset=ISO-8859-1

Previous realization doesn't consider flags in the status register.
Add DS and INTR bits of HST_STS register set after transaction execution.
Update bits resetting in HST_STS register. Update error processing: if
DEV_ERR bit are set
transaction isn't execution.


Signed-off-by: Maksim_Ratnikov <m.o.ratnikov@gmail.com>
---
 hw/i2c/pm_smbus.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 0b5bb89..d5f5c56 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -50,9 +50,16 @@ static void smb_transaction(PMSMBus *s)
     i2c_bus *bus = s->smbus;

     SMBUS_DPRINTF("SMBus trans addr=0x%02x prot=0x%02x\n", addr, prot);
+    /* Transaction isn't exec if DEV_ERR bit set */
+    if ((s->smb_stat & 0x04) != 0)
+        goto error;
     switch(prot) {
     case 0x0:
         smbus_quick_command(bus, addr, read);
+        /* Set successfully transaction end:
+         * ByteDoneStatus = 1 (HST_STS bit #7) and INTR = 1 (HST_STS bit
#1)
+         */
+        s->smb_stat |= 0x82;
         break;
     case 0x1:
         if (read) {
@@ -60,6 +67,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_send_byte(bus, addr, cmd);
         }
+        s->smb_stat |= 0x82;
         break;
     case 0x2:
         if (read) {
@@ -67,6 +75,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_write_byte(bus, addr, cmd, s->smb_data0);
         }
+        s->smb_stat |= 0x82;
         break;
     case 0x3:
         if (read) {
@@ -77,6 +86,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_write_word(bus, addr, cmd, (s->smb_data1 << 8) |
s->smb_data0);
         }
+        s->smb_stat |= 0x82;
         break;
     case 0x5:
         if (read) {
@@ -84,6 +94,7 @@ static void smb_transaction(PMSMBus *s)
         } else {
             smbus_write_block(bus, addr, cmd, s->smb_data, s->smb_data0);
         }
+        s->smb_stat |= 0x82;
         break;
     default:
         goto error;
@@ -102,7 +113,7 @@ static void smb_ioport_writeb(void *opaque, hwaddr
addr, uint64_t val,
     SMBUS_DPRINTF("SMB writeb port=0x%04x val=0x%02x\n", addr, val);
     switch(addr) {
     case SMBHSTSTS:
-        s->smb_stat = 0;
+        s->smb_stat = (~(val & 0xff)) & s->smb_stat;
         s->smb_index = 0;
         break;
     case SMBHSTCNT:
-- 
1.7.3.4

--089e0122881e8dbd7204db6fe8cf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div>Previous realization doesn&#39;t consider flags=
 in the status register.<br>Add DS and INTR bits of HST_STS register set af=
ter transaction execution.<br>Update bits resetting in HST_STS register. Up=
date error processing: if DEV_ERR bit are set<br>
transaction isn&#39;t execution.<br><br><br>Signed-off-by: Maksim_Ratnikov =
&lt;<a href=3D"mailto:m.o.ratnikov@gmail.com">m.o.ratnikov@gmail.com</a>&gt=
;<br>---<br>=A0hw/i2c/pm_smbus.c |=A0=A0 13 ++++++++++++-<br>=A01 files cha=
nged, 12 insertions(+), 1 deletions(-)<br>
<br>diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c<br>index 0b5bb89..d5=
f5c56 100644<br>--- a/hw/i2c/pm_smbus.c<br>+++ b/hw/i2c/pm_smbus.c<br>@@ -5=
0,9 +50,16 @@ static void smb_transaction(PMSMBus *s)<br>=A0=A0=A0=A0 i2c_b=
us *bus =3D s-&gt;smbus;<br>
=A0<br>=A0=A0=A0=A0 SMBUS_DPRINTF(&quot;SMBus trans addr=3D0x%02x prot=3D0x=
%02x\n&quot;, addr, prot);<br>+=A0=A0=A0 /* Transaction isn&#39;t exec if D=
EV_ERR bit set */<br>+=A0=A0=A0 if ((s-&gt;smb_stat &amp; 0x04) !=3D 0)<br>=
+=A0=A0=A0=A0=A0=A0=A0 goto error;<br>
=A0=A0=A0=A0 switch(prot) {<br>=A0=A0=A0=A0 case 0x0:<br>=A0=A0=A0=A0=A0=A0=
=A0=A0 smbus_quick_command(bus, addr, read);<br>+=A0=A0=A0=A0=A0=A0=A0 /* S=
et successfully transaction end:<br>+=A0=A0=A0=A0=A0=A0=A0=A0 * ByteDoneSta=
tus =3D 1 (HST_STS bit #7) and INTR =3D 1 (HST_STS bit #1)<br>
+=A0=A0=A0=A0=A0=A0=A0=A0 */<br>+=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_stat |=3D =
0x82;<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x1:<br>=A0=
=A0=A0=A0=A0=A0=A0=A0 if (read) {<br>@@ -60,6 +67,7 @@ static void smb_tran=
saction(PMSMBus *s)<br>=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 smbus_send_byte(bus, addr, cmd);<br>
=A0=A0=A0=A0=A0=A0=A0=A0 }<br>+=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_stat |=3D 0x=
82;<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x2:<br>=A0=A0=
=A0=A0=A0=A0=A0=A0 if (read) {<br>@@ -67,6 +75,7 @@ static void smb_transac=
tion(PMSMBus *s)<br>=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 smbus_write_byte(bus, addr, cmd, s-&gt;smb_data0);<br>
=A0=A0=A0=A0=A0=A0=A0=A0 }<br>+=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_stat |=3D 0x=
82;<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x3:<br>=A0=A0=
=A0=A0=A0=A0=A0=A0 if (read) {<br>@@ -77,6 +86,7 @@ static void smb_transac=
tion(PMSMBus *s)<br>=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 smbus_write_word(bus, addr, cmd, (s-&gt;smb_data1 &lt;&l=
t; 8) | s-&gt;smb_data0);<br>
=A0=A0=A0=A0=A0=A0=A0=A0 }<br>+=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_stat |=3D 0x=
82;<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 case 0x5:<br>=A0=A0=
=A0=A0=A0=A0=A0=A0 if (read) {<br>@@ -84,6 +94,7 @@ static void smb_transac=
tion(PMSMBus *s)<br>=A0=A0=A0=A0=A0=A0=A0=A0 } else {<br>=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 smbus_write_block(bus, addr, cmd, s-&gt;smb_data, s-&gt;=
smb_data0);<br>
=A0=A0=A0=A0=A0=A0=A0=A0 }<br>+=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_stat |=3D 0x=
82;<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 default:<br>=A0=A0=
=A0=A0=A0=A0=A0=A0 goto error;<br>@@ -102,7 +113,7 @@ static void smb_iopor=
t_writeb(void *opaque, hwaddr addr, uint64_t val,<br>=A0=A0=A0=A0 SMBUS_DPR=
INTF(&quot;SMB writeb port=3D0x%04x val=3D0x%02x\n&quot;, addr, val);<br>
=A0=A0=A0=A0 switch(addr) {<br>=A0=A0=A0=A0 case SMBHSTSTS:<br>-=A0=A0=A0=
=A0=A0=A0=A0 s-&gt;smb_stat =3D 0;<br>+=A0=A0=A0=A0=A0=A0=A0 s-&gt;smb_stat=
 =3D (~(val &amp; 0xff)) &amp; s-&gt;smb_stat;<br>=A0=A0=A0=A0=A0=A0=A0=A0 =
s-&gt;smb_index =3D 0;<br>=A0=A0=A0=A0=A0=A0=A0=A0 break;<br>=A0=A0=A0=A0 c=
ase SMBHSTCNT:<br>
-- <br>1.7.3.4<br><br></div>

--089e0122881e8dbd7204db6fe8cf--

