Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e89yx-0001tP-9x
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2017 15:07:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e89yt-0001sz-Oa
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 15:07:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e89ys-0000sD-0o
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 15:07:47 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1e89yr-0000rj-QN; Fri, 27 Oct 2017 15:07:45 -0400
Received: by mail-qt0-x242.google.com with SMTP id h4so9664244qtk.8;
	Fri, 27 Oct 2017 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t8TxwLXwW6CqVgjfgZ0H4Ne2woZBY9joWzdM3PyRKfg=;
	b=LET5+/yY+CKJR2iyPrn4uKBG8BdBlqWqAfW/QJQal1pvo4SDeO89GEdkUGnxlLAH66
	1JTHt45mBJmi9KwcfNUAaPoWPNiyzF68HCXxitVeXkxSk3pHC/w7+9CRJGACMKO8M96j
	IrHGnfo2DMOI2QJPzL7qQUEPQ2C1MdS4aLqvQU992Rfk59qefe80QuK9eVPn/IN9ogZ2
	UYx76ItmBBa5P05yQWLXyb/gR1X/Ux36f97BAIvqzbgn149kKpHm6zNAOkUqkdbUGSMl
	tF3kphsYbLYFWWjKoEAYJNz34qu2rJpDcr9Pq6VDRtBVOO3qQWQtOCWllmXgCETT7dmS
	LJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t8TxwLXwW6CqVgjfgZ0H4Ne2woZBY9joWzdM3PyRKfg=;
	b=qwTfKiwZmp0yVuL5UuHVG/gLYegLq23Wrz2TrdO9W9THVkfciVwzCHLGGcX0agE7c4
	mVcFNpjJNyZjhFNykmILJYpC7JQwkPC3cvF7KW/dtPObkOCm5B8HTsLZpEbd2fRNscv5
	PAoKF0DBSqqgDYEWa88JUhQZ4lzmz7rSOdflm5H5/1dY2ihRf70uSmOYovK3h+EOw3AM
	IZVN1XEt/cETOh014IIO5IsQxNhQbAmYpJs0yrbICwDATxzs+/3VH36BhR2LFzmSIvSf
	1hB0l9zPcBU4qXHRO1RPmIjIXtOWIU0R3dzHgbBKh1PXF8YyyJTMu9/hn0B+bTdv56pm
	lIaA==
X-Gm-Message-State: AMCzsaWVOJ50UHDwvNkdd3GVdmJkIfouVVMN9pLZn8MTDsDPg5I73Mj/
	7AcANGQnhC3LdWMCoiK9QouxAQ2Jt/AVI2EJz1Q=
X-Google-Smtp-Source: ABhQp+Tv2N/OAKa4+QC6e4NgpjKK7GNSdnfH58A5/sUwLd/45MqMdtlHu0xUDXwi0ef/coEKreyY34yB6shVfK0ZkXY=
X-Received: by 10.237.35.58 with SMTP id h55mr2520656qtc.108.1509131264898;
	Fri, 27 Oct 2017 12:07:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.139 with HTTP; Fri, 27 Oct 2017 12:07:24 -0700 (PDT)
In-Reply-To: <CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
	<CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
From: Zach Riggle <zachriggle@gmail.com>
Date: Fri, 27 Oct 2017 14:07:24 -0500
Message-ID: <CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
To: Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="001a113e828ef6bc09055c8c00b2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
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
X-List-Received-Date: Fri, 27 Oct 2017 19:07:49 -0000

--001a113e828ef6bc09055c8c00b2
Content-Type: text/plain; charset="UTF-8"

Another case that may be more relevant for general QEMU use, is that the
current code fails if the software under test has poor path-handling code.
For example, any of

- //proc/self/maps
- /proc//self/maps
- /proc/self//maps

Will all return the non-emulated results.  Those examples are just path
canonicalization issues and could be resolved with e.g.
canonicalize_file_name, but I'm not sure if QEMU allows GNU extensions --
and realpath() is portable.




