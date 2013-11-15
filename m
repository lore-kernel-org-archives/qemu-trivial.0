Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VhEF5-0005yj-7p
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2013 02:55:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rizzo.unipi@gmail.com>) id 1VhDFk-0000t0-2m
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 01:51:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rizzo.unipi@gmail.com>) id 1VhDFj-0002Rx-4J
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 01:51:40 -0500
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233]:58030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rizzo.unipi@gmail.com>)
	id 1VhDFg-0002Qr-Lq; Fri, 15 Nov 2013 01:51:37 -0500
Received: by mail-la0-f51.google.com with SMTP id ec20so2420742lab.38
	for <multiple recipients>; Thu, 14 Nov 2013 22:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=tinTt4ulJYkUkaNDD23nyeltW7WWvEIUu3So1dj6e/c=;
	b=jVNzqH6ua4a1IzAjlJWlNDp9uHnKII3iUi4a62tnspXOLAfJuEd7AGpWJs5tZLf1iY
	Tdd/FGxDheEVAUA2EdEr6XpyGXWv+YPLF4c3ef82WyPfKxUkrE5HcLvjJgXJBT+yD6Gy
	aFq6/TOyxVrZ0czdr5VeN3kV9PS+ZcV0DnnQr1sOcyHcUq4Fk9jKgJMavJVxZjSgv6DG
	4zmpI1qNSxspWUZ5c17yYNeK3xGNZi/+i+fi0nCCw+sFf2mWJd46btBPi2O5NarECWuY
	wETvpoLG8vbpSsaLQBbKjqhDEFv835GVjjKEl1kSATzmHgfNndhaZ7HI2MF2Fieqmrww
	Dk4Q==
MIME-Version: 1.0
X-Received: by 10.112.154.129 with SMTP id vo1mr430265lbb.31.1384498294588;
	Thu, 14 Nov 2013 22:51:34 -0800 (PST)
Sender: rizzo.unipi@gmail.com
Received: by 10.114.77.228 with HTTP; Thu, 14 Nov 2013 22:51:34 -0800 (PST)
Date: Fri, 15 Nov 2013 07:51:34 +0100
X-Google-Sender-Auth: xvJEI1MmCXOe2ATUQuucITzA54s
Message-ID: <CA+hQ2+j+Ww4OhHL2tMFdYHaH4FVvtCqYAVCRmbzOBfij=GJVBA@mail.gmail.com>
From: Luigi Rizzo <rizzo@iet.unipi.it>
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=089e0115fb080a8b4404eb31a1d7
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::233
X-Mailman-Approved-At: Fri, 15 Nov 2013 02:55:01 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] better interpreter specification for scripts
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
X-List-Received-Date: Fri, 15 Nov 2013 06:51:41 -0000

--089e0115fb080a8b4404eb31a1d7
Content-Type: text/plain; charset=ISO-8859-1

some of the new scripts in scripts/ specify a interpreter path
which is not always pointing to the right place.
I see that an alternative format is also being used
        #!/usr/bin/env <interpreter_name>
which seems to work better.

The patch below is merely to let master compile on FreeBSD,
but there are other offending files that can be found with
 grep '#!' scripts/*

Signed-off-by: Luigi Rizzo <rizzo@iet.unipi.it>
---
 scripts/acpi_extract.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/acpi_extract.py b/scripts/acpi_extract.py
index 22ea468..66c1b3e 100755
--- a/scripts/acpi_extract.py
+++ b/scripts/acpi_extract.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python
 # Copyright (C) 2011 Red Hat, Inc., Michael S. Tsirkin <mst@redhat.com>
 #
 # This program is free software; you can redistribute it and/or modify
--
1.8.1.2

--089e0115fb080a8b4404eb31a1d7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default"><div class=3D"gmail_default">=
<font face=3D"courier new, monospace">some of the new scripts in scripts/ s=
pecify a interpreter path</font></div><div class=3D"gmail_default"><font fa=
ce=3D"courier new, monospace">which is not always pointing to the right pla=
ce.</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">I see th=
at an alternative format is also being used</font></div><div class=3D"gmail=
_default"><font face=3D"courier new, monospace">=A0 =A0 =A0 =A0 #!/usr/bin/=
env &lt;interpreter_name&gt;</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">which se=
ems to work better.</font></div><div class=3D"gmail_default"><font face=3D"=
courier new, monospace"><br></font></div><div class=3D"gmail_default"><font=
 face=3D"courier new, monospace">The patch below is merely to let master co=
mpile on FreeBSD,</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">but ther=
e are other offending files that can be found with</font></div><div class=
=3D"gmail_default"><font face=3D"courier new, monospace">=A0grep &#39;#!&#3=
9; scripts/*</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace"><br></fo=
nt></div><div class=3D"gmail_default"><font face=3D"courier new, monospace"=
>Signed-off-by: Luigi Rizzo &lt;<a href=3D"mailto:rizzo@iet.unipi.it">rizzo=
@iet.unipi.it</a>&gt;</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">---</fon=
t></div><div class=3D"gmail_default"><font face=3D"courier new, monospace">=
=A0scripts/acpi_extract.py | 2 +-</font></div><div class=3D"gmail_default">=
<font face=3D"courier new, monospace">=A01 file changed, 1 insertion(+), 1 =
deletion(-)</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace"><br></fo=
nt></div><div class=3D"gmail_default"><font face=3D"courier new, monospace"=
>diff --git a/scripts/acpi_extract.py b/scripts/acpi_extract.py</font></div=
><div class=3D"gmail_default">
<font face=3D"courier new, monospace">index 22ea468..66c1b3e 100755</font><=
/div><div class=3D"gmail_default"><font face=3D"courier new, monospace">---=
 a/scripts/acpi_extract.py</font></div><div class=3D"gmail_default"><font f=
ace=3D"courier new, monospace">+++ b/scripts/acpi_extract.py</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">@@ -1,4 =
+1,4 @@</font></div><div class=3D"gmail_default"><font face=3D"courier new,=
 monospace">-#!/usr/bin/python</font></div><div class=3D"gmail_default"><fo=
nt face=3D"courier new, monospace">+#!/usr/bin/env python</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">=A0# Cop=
yright (C) 2011 Red Hat, Inc., Michael S. Tsirkin &lt;<a href=3D"mailto:mst=
@redhat.com">mst@redhat.com</a>&gt;</font></div><div class=3D"gmail_default=
"><font face=3D"courier new, monospace">=A0#</font></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">=A0# Thi=
s program is free software; you can redistribute it and/or modify</font></d=
iv><div class=3D"gmail_default"><font face=3D"courier new, monospace">--</f=
ont></div>
<div class=3D"gmail_default"><font face=3D"courier new, monospace">1.8.1.2<=
/font></div><div style=3D"font-family:&#39;courier new&#39;,monospace"><br>=
</div></div></div>

--089e0115fb080a8b4404eb31a1d7--

