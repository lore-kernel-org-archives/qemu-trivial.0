Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZhG6-0000sN-FU
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 06:35:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1QZhG2-0000rj-4K
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 06:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1QZhG0-0001mo-AB
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 06:35:33 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:33174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>)
	id 1QZhFv-0001lC-Vi; Thu, 23 Jun 2011 06:35:28 -0400
Received: by qwj8 with SMTP id 8so985829qwj.4
	for <multiple recipients>; Thu, 23 Jun 2011 03:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=yjWfzDg5CI2zN5EdSp/CrfGAfVi/K3nGtxm5wFjeGPE=;
	b=BQ1vaDwVrkYpPrvH47NrLQ1JWYIAgdFeGeMOqfyhZs1affWkWtXXKINct3TBAnUQ0n
	vGrmypU+uJgG1SUcU4h4cNDMqZ9P9l3mtSYXl0pJJlE8podAgnftYnH2b7ogNuA+e3Yo
	wTNnInv9/hRqW73ARRO1Y0G8Rr3G8HkRx45zw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=MdoAk4AZ1oFHyE8IEW4JsH4hC6BXF6A7b8+TQKrxJChAQT1B1i5YN8aiyYehcbwyHB
	1EO2bLpPtOxZPYK4UfOLCaVga46+FE1sFbqQJKACrfJVvXydGhc9l468Fqowc6MYCSZN
	Xm4T/g9hM4qPYlWTySQ4/Fz0tTLC8eB/8iyU0=
MIME-Version: 1.0
Received: by 10.224.185.129 with SMTP id co1mr1132375qab.384.1308825326484;
	Thu, 23 Jun 2011 03:35:26 -0700 (PDT)
Received: by 10.224.6.136 with HTTP; Thu, 23 Jun 2011 03:35:26 -0700 (PDT)
In-Reply-To: <57FD980B-E6A3-4E1A-A83B-062B9954DB5C@web.de>
References: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
	<57FD980B-E6A3-4E1A-A83B-062B9954DB5C@web.de>
Date: Thu, 23 Jun 2011 20:35:26 +1000
Message-ID: <BANLkTimJgByZ3TpNE9CFAC+QB4xNmQoE7Q@mail.gmail.com>
From: Matthew Fernandez <matthew.fernandez@gmail.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
Content-Type: multipart/alternative; boundary=20cf30334f25a87b4c04a65ea4fb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel Developers <qemu-devel@nongnu.org>,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Fix comment typos
	in hw/armv7m.c
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
X-List-Received-Date: Thu, 23 Jun 2011 10:35:37 -0000

--20cf30334f25a87b4c04a65ea4fb
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 23 June 2011 20:22, Andreas F=E4rber <andreas.faerber@web.de> wrote:

> Am 23.06.2011 um 02:59 schrieb Matthew Fernandez:
>
>
>  Fix a couple of typos in comments.
>>
>> Signed-off-by: Matthew Fernandez <matthew.fernandez@gmail.com>
>> ----
>> This patch doesn't touch any code and should (hopefully) not be
>> controversial. There doesn't seem to be a maintainer for this file,
>> but changes are trivial.
>>
>>
>> diff --git a/hw/armv7m.c b/hw/armv7m.c
>> index 72d010a..83f3393 100644
>> --- a/hw/armv7m.c
>> +++ b/hw/armv7m.c
>> @@ -4,7 +4,7 @@
>>  * Copyright (c) 2006-2007 CodeSourcery.
>>  * Written by Paul Brook
>>  *
>> - * This code is licenced under the GPL.
>> + * This code is licensed under the GPL.
>>
>
> Nack. Licence is British English, license American English. It's not wron=
g.

Licence is the noun in British English, while license in the noun in
American English. License is the correct verb in both. Nevertheless, I don'=
t
think this is worth debating. If there's dissent I'm happy to drop the firs=
t
part of the patch.

>
>
>   */
>>
>> #include "sysbus.h"
>> @@ -14,7 +14,7 @@
>>
>> /* Bitbanded IO.  Each word corresponds to a single bit.  */
>>
>> -/* Get the byte address of the real memory for a bitband acess.  */
>> +/* Get the byte address of the real memory for a bitband access.  */
>>
>
> This one's okay.
>
> Andreas
>
>
>  static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
>> {
>>    uint32_t res;
>>
>>
>

--20cf30334f25a87b4c04a65ea4fb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On 23 June 2011 20:22, Andreas F=E4rber =
<span dir=3D"ltr">&lt;<a href=3D"mailto:andreas.faerber@web.de">andreas.fae=
rber@web.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); =
padding-left: 1ex;">
Am 23.06.2011 um 02:59 schrieb Matthew Fernandez:<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Fix a couple of typos in comments.<br>
<br>
Signed-off-by: Matthew Fernandez &lt;<a href=3D"mailto:matthew.fernandez@gm=
ail.com" target=3D"_blank">matthew.fernandez@gmail.com</a>&gt;<br>
----<br>
This patch doesn&#39;t touch any code and should (hopefully) not be<br>
controversial. There doesn&#39;t seem to be a maintainer for this file,<br>
but changes are trivial.<br>
<br>
<br>
diff --git a/hw/armv7m.c b/hw/armv7m.c<br>
index 72d010a..83f3393 100644<br>
--- a/hw/armv7m.c<br>
+++ b/hw/armv7m.c<br>
@@ -4,7 +4,7 @@<br>
=A0* Copyright (c) 2006-2007 CodeSourcery.<br>
=A0* Written by Paul Brook<br>
=A0*<br>
- * This code is licenced under the GPL.<br>
+ * This code is licensed under the GPL.<br>
</blockquote>
<br></div>
Nack. Licence is British English, license American English. It&#39;s not wr=
ong.</blockquote><div>Licence is the noun in British English, while license=
 in the noun in American English. License is the correct verb in both. Neve=
rtheless, I don&#39;t think this is worth debating. If there&#39;s dissent =
I&#39;m happy to drop the first part of the patch.<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div class=
=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
=A0*/<br>
<br>
#include &quot;sysbus.h&quot;<br>
@@ -14,7 +14,7 @@<br>
<br>
/* Bitbanded IO. =A0Each word corresponds to a single bit. =A0*/<br>
<br>
-/* Get the byte address of the real memory for a bitband acess. =A0*/<br>
+/* Get the byte address of the real memory for a bitband access. =A0*/<br>
</blockquote>
<br></div>
This one&#39;s okay.<br><font color=3D"#888888">
<br>
Andreas</font><div><div></div><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
static inline uint32_t bitband_addr(void * opaque, uint32_t addr)<br>
{<br>
 =A0 =A0uint32_t res;<br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br>

--20cf30334f25a87b4c04a65ea4fb--

