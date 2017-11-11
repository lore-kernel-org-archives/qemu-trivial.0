Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eDKtY-0003xA-VF
	for mharc-qemu-trivial@gnu.org; Fri, 10 Nov 2017 20:47:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eDKtT-0003wf-AV
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 20:47:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eDKtG-0000q5-Of
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 20:47:35 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:51566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1eDKtG-0000p3-GS; Fri, 10 Nov 2017 20:47:22 -0500
Received: by mail-qk0-x244.google.com with SMTP id n66so14036173qki.8;
	Fri, 10 Nov 2017 17:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BcO7m3s4Flpmj9EGTy3nYZwrjRI977SDpWKdyhxKP/s=;
	b=STTZFdbEDbBB+R2vFy6yDi3NyYxjX+rZ9x1Ngd9tcx04UUxszUlkaN+SAV1K+zCWhs
	IAupFV4H3AOHLURkHy7One0mgDekK2COt2/S1ee2KIqxN3bqeI2F4k2mIQUKViJhIKVe
	s+IRKR97Us33mbf54hmJ1p6ujQSw8RqhmmIoWOX6C7IVjhYxLjPGcNv8hwZ00Ghpa+6I
	uDD3GjOGlk+iFNs22T6ZMAVreEQ2mu3ZeEvAuoAY3jFXMCpWh8M146VE1np3IGY5BvPP
	vAEEpGOdzoErLkpuJYj0JM/yjXq7VLXirZapK81SUR9KVctxyq2lX8f8iwAgT2uK23N+
	jFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BcO7m3s4Flpmj9EGTy3nYZwrjRI977SDpWKdyhxKP/s=;
	b=MxQUY1Jl2Ny3yurhD/fsxVixGAusq4V8o7823NxpPDM+QhPeZaPfNpIBVgaxr1WSiG
	ioNoKEqn1tgVIjORND/JDG06kiJ/e9mDCCga/Yqmve7Q5AaVRGiqDtDPWD41nJpoczfT
	DxQxnttWnYJ5p+MK3Kzx43UTg+/5MgiKVwufQRbhcNPd9i3xlSJxc70+rRMfRLlGLb+6
	oSQrgQpUfix8lNwtt6jo6M51mpqyjrBCFpoc9wOv3q5uXr2+mC9A7BE+5ksRgJpWHK/Y
	f4Armtzc8LJuASj/00Z7OY1w6GGPc0Wvw98XhtG9hfIFUEHQJpW+MJt0Z9h4smJnxkcA
	JXAg==
X-Gm-Message-State: AJaThX4dnBQtKDrRnp85U8c97RWPrn4CLzc71A3cdkKw5cO/2Vx9duhH
	MZL9lQdXZssUi9fRVzED1R10xg7y4p9V1lSC8DU=
X-Google-Smtp-Source: AGs4zMZMbpqJdIFlned7a2xKWB87rPxYmLbWLNUHJNy4RyR05/APmncKIEza+4XEjwyooD5kvBw0/15VaKq/IW8PEH0=
X-Received: by 10.55.71.72 with SMTP id u69mr3612774qka.289.1510364841067;
	Fri, 10 Nov 2017 17:47:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.139 with HTTP; Fri, 10 Nov 2017 17:47:00 -0800 (PST)
In-Reply-To: <fac44468-7869-57fa-fb5f-fbd98828489f@vivier.eu>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<fac44468-7869-57fa-fb5f-fbd98828489f@vivier.eu>
From: Zach Riggle <zachriggle@gmail.com>
Date: Fri, 10 Nov 2017 19:47:00 -0600
Message-ID: <CAMP9c5m6GK_Xwt6z3Bj+1WauHzHffzFb1cVD9ojeh2m8gA-D8w@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="001a114a754ad54aa7055dab374f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
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
X-List-Received-Date: Sat, 11 Nov 2017 01:47:39 -0000

--001a114a754ad54aa7055dab374f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch.  Relying on realpath() for *exe* does cause issues.

A better general solution (which handles the "exe" case) is to use open(2)
with O_PATH | O_NOFOLLOW for the candidate path (e.g. /proc/self/exe) and
to do the same for the path we're testing along with readlink().

If, in the process of link resolution via the readlink() loop, we end up
with the same path as our candidate, we can return true.  This avoids the
need to rely on any libc implementation of realpath(), since we're just
relying on the host kernel.


*Zach Riggle*

On Fri, Nov 10, 2017 at 5:44 PM, Laurent Vivier <laurent@vivier.eu> wrote:

> Le 25/10/2017 =C3=A0 05:34, Zach Riggle a =C3=A9crit :
> > Previously, it was possible to get a handle to the "real" /proc/self/me=
m
> > by creating a symlink to it and opening the symlink, or opening e.g.
> > "./mem" after chdir'ing to "/proc/self".
> >
> >     $ ln -s /proc/self self
> >     $ cat self/maps
> >     60000000-602bc000 r-xp 00000000 fc:01 270375
>      /usr/bin/qemu-arm-static
> >     604bc000-6050f000 rw-p 002bc000 fc:01 270375
>      /usr/bin/qemu-arm-static
> >     ...
> >
> > Signed-off-by: Zach Riggle <zachriggle@gmail.com>
> > ---
> >  linux-user/syscall.c | 47 ++++++++++++++++++++++++++++--
> -----------------
> >  1 file changed, 28 insertions(+), 19 deletions(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 9bf901fa11..6c1f28a1f7 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int fd=
)
> >
> >  static int is_proc_myself(const char *filename, const char *entry)
> >  {
> > -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
> > -        filename +=3D strlen("/proc/");
> > -        if (!strncmp(filename, "self/", strlen("self/"))) {
> > -            filename +=3D strlen("self/");
> > -        } else if (*filename >=3D '1' && *filename <=3D '9') {
> > -            char myself[80];
> > -            snprintf(myself, sizeof(myself), "%d/", getpid());
> > -            if (!strncmp(filename, myself, strlen(myself))) {
> > -                filename +=3D strlen(myself);
> > -            } else {
> > -                return 0;
> > -            }
> > -        } else {
> > -            return 0;
> > -        }
> > -        if (!strcmp(filename, entry)) {
> > -            return 1;
> > -        }
> > +    char proc_self_entry[PATH_MAX + 1];
> > +    char proc_self_entry_realpath[PATH_MAX + 1];
> > +    char filename_realpath[PATH_MAX + 1];
> > +
> > +    if (PATH_MAX < snprintf(proc_self_entry,
> > +                            sizeof(proc_self_entry),
> > +                            "/proc/self/%s",
> > +                            entry)) {
> > +        /* Full path to "entry" is too long to fit in the buffer */
> > +        return 0;
> >      }
> > -    return 0;
> > +
> > +    if (!realpath(filename, filename_realpath)) {
> > +        /* File does not exist, or can't be canonicalized */
> > +        return 0;
> > +    }
> > +
> > +    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
> > +        /* Procfs entry does not exist */
> > +        return 0;
> > +    }
> > +
> > +    if (strcmp(filename_realpath, proc_self_entry_realpath) !=3D 0) {
> > +        /* Paths are different */
>
> I think it doesn't work with /proc/map/exe (or other soft link in
> /proc/self) as realpath will give the path of the executable and not the
> path inside /proc so it will be true for any process with the same
> executable (which in our case is qemu for all).
>
> Thanks,
> Laurent
>
>

--001a114a754ad54aa7055dab374f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good catch.=C2=A0 Relying on realpath() for <i>exe</i>=C2=
=A0does cause issues.=C2=A0=C2=A0<div><br></div><div>A better general solut=
ion (which handles the &quot;exe&quot; case) is to use open(2) with O_PATH =
| O_NOFOLLOW for the candidate path (e.g. /proc/self/exe) and to do the sam=
e for the path we&#39;re testing along with readlink().</div><div><br></div=
><div>If, in the process of link resolution via the readlink() loop, we end=
 up with the same path as our candidate, we can return true.=C2=A0 This avo=
ids the need to rely on any libc implementation of realpath(), since we&#39=
;re just relying on the host kernel.=C2=A0=C2=A0</div></div><div class=3D"g=
mail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><b><font face=3D"arial, helvetic=
a, sans-serif"><br>Zach Riggle</font></b><br></div></div></div>
<br><div class=3D"gmail_quote">On Fri, Nov 10, 2017 at 5:44 PM, Laurent Viv=
ier <span dir=3D"ltr">&lt;<a href=3D"mailto:laurent@vivier.eu" target=3D"_b=
lank">laurent@vivier.eu</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div class=3D"HOEnZb"><div class=3D"h5">Le 25/10/2017 =C3=A0 05:34, Za=
ch Riggle a =C3=A9crit=C2=A0:<br>
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
>zachriggle@gmail.com</a>&gt;<br>
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
</blockquote></div><br></div>

--001a114a754ad54aa7055dab374f--

