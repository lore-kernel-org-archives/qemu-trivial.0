Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eDKub-0004Us-VG
	for mharc-qemu-trivial@gnu.org; Fri, 10 Nov 2017 20:48:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eDKuY-0004Sf-5z
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 20:48:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eDKuN-0001Cs-FP
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 20:48:42 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43347)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1eDKuN-0001Cl-4n; Fri, 10 Nov 2017 20:48:31 -0500
Received: by mail-qk0-x243.google.com with SMTP id 78so14061157qkz.0;
	Fri, 10 Nov 2017 17:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5FNqodo/DN+uD+iMx+kmH4lIyYAduWiXqLcSZz7nNLk=;
	b=GKVoWuLS9h0uzV4aOGXM5zd+/OCW6/GOY9ZW/N+HXxvtSN90YjmsbKSslpKGnkS7W3
	weFPVyZmL3KwEZQ+k5ifraUdTqeyEDguIPbdNi2FC5cmY/It0wQe6ZiAygkWA4zWwgzk
	nGmcItATIdnZRNhzpze8UQkktPbqGDk+sEQ0RzrJCC5G57fZbSKfVBE+mtG2F7mm06rF
	LCE0QCBfl4BztcBHEYn+l6IMWpI59zol24KR5GHcTHiRu4Bj/GYy34aNxkhcyun45IpK
	v+qTNXhb+TThZKuonrPGNCOtL0MCfS+ZXo2dxz7xmo0E4YGeYhKmoxQyHesJ6f3GsqoF
	UAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5FNqodo/DN+uD+iMx+kmH4lIyYAduWiXqLcSZz7nNLk=;
	b=B96h4Lz+TZQFrCjlBfgBlHeorbQM2NPsTdDCeB8819r3CGts1F5omNzbaz9lhBQgEI
	Cki+vEtWZGUfe7LtIKtgnTG11up/4KoR3xE3rXz8FRCjcMN+mB97/uVqcFEUilfLzJZD
	pMzMhOCnvPAca5JoDtaLeoJJcYfYJ3eEq/iPAnwGY0mYT0YQQsS30CDUIDrrV+3pGDNd
	t/k7oqFhb03cjj4pdKhD8Q613paUQv7NWnF2Mj56+griRphKlaDcfqSZFp0tZPdu1MAR
	OqJDLr3nTxX4ALzn0M4SUBnxuX02vfDp8I5W/0p1o/d5vErXG+ID3Q4T9kv3uCxqwdJS
	TQMw==
X-Gm-Message-State: AJaThX4kj9sUByORM2optc6UTmx3kRL6PJe7kgK7o4NApolIqORmlBGS
	yQN6RGEmnxGqZMG64g1HO2T/UGq06j+zLsZsnpueB4Cs
X-Google-Smtp-Source: AGs4zMZN9TCrBe9qwQYBlf+6eNd/uImKUNCKu6vKzwY3i6fbh1oOuLW3woVBCpBGI54rE6e41DyCEOCgrfrDTkqeHto=
X-Received: by 10.55.170.15 with SMTP id t15mr1642334qke.114.1510364910340;
	Fri, 10 Nov 2017 17:48:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.139 with HTTP; Fri, 10 Nov 2017 17:48:09 -0800 (PST)
In-Reply-To: <CAMP9c5m6GK_Xwt6z3Bj+1WauHzHffzFb1cVD9ojeh2m8gA-D8w@mail.gmail.com>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<fac44468-7869-57fa-fb5f-fbd98828489f@vivier.eu>
	<CAMP9c5m6GK_Xwt6z3Bj+1WauHzHffzFb1cVD9ojeh2m8gA-D8w@mail.gmail.com>
From: Zach Riggle <zachriggle@gmail.com>
Date: Fri, 10 Nov 2017 19:48:09 -0600
Message-ID: <CAMP9c5kG9m-swMJBtdQPzPkjLy7zq9sEdRA-PGcdeFDAT-DH9w@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="94eb2c063566f650fa055dab3b6e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Sat, 11 Nov 2017 01:48:44 -0000

--94eb2c063566f650fa055dab3b6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wrote up a quick example to show that this should work specifically for
/proc/self/exe:

#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
int main(int argc, char** argv) {
    int fd =3D open("/proc/self/exe", O_NOFOLLOW | O_PATH);
    system("ls -la /proc/$PPID/fd/");
}


*Zach Riggle*

On Fri, Nov 10, 2017 at 7:47 PM, Zach Riggle <zachriggle@gmail.com> wrote:

