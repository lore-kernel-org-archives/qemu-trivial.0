Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e884u-0000oX-Kk
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2017 13:05:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e884s-0000oK-Gg
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 13:05:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e884n-000215-TW
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 13:05:50 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:52310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1e884n-0001zp-OH; Fri, 27 Oct 2017 13:05:45 -0400
Received: by mail-qt0-x241.google.com with SMTP id 31so9232764qtz.9;
	Fri, 27 Oct 2017 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tInVP8ThBpud9079nICZqEMVgxZy+tVYKc+maxgRNac=;
	b=q0tXs6OXy42RHABa7PHBtkDb2g5fOybgJzVTkS4KhyledxZKirmFZ1IdGMmmMR+JnR
	1Lp+Hdy+L/XvdjKBWnjHZpV0ozoYBhGT/cBPDeY6dEsngeOOonhcUZzck3URVw6rK/O8
	QWYUiAXaG3QYpOq5aQGFfZRIzpb9aIPnTFMFddRtzrfE1wOVGNcRqxiwE2CghcC3cOQP
	r9xEf1i8aMh1elz5fcDxG7CIFrge4y7joSG9SWzEfJXzKKZxB/cItlgOlqevbdOWCyFo
	H/YthmJayhw2c2vf7OnKp3ewStiyK1EnC5rue4i96rL/+w8rugF9MVUNdubtcN+UML5+
	69bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tInVP8ThBpud9079nICZqEMVgxZy+tVYKc+maxgRNac=;
	b=sv+5C/1lDZBW6lLkvIRWHUbdbB0ClHzDhbOeZzU3sG02DvlQAsmESMJKBX35FlnSRB
	d9E3X7/dogCFIu8yx9x1RTqeWsxjZFAcfDPgugYkajJSwnBHD4P4bSPddKxmxefhh0tA
	jmIhQ0IsvroJRrVuHpFqZ4Qxev38YopOF/JRbWuPwmG8b8z+9O4RYK24pwesTJCAnDBp
	fDOZrfqunpkMZiGs6EnlLJf3aYRBjMeJ3Nda2OKf61p+PvglGgIBFaHiiFSlmbpb2JO2
	z6tCIP4/kfTduTq0j9CSsJ+t90MZ4uFRVVaQJL1uxiB6EnyCSx6frQX1fCmMS5IqXEk6
	eX6A==
X-Gm-Message-State: AMCzsaVIGHK3pVWq/974kMU13aVUoEpKcWmaiFykrENcjC+LZrhGe6ZW
	leM0yhR9xWtbREOy4v3yoIGpo6ikBZIsulglTPA=
X-Google-Smtp-Source: ABhQp+SJPJ6n8ilBKURv+X5cS+n4MkvHWHnyVIHvhGCs4UydcyyxGFaDCsporlyw9PZwDe/Mu4ilLfS8Tdy2S0+QZlg=
X-Received: by 10.200.17.1 with SMTP id c1mr1826386qtj.252.1509123944891; Fri,
	27 Oct 2017 10:05:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.139 with HTTP; Fri, 27 Oct 2017 10:05:24 -0700 (PDT)
In-Reply-To: <20171027093600.GA29513@kos.to>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
From: Zach Riggle <zachriggle@gmail.com>
Date: Fri, 27 Oct 2017 12:05:24 -0500
Message-ID: <CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
To: Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="089e08265168a84b1a055c8a4c7c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user: fix is_proc_myself to
 check the paths via realpath
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
X-List-Received-Date: Fri, 27 Oct 2017 17:05:52 -0000

--089e08265168a84b1a055c8a4c7c
Content-Type: text/plain; charset="UTF-8"

The symlink was just an easy test case.  Doing cd proc && cat ./self/maps
will achieve the same thing.

One instance where this matters is for testing IoT device firmware
exploits, where one might do a GET request against
../../../../../../proc/self/maps in order to bypass ASLR.  Currently, this
will return the memory layout of QEMU, not the emulated memory layout of
the software under test.


*Zach Riggle*

On Fri, Oct 27, 2017 at 4:36 AM, Riku Voipio <riku.voipio@iki.fi> wrote:

> On Thu, Oct 26, 2017 at 04:06:22PM -0500, Zach Riggle wrote:
> > Friendly ping :)
> >
> > I've updated the patch with v2 which addresses the style issue
>
> I'll have a look at it soon.
>
> >
> > *Zach Riggle*
> >
> > On Tue, Oct 24, 2017 at 10:34 PM, Zach Riggle <zachriggle@gmail.com>
> wrote:
> >
> > > Previously, it was possible to get a handle to the "real"
> /proc/self/mem
> > > by creating a symlink to it and opening the symlink, or opening e.g.
> > > "./mem" after chdir'ing to "/proc/self"
>
> When is this a problem? Symlinking to /proc/self seems to be a quite weird
> usecase.
>
> > >
> > >     $ ln -s /proc/self self
> > >     $ cat self/maps
> > >     60000000-602bc000 r-xp 00000000 fc:01 270375
> > >    /usr/bin/qemu-arm-static
> > >     604bc000-6050f000 rw-p 002bc000 fc:01 270375
> > >    /usr/bin/qemu-arm-static
> > >     ...
> > >
> > > Signed-off-by: Zach Riggle <zachriggle@gmail.com>
> > > ---
> > >  linux-user/syscall.c | 47 ++++++++++++++++++++++++++++--
> -----------------
> > >  1 file changed, 28 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > > index 9bf901fa11..6c1f28a1f7 100644
> > > --- a/linux-user/syscall.c
> > > +++ b/linux-user/syscall.c
> > > @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int
> fd)
> > >
> > >  static int is_proc_myself(const char *filename, const char *entry)
> > >  {
> > > -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
> > > -        filename += strlen("/proc/");
> > > -        if (!strncmp(filename, "self/", strlen("self/"))) {
> > > -            filename += strlen("self/");
> > > -        } else if (*filename >= '1' && *filename <= '9') {
> > > -            char myself[80];
> > > -            snprintf(myself, sizeof(myself), "%d/", getpid());
> > > -            if (!strncmp(filename, myself, strlen(myself))) {
> > > -                filename += strlen(myself);
> > > -            } else {
> > > -                return 0;
> > > -            }
> > > -        } else {
> > > -            return 0;
> > > -        }
> > > -        if (!strcmp(filename, entry)) {
> > > -            return 1;
> > > -        }
> > > +    char proc_self_entry[PATH_MAX + 1];
> > > +    char proc_self_entry_realpath[PATH_MAX + 1];
> > > +    char filename_realpath[PATH_MAX + 1];
> > > +
> > > +    if (PATH_MAX < snprintf(proc_self_entry,
> > > +                            sizeof(proc_self_entry),
> > > +                            "/proc/self/%s",
> > > +                            entry)) {
> > > +        /* Full path to "entry" is too long to fit in the buffer */
> > > +        return 0;
> > >      }
> > > -    return 0;
> > > +
> > > +    if (!realpath(filename, filename_realpath)) {
> > > +        /* File does not exist, or can't be canonicalized */
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
> > > +        /* Procfs entry does not exist */
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (strcmp(filename_realpath, proc_self_entry_realpath) != 0) {
> > > +        /* Paths are different */
> > > +        return 0;
> > > +    }
> > > +
> > > +    /* filename refers to /proc/self/<entry> */
> > > +    return 1;
> > >  }
> > >
> > >  #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
> > > --
> > > 2.14.3
> > >
> > >
>

--089e08265168a84b1a055c8a4c7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The symlink was just an easy test case.=C2=A0 Doing cd pro=
c &amp;&amp; cat ./self/maps will achieve the same thing.<div><br></div><di=
v>One instance where this matters is for testing IoT device firmware exploi=
ts, where one might do a GET request against ../../../../../../proc/self/ma=
ps in order to bypass ASLR.=C2=A0 Currently, this will return the memory la=
yout of QEMU, not the emulated memory layout of the software under test.</d=
iv></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><b><font=
 face=3D"arial, helvetica, sans-serif"><br>Zach Riggle</font></b><br></div>=
</div></div>
<br><div class=3D"gmail_quote">On Fri, Oct 27, 2017 at 4:36 AM, Riku Voipio=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:riku.voipio@iki.fi" target=3D"_bla=
nk">riku.voipio@iki.fi</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D"">On Thu, Oct 26, 2017 at 04:06:22PM -0500, Zach Riggle =
wrote:<br>
&gt; Friendly ping :)<br>
&gt;<br>
&gt; I&#39;ve updated the patch with v2 which addresses the style issue<br>
<br>
</span>I&#39;ll have a look at it soon.<br>
<br>
&gt;<br>
&gt; *Zach Riggle*<br>
<span class=3D"">&gt;<br>
&gt; On Tue, Oct 24, 2017 at 10:34 PM, Zach Riggle &lt;<a href=3D"mailto:za=
chriggle@gmail.com">zachriggle@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Previously, it was possible to get a handle to the &quot;real&quo=
t; /proc/self/mem<br>
&gt; &gt; by creating a symlink to it and opening the symlink, or opening e=
.g.<br>
&gt; &gt; &quot;./mem&quot; after chdir&#39;ing to &quot;/proc/self&quot;<b=
r>
<br>
</span>When is this a problem? Symlinking to /proc/self seems to be a quite=
 weird usecase.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0$ ln -s /proc/self self<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0$ cat self/maps<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A060000000-602bc000 r-xp 00000000 fc:01 270375<b=