*Zach Riggle*

On Fri, Oct 27, 2017 at 12:05 PM, Zach Riggle <zachriggle@gmail.com> wrote:

> The symlink was just an easy test case.  Doing cd proc && cat ./self/maps
> will achieve the same thing.
>
> One instance where this matters is for testing IoT device firmware
> exploits, where one might do a GET request against
> ../../../../../../proc/self/maps in order to bypass ASLR.  Currently,
> this will return the memory layout of QEMU, not the emulated memory layout
> of the software under test.
>
>
> *Zach Riggle*
>
> On Fri, Oct 27, 2017 at 4:36 AM, Riku Voipio <riku.voipio@iki.fi> wrote:
>
>> On Thu, Oct 26, 2017 at 04:06:22PM -0500, Zach Riggle wrote:
>> > Friendly ping :)
>> >
>> > I've updated the patch with v2 which addresses the style issue
>>
>> I'll have a look at it soon.
>>
>> >
>> > *Zach Riggle*
>> >
>> > On Tue, Oct 24, 2017 at 10:34 PM, Zach Riggle <zachriggle@gmail.com>
>> wrote:
>> >
>> > > Previously, it was possible to get a handle to the "real"
>> /proc/self/mem
>> > > by creating a symlink to it and opening the symlink, or opening e.g.
>> > > "./mem" after chdir'ing to "/proc/self"
>>
>> When is this a problem? Symlinking to /proc/self seems to be a quite
>> weird usecase.
>>
>> > >
>> > >     $ ln -s /proc/self self
>> > >     $ cat self/maps
>> > >     60000000-602bc000 r-xp 00000000 fc:01 270375
>> > >    /usr/bin/qemu-arm-static
>> > >     604bc000-6050f000 rw-p 002bc000 fc:01 270375
>> > >    /usr/bin/qemu-arm-static
>> > >     ...
>> > >
>> > > Signed-off-by: Zach Riggle <zachriggle@gmail.com>
>> > > ---
>> > >  linux-user/syscall.c | 47 ++++++++++++++++++++++++++++--
>> -----------------
>> > >  1 file changed, 28 insertions(+), 19 deletions(-)
>> > >
>> > > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> > > index 9bf901fa11..6c1f28a1f7 100644
>> > > --- a/linux-user/syscall.c
>> > > +++ b/linux-user/syscall.c
>> > > @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int
>> fd)
>> > >
>> > >  static int is_proc_myself(const char *filename, const char *entry)
>> > >  {
>> > > -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
>> > > -        filename += strlen("/proc/");
>> > > -        if (!strncmp(filename, "self/", strlen("self/"))) {
>> > > -            filename += strlen("self/");
>> > > -        } else if (*filename >= '1' && *filename <= '9') {
>> > > -            char myself[80];
>> > > -            snprintf(myself, sizeof(myself), "%d/", getpid());
>> > > -            if (!strncmp(filename, myself, strlen(myself))) {
>> > > -                filename += strlen(myself);
>> > > -            } else {
>> > > -                return 0;
>> > > -            }
>> > > -        } else {
>> > > -            return 0;
>> > > -        }
>> > > -        if (!strcmp(filename, entry)) {
>> > > -            return 1;
>> > > -        }
>> > > +    char proc_self_entry[PATH_MAX + 1];
>> > > +    char proc_self_entry_realpath[PATH_MAX + 1];
>> > > +    char filename_realpath[PATH_MAX + 1];
>> > > +
>> > > +    if (PATH_MAX < snprintf(proc_self_entry,
>> > > +                            sizeof(proc_self_entry),
>> > > +                            "/proc/self/%s",
>> > > +                            entry)) {
>> > > +        /* Full path to "entry" is too long to fit in the buffer */
>> > > +        return 0;
>> > >      }
>> > > -    return 0;
>> > > +
>> > > +    if (!realpath(filename, filename_realpath)) {
>> > > +        /* File does not exist, or can't be canonicalized */
>> > > +        return 0;
>> > > +    }
>> > > +
>> > > +    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
>> > > +        /* Procfs entry does not exist */
>> > > +        return 0;
>> > > +    }
>> > > +
>> > > +    if (strcmp(filename_realpath, proc_self_entry_realpath) != 0) {
>> > > +        /* Paths are different */
>> > > +        return 0;
>> > > +    }
>> > > +
>> > > +    /* filename refers to /proc/self/<entry> */
>> > > +    return 1;
>> > >  }
>> > >
>> > >  #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
>> > > --
>> > > 2.14.3
>> > >
>> > >
>>
>
>