> Good catch.  Relying on realpath() for *exe* does cause issues.
>
> A better general solution (which handles the "exe" case) is to use open(2=
)
> with O_PATH | O_NOFOLLOW for the candidate path (e.g. /proc/self/exe) and
> to do the same for the path we're testing along with readlink().
>
> If, in the process of link resolution via the readlink() loop, we end up
> with the same path as our candidate, we can return true.  This avoids the
> need to rely on any libc implementation of realpath(), since we're just
> relying on the host kernel.
>
>
> *Zach Riggle*
>
> On Fri, Nov 10, 2017 at 5:44 PM, Laurent Vivier <laurent@vivier.eu> wrote=
:
>
>> Le 25/10/2017 =C3=A0 05:34, Zach Riggle a =C3=A9crit :
>> > Previously, it was possible to get a handle to the "real" /proc/self/m=
em
>> > by creating a symlink to it and opening the symlink, or opening e.g.
>> > "./mem" after chdir'ing to "/proc/self".
>> >
>> >     $ ln -s /proc/self self
>> >     $ cat self/maps
>> >     60000000-602bc000 r-xp 00000000 fc:01 270375
>>      /usr/bin/qemu-arm-static
>> >     604bc000-6050f000 rw-p 002bc000 fc:01 270375
>>      /usr/bin/qemu-arm-static
>> >     ...
>> >
>> > Signed-off-by: Zach Riggle <zachriggle@gmail.com>
>> > ---
>> >  linux-user/syscall.c | 47 ++++++++++++++++++++++++++++--
>> -----------------
>> >  1 file changed, 28 insertions(+), 19 deletions(-)
>> >
>> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> > index 9bf901fa11..6c1f28a1f7 100644
>> > --- a/linux-user/syscall.c
>> > +++ b/linux-user/syscall.c
>> > @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int f=
d)
>> >
>> >  static int is_proc_myself(const char *filename, const char *entry)
>> >  {
>> > -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
>> > -        filename +=3D strlen("/proc/");
>> > -        if (!strncmp(filename, "self/", strlen("self/"))) {
>> > -            filename +=3D strlen("self/");
>> > -        } else if (*filename >=3D '1' && *filename <=3D '9') {
>> > -            char myself[80];
>> > -            snprintf(myself, sizeof(myself), "%d/", getpid());
>> > -            if (!strncmp(filename, myself, strlen(myself))) {
>> > -                filename +=3D strlen(myself);
>> > -            } else {
>> > -                return 0;
>> > -            }
>> > -        } else {
>> > -            return 0;
>> > -        }
>> > -        if (!strcmp(filename, entry)) {
>> > -            return 1;
>> > -        }
>> > +    char proc_self_entry[PATH_MAX + 1];
>> > +    char proc_self_entry_realpath[PATH_MAX + 1];
>> > +    char filename_realpath[PATH_MAX + 1];
>> > +
>> > +    if (PATH_MAX < snprintf(proc_self_entry,
>> > +                            sizeof(proc_self_entry),
>> > +                            "/proc/self/%s",
>> > +                            entry)) {
>> > +        /* Full path to "entry" is too long to fit in the buffer */
>> > +        return 0;
>> >      }
>> > -    return 0;
>> > +
>> > +    if (!realpath(filename, filename_realpath)) {
>> > +        /* File does not exist, or can't be canonicalized */
>> > +        return 0;
>> > +    }
>> > +
>> > +    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
>> > +        /* Procfs entry does not exist */
>> > +        return 0;
>> > +    }
>> > +
>> > +    if (strcmp(filename_realpath, proc_self_entry_realpath) !=3D 0) {
>> > +        /* Paths are different */
>>
>> I think it doesn't work with /proc/map/exe (or other soft link in
>> /proc/self) as realpath will give the path of the executable and not the
>> path inside /proc so it will be true for any process with the same
>> executable (which in our case is qemu for all).
>>
>> Thanks,
>> Laurent
>>
>>
>

--94eb2c063566f650fa055dab3b6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wrote up a quick example to show that this should work s=
pecifically for /proc/self/exe:<div><br></div><div><div>#define _GNU_SOURCE=
</div><div>#include &lt;sys/types.h&gt;</div><div>#include &lt;sys/stat.h&g=
t;</div><div>#include &lt;fcntl.h&gt;</div><div>#include &lt;unistd.h&gt;</=
div><div>int main(int argc, char** argv) {</div><div>=C2=A0 =C2=A0 int fd =
=3D open(&quot;/proc/self/exe&quot;, O_NOFOLLOW | O_PATH);</div><div>=C2=A0=
 =C2=A0 system(&quot;ls -la /proc/$PPID/fd/&quot;);</div><div>}</div></div>=
