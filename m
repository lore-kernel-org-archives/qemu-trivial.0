Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTVPK-0003Wf-Vx
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 04:15:50 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wudx05@gmail.com>) id 1RTVPE-0003DM-Rk
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 04:15:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wudx05@gmail.com>) id 1RTVPD-000747-8b
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 04:15:44 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:57911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wudx05@gmail.com>)
	id 1RTVP1-00071t-Hc; Thu, 24 Nov 2011 04:15:31 -0500
Received: by qabg14 with SMTP id g14so5652292qab.4
	for <multiple recipients>; Thu, 24 Nov 2011 01:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mrLYiIfYjwi3p6SMXw24DdMcVN5MfEz8rH/iy926l3w=;
	b=tP0SPPppBS7xY/k2riEutl5dOQOHP7WG1f+GRa5n/SJbWucpLBkvpukE/45XIFM56K
	/EnL8Avz69L+1j7SXgjivLxO6KNwqsxOQ4ejO+wU8Eh1QZNqVLdwH+gwgDeFI0h9Ro/W
	MNgxP2iMeQ64lBmc2FNtKq4B2iQk7RMyyprOY=
MIME-Version: 1.0
Received: by 10.182.36.36 with SMTP id n4mr9292184obj.16.1322126130206; Thu,
	24 Nov 2011 01:15:30 -0800 (PST)
Received: by 10.182.75.65 with HTTP; Thu, 24 Nov 2011 01:15:30 -0800 (PST)
In-Reply-To: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>
References: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>
Date: Thu, 24 Nov 2011 17:15:30 +0800
Message-ID: <CAOfR6VHZHvcp-808F5n2NPv4E_zUjeToNBjx_2FyM+Wjb+oY5A@mail.gmail.com>
From: Mark <wudx05@gmail.com>
To: Zhi Hui Li <zhihuili@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary=f46d0444eeaf56d8d904b2777a66
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] os-win32.c : fix memory leak
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
X-List-Received-Date: Thu, 24 Nov 2011 09:15:49 -0000

--f46d0444eeaf56d8d904b2777a66
Content-Type: text/plain; charset=UTF-8

If you free the string, it will cause the environment variable unavailable.
 More details please see the following text extracted from manual of
"putenv":

       The  libc4  and  libc5  and  glibc 2.1.2 versions conform to SUSv2:
the pointer string given to putenv() is used.  In particular, this
       string becomes part of the environment; changing it later will
change the environment.  (Thus, it is an error is to call putenv() with
       an automatic variable as the argument, then return from the calling
function while string is still part of the environment.)  However,
       glibc 2.0-2.1.1 differs: a copy of the string is used.  On the one
hand this causes a memory leak, and on the other hand  it  violates
       SUSv2.  This has been fixed in glibc 2.1.2.


2011/11/24 Zhi Hui Li <zhihuili@linux.vnet.ibm.com>

> string is allocated by g_malloc, will not be used after putenv, should be
> free before return.
>
> Signed-off-by: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
> ---
>  os-win32.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/os-win32.c b/os-win32.c
> index 8ad5fa1..e6e9143 100644
> --- a/os-win32.c
> +++ b/os-win32.c
> @@ -44,6 +44,7 @@ int setenv(const char *name, const char *value, int
> overwrite)
>          char *string = g_malloc(length);
>          snprintf(string, length, "%s=%s", name, value);
>          result = putenv(string);
> +        g_free(string);
>      }
>      return result;
>  }
> --
> 1.7.4.1
>
>
>

--f46d0444eeaf56d8d904b2777a66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

If you free the string, it will cause the environment variable unavailable.=
 =C2=A0More details please see the following text=C2=A0extracted from manua=
l of &quot;putenv&quot;:<div><br></div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0The =C2=A0libc4 =C2=A0and =C2=A0libc5 =C2=A0and =C2=A0glibc 2.1.2 versio=
ns conform to SUSv2: the pointer string given to putenv() is used. =C2=A0In=
 particular, this</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0string becomes part of the environment; cha=
nging it later will change the environment. =C2=A0(Thus, it is an error is =
to call putenv() with</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0an automatic var=
iable as the argument, then return from the calling function while string i=
s still part of the environment.) =C2=A0However,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc 2.0-2.1.1 differs: a copy of the stri=
ng is used. =C2=A0On the one hand this causes a memory leak, and on the oth=
er hand =C2=A0it =C2=A0violates</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0SUSv2.=
 =C2=A0This has been fixed in glibc 2.1.2.</div><div><br>
</div><br><div class=3D"gmail_quote">2011/11/24 Zhi Hui Li <span dir=3D"ltr=
">&lt;<a href=3D"mailto:zhihuili@linux.vnet.ibm.com">zhihuili@linux.vnet.ib=
m.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
string is allocated by g_malloc, will not be used after putenv, should be f=
ree before return.<br><br>Signed-off-by: Li Zhi Hui &lt;<a href=3D"mailto:z=
hihuili@linux.vnet.ibm.com" target=3D"_blank">zhihuili@linux.vnet.ibm.com</=
a>&gt;<br>
---<br>
=C2=A0os-win32.c |=C2=A0=C2=A0=C2=A0 1 +<br>=C2=A01 files changed, 1 insert=
ions(+), 0 deletions(-)<br><br>diff --git a/os-win32.c b/os-win32.c<br>inde=
x 8ad5fa1..e6e9143 100644<br>--- a/os-win32.c<br>+++ b/os-win32.c<br>@@ -44=
,6 +44,7 @@ int setenv(const char *name, const char *value, int overwrite)<=
br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *string =3D g_malloc(=
length);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snprintf(strin=
g, length, &quot;%s=3D%s&quot;, name, value);<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 result =3D putenv(string);<br>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 g_free(string);<br>=C2=A0=C2=A0=C2=A0=C2=A0 }<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 return result;<br>=C2=A0}<span class=3D"HOEnZb"><f=
ont color=3D"#888888"><br>
-- <br>
1.7.4.1<br><br><br>
</font></span></blockquote></div><br></div>

--f46d0444eeaf56d8d904b2777a66--