--001a113e828ef6bc09055c8c00b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another case that may be more relevant for general QEMU us=
e, is that the current code fails if the software under test has poor path-=
handling code.=C2=A0 For example, any of<div><br></div><div>- //proc/self/m=
aps</div><div>- /proc//self/maps</div><div>- /proc/self//maps</div><div><br=
></div><div>Will all return the non-emulated results.=C2=A0 Those examples =
are just path canonicalization issues and could be resolved with e.g. canon=
icalize_file_name, but I&#39;m not sure if QEMU allows GNU extensions -- an=
d realpath() is portable.<br><div><br></div><div><br></div></div></div><div=
 class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><b><font face=3D"aria=
l, helvetica, sans-serif"><br>Zach Riggle</font></b><br></div></div></div>
<br><div class=3D"gmail_quote">On Fri, Oct 27, 2017 at 12:05 PM, Zach Riggl=
e <span dir=3D"ltr">&lt;<a href=3D"mailto:zachriggle@gmail.com" target=3D"_=
blank">zachriggle@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr">The symlink was just an easy test case.=C2=A0 Doi=
ng cd proc &amp;&amp; cat ./self/maps will achieve the same thing.<div><br>=
</div><div>One instance where this matters is for testing IoT device firmwa=
re exploits, where one might do a GET request against ../../../../../../pro=
c/self/<wbr>maps in order to bypass ASLR.=C2=A0 Currently, this will return=
 the memory layout of QEMU, not the emulated memory layout of the software =
under test.</div></div><div class=3D"gmail_extra"><span class=3D"HOEnZb"><f=
ont color=3D"#888888"><br clear=3D"all"><div><div class=3D"m_13249929306386=
36987gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
b><font face=3D"arial, helvetica, sans-serif"><br>Zach Riggle</font></b><br=
></div></div></div></font></span><div><div class=3D"h5">
<br><div class=3D"gmail_quote">On Fri, Oct 27, 2017 at 4:36 AM, Riku Voipio=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:riku.voipio@iki.fi" target=3D"_bla=
nk">riku.voipio@iki.fi</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span>On Thu, Oct 26, 2017 at 04:06:22PM -0500, Zach Riggle wrote:<br>
&gt; Friendly ping :)<br>
&gt;<br>
&gt; I&#39;ve updated the patch with v2 which addresses the style issue<br>
<br>
</span>I&#39;ll have a look at it soon.<br>
<br>
&gt;<br>
&gt; *Zach Riggle*<br>
<span>&gt;<br>
&gt; On Tue, Oct 24, 2017 at 10:34 PM, Zach Riggle &lt;<a href=3D"mailto:za=
chriggle@gmail.com" target=3D"_blank">zachriggle@gmail.com</a>&gt; wrote:<b=
r>
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
<div class=3D"m_1324992930638636987HOEnZb"><div class=3D"m_1324992930638636=
987h5"><br>
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
.com" target=3D"_blank">zachriggle@gmail.com</a>&gt;<br>
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
_BIGENDIAN<wbr>)<br>
&gt; &gt; --<br>
&gt; &gt; 2.14.3<br>
&gt; &gt;<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--001a113e828ef6bc09055c8c00b2--