</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><b><font fa=
ce=3D"arial, helvetica, sans-serif"><br>Zach Riggle</font></b><br></div></d=
iv></div>
<br><div class=3D"gmail_quote">On Fri, Nov 10, 2017 at 7:47 PM, Zach Riggle=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:zachriggle@gmail.com" target=3D"_b=
lank">zachriggle@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr">Good catch.=C2=A0 Relying on realpath() for <i>exe=
</i>=C2=A0does cause issues.=C2=A0=C2=A0<div><br></div><div>A better genera=
l solution (which handles the &quot;exe&quot; case) is to use open(2) with =
O_PATH | O_NOFOLLOW for the candidate path (e.g. /proc/self/exe) and to do =
the same for the path we&#39;re testing along with readlink().</div><div><b=
r></div><div>If, in the process of link resolution via the readlink() loop,=
 we end up with the same path as our candidate, we can return true.=C2=A0 T=
his avoids the need to rely on any libc implementation of realpath(), since=
 we&#39;re just relying on the host kernel.=C2=A0=C2=A0</div></div><div cla=
ss=3D"gmail_extra"><span class=3D"HOEnZb"><font color=3D"#888888"><br clear=
=3D"all"><div><div class=3D"m_8555934408960091644gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><b><font face=3D"arial, helvetic=
a, sans-serif"><br>Zach Riggle</font></b><br></div></div></div></font></spa=
n><div><div class=3D"h5">
<br><div class=3D"gmail_quote">On Fri, Nov 10, 2017 at 5:44 PM, Laurent Viv=
ier <span dir=3D"ltr">&lt;<a href=3D"mailto:laurent@vivier.eu" target=3D"_b=
lank">laurent@vivier.eu</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div class=3D"m_8555934408960091644HOEnZb"><div class=3D"m_85559344089=
60091644h5">Le 25/10/2017 =C3=A0 05:34, Zach Riggle a =C3=A9crit=C2=A0:<br>
&gt; Previously, it was possible to get a handle to the &quot;real&quot; /p=
roc/self/mem<br>
&gt; by creating a symlink to it and opening the symlink, or opening e.g.<b=
r>
&gt; &quot;./mem&quot; after chdir&#39;ing to &quot;/proc/self&quot;.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$ ln -s /proc/self self<br>
&gt;=C2=A0 =C2=A0 =C2=A0$ cat self/maps<br>
&gt;=C2=A0 =C2=A0 =C2=A060000000-602bc000 r-xp 00000000 fc:01 270375=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/qemu-arm-static<br>
&gt;=C2=A0 =C2=A0 =C2=A0604bc000-6050f000 rw-p 002bc000 fc:01 270375=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/qemu-arm-static<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;<br>
&gt; Signed-off-by: Zach Riggle &lt;<a href=3D"mailto:zachriggle@gmail.com"=
 target=3D"_blank">zachriggle@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/syscall.c | 47 ++++++++++++++++++++++++++++--<wbr>---=
--------------<br>
&gt;=C2=A0 1 file changed, 28 insertions(+), 19 deletions(-)<br>
&gt;<br>
&gt; diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
&gt; index 9bf901fa11..6c1f28a1f7 100644<br>
&gt; --- a/linux-user/syscall.c<br>
&gt; +++ b/linux-user/syscall.c<br>
&gt; @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int f=
d)<br>
&gt;<br>
&gt;=C2=A0 static int is_proc_myself(const char *filename, const char *entr=
y)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 if (!strncmp(filename, &quot;/proc/&quot;, strlen(&quot=
;/proc/&quot;))) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D strlen(&quot;/proc/&quot;);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(filename, &quot;self/&quot;,=
 strlen(&quot;self/&quot;))) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D strlen(&quot;=
self/&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (*filename &gt;=3D &#39;1&#39; =
&amp;&amp; *filename &lt;=3D &#39;9&#39;) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char myself[80];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(myself, sizeof(mys=
elf), &quot;%d/&quot;, getpid());<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(filename, myse=
lf, strlen(myself))) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D=
 strlen(myself);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(filename, entry)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 char proc_self_entry[PATH_MAX + 1];<br>
&gt; +=C2=A0 =C2=A0 char proc_self_entry_realpath[PATH_<wbr>MAX + 1];<br>
&gt; +=C2=A0 =C2=A0 char filename_realpath[PATH_MAX + 1];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (PATH_MAX &lt; snprintf(proc_self_entry,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(proc_self_entry),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/proc/self/%s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Full path to &quot;entry&quot; is too =
long to fit in the buffer */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!realpath(filename, filename_realpath)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* File does not exist, or can&#39;t be c=
anonicalized */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!realpath(proc_self_entry, proc_self_entry_realpath=
)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Procfs entry does not exist */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (strcmp(filename_realpath, proc_self_entry_realpath)=
 !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Paths are different */<br>
<br>
</div></div>I think it doesn&#39;t work with /proc/map/exe (or other soft l=
ink in<br>
/proc/self) as realpath will give the path of the executable and not the<br=
>
path inside /proc so it will be true for any process with the same<br>
executable (which in our case is qemu for all).<br>
<br>
Thanks,<br>
Laurent<br>
<br>
</blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--94eb2c063566f650fa055dab3b6e--