r>
&gt; &gt;=C2=A0 =C2=A0 /usr/bin/qemu-arm-static<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0604bc000-6050f000 rw-p 002bc000 fc:01 270375<b=
r>
&gt; &gt;=C2=A0 =C2=A0 /usr/bin/qemu-arm-static<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Zach Riggle &lt;<a href=3D"mailto:zachriggle@gmail=
.com">zachriggle@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 linux-user/syscall.c | 47 ++++++++++++++++++++++++++++--<wb=
r>-----------------<br>
&gt; &gt;=C2=A0 1 file changed, 28 insertions(+), 19 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
&gt; &gt; index 9bf901fa11..6c1f28a1f7 100644<br>
&gt; &gt; --- a/linux-user/syscall.c<br>
&gt; &gt; +++ b/linux-user/syscall.c<br>
&gt; &gt; @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, =
int fd)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static int is_proc_myself(const char *filename, const char =
*entry)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 if (!strncmp(filename, &quot;/proc/&quot;, strlen(=
&quot;/proc/&quot;))) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D strlen(&quot;/proc/&qu=
ot;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(filename, &quot;self/&q=
uot;, strlen(&quot;self/&quot;))) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D strlen(&=
quot;self/&quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (*filename &gt;=3D &#39;1&=
#39; &amp;&amp; *filename &lt;=3D &#39;9&#39;) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char myself[80];<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(myself, sizeo=
f(myself), &quot;%d/&quot;, getpid());<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(filename,=
 myself, strlen(myself))) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename=
 +=3D strlen(myself);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0=
;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(filename, entry)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 char proc_self_entry[PATH_MAX + 1];<br>
&gt; &gt; +=C2=A0 =C2=A0 char proc_self_entry_realpath[PATH_<wbr>MAX + 1];<=
br>
&gt; &gt; +=C2=A0 =C2=A0 char filename_realpath[PATH_MAX + 1];<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (PATH_MAX &lt; snprintf(proc_self_entry,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(proc_self_entry),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/proc/self/%s&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Full path to &quot;entry&quot; is=
 too long to fit in the buffer */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!realpath(filename, filename_realpath)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* File does not exist, or can&#39;t=
 be canonicalized */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!realpath(proc_self_entry, proc_self_entry_rea=
lpath)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Procfs entry does not exist */<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (strcmp(filename_realpath, proc_self_entry_real=
path) !=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Paths are different */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* filename refers to /proc/self/&lt;entry&gt; */<=
br>
&gt; &gt; +=C2=A0 =C2=A0 return 1;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #if defined(HOST_WORDS_BIGENDIAN) !=3D defined(TARGET_WORDS=
_<wbr>BIGENDIAN)<br>
&gt; &gt; --<br>
&gt; &gt; 2.14.3<br>
&gt; &gt;<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div>

--089e08265168a84b1a055c8a4c7c--

