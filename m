Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7pMW-0005iP-46
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 17:06:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e7pMT-0005iJ-JH
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 17:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e7pMS-0002AH-CF
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 17:06:45 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1e7pMS-00029T-5o; Thu, 26 Oct 2017 17:06:44 -0400
Received: by mail-qt0-x243.google.com with SMTP id j58so6098649qtj.0;
	Thu, 26 Oct 2017 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dZAEncuCZcPuxgFj538hWZI3rrkUsAhmgWT3H/s1HZg=;
	b=f0wqF2asIadNIgwDkh3O+YzUN/eWVrro5sCQ701d39pAf5z5v2gt7eGBgQkpR5TsFC
	wIxlonoZgd37pa523HNWP5pVPOju4WjuqnDT/WZ1bVsyi05lnjVcpIHy1jVaYpLtxvSx
	hRAdZo2j/9Y2Tbh2h2Zilb0aFralX7m98Sas2V8g5rWt9SiH70IOQ2zlOxSWavgzHIYq
	cbMhqYxgbTZlQ8N9gSDaXpsJEDojiDoe684GtuWqqvZd/j9Th742TGZCBr+XVHa+xLBS
	z44/JdvlrAG9nZkN6Ji4vw6pHLuruvMRMOF3pnmB6QG6B7K6l823XHVmyRbF/BmafGVp
	c0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dZAEncuCZcPuxgFj538hWZI3rrkUsAhmgWT3H/s1HZg=;
	b=HAafcfPtEaG/HY+UKeZVArKiIAK021BkJP4kdRDxNioC4c4bsMDDaDohTnr3McoSkl
	XR/laq6Zj4oC9Og7cLiVlwDT/ILMDvEEmn1/Dej11SUwIyYON7jacAavvNW8AKW/vLVW
	WNoDYUSLTw/Bt03hYCHFzBXNrdcjASzRSwZGZ/1adC5HAXrj1ogYtd3hJTImKB1/N7zM
	JxrPjLy44DooSuvCOQ5Fo4zaji+eG1bNBEegRAdGoWw4EoHYzNl/4KwSQySW+xqCb1PM
	dVN/DW9FqS/23ivBr+hHC+jXlMVTH182XsqRQFcd+nguI+hDYIQCp9D6Ny9qzdFaM7fU
	snkg==
X-Gm-Message-State: AMCzsaV0XgfPqjtlU7qOS4q4L1Ooc5JvMuLIx332YaRv1i3c3QVvlWmU
	4kEduCzI4RRKkNjsS0X68yaUeZtMdAmp9QBo0pQ=
X-Google-Smtp-Source: ABhQp+TBZLYPaS0biZtg2mABkCZEnGPyBnGVQ2EvxwKWot5tnY6NMIiRc6u7XABQJRzgPXr2lKkWQGs7vWhTxJzZAGc=
X-Received: by 10.200.17.1 with SMTP id c1mr35321018qtj.252.1509052003338;
	Thu, 26 Oct 2017 14:06:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.139 with HTTP; Thu, 26 Oct 2017 14:06:22 -0700 (PDT)
In-Reply-To: <20171025033442.44872-1-zachriggle@gmail.com>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
From: Zach Riggle <zachriggle@gmail.com>
Date: Thu, 26 Oct 2017 16:06:22 -0500
Message-ID: <CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
To: Zach Riggle <zachriggle@gmail.com>
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, 
	Laurent Vivier <laurent@vivier.eu>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="089e082651689b4e6b055c798c47"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
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
X-List-Received-Date: Thu, 26 Oct 2017 21:06:47 -0000

--089e082651689b4e6b055c798c47
Content-Type: text/plain; charset="UTF-8"

Friendly ping :)

I've updated the patch with v2 which addresses the style issue


*Zach Riggle*

On Tue, Oct 24, 2017 at 10:34 PM, Zach Riggle <zachriggle@gmail.com> wrote:

> Previously, it was possible to get a handle to the "real" /proc/self/mem
> by creating a symlink to it and opening the symlink, or opening e.g.
> "./mem" after chdir'ing to "/proc/self".
>
>     $ ln -s /proc/self self
>     $ cat self/maps
>     60000000-602bc000 r-xp 00000000 fc:01 270375
>    /usr/bin/qemu-arm-static
>     604bc000-6050f000 rw-p 002bc000 fc:01 270375
>    /usr/bin/qemu-arm-static
>     ...
>
> Signed-off-by: Zach Riggle <zachriggle@gmail.com>
> ---
>  linux-user/syscall.c | 47 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9bf901fa11..6c1f28a1f7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int fd)
>
>  static int is_proc_myself(const char *filename, const char *entry)
>  {
> -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
> -        filename += strlen("/proc/");
> -        if (!strncmp(filename, "self/", strlen("self/"))) {
> -            filename += strlen("self/");
> -        } else if (*filename >= '1' && *filename <= '9') {
> -            char myself[80];
> -            snprintf(myself, sizeof(myself), "%d/", getpid());
> -            if (!strncmp(filename, myself, strlen(myself))) {
> -                filename += strlen(myself);
> -            } else {
> -                return 0;
> -            }
> -        } else {
> -            return 0;
> -        }
> -        if (!strcmp(filename, entry)) {
> -            return 1;
> -        }
> +    char proc_self_entry[PATH_MAX + 1];
> +    char proc_self_entry_realpath[PATH_MAX + 1];
> +    char filename_realpath[PATH_MAX + 1];
> +
> +    if (PATH_MAX < snprintf(proc_self_entry,
> +                            sizeof(proc_self_entry),
> +                            "/proc/self/%s",
> +                            entry)) {
> +        /* Full path to "entry" is too long to fit in the buffer */
> +        return 0;
>      }
> -    return 0;
> +
> +    if (!realpath(filename, filename_realpath)) {
> +        /* File does not exist, or can't be canonicalized */
> +        return 0;
> +    }
> +
> +    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
> +        /* Procfs entry does not exist */
> +        return 0;
> +    }
> +
> +    if (strcmp(filename_realpath, proc_self_entry_realpath) != 0) {
> +        /* Paths are different */
> +        return 0;
> +    }
> +
> +    /* filename refers to /proc/self/<entry> */
> +    return 1;
>  }
>
>  #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
> --
> 2.14.3
>
>

--089e082651689b4e6b055c798c47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Friendly ping :)=C2=A0<div><br></div><div>I&#39;ve updated=
 the patch with v2 which addresses the style issue</div></div><div class=3D=
"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" data-sm=
artmail=3D"gmail_signature"><div dir=3D"ltr"><b><font face=3D"arial, helvet=
ica, sans-serif"><br>Zach Riggle</font></b><br></div></div></div>
<br><div class=3D"gmail_quote">On Tue, Oct 24, 2017 at 10:34 PM, Zach Riggl=
e <span dir=3D"ltr">&lt;<a href=3D"mailto:zachriggle@gmail.com" target=3D"_=
blank">zachriggle@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">Previously, it was possible to get a handle to th=
e &quot;real&quot; /proc/self/mem<br>
by creating a symlink to it and opening the symlink, or opening e.g.<br>
&quot;./mem&quot; after chdir&#39;ing to &quot;/proc/self&quot;.<br>
<br>
=C2=A0 =C2=A0 $ ln -s /proc/self self<br>
=C2=A0 =C2=A0 $ cat self/maps<br>
=C2=A0 =C2=A0 60000000-602bc000 r-xp 00000000 fc:01 270375=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/usr/bin/qemu-arm-static<br>
=C2=A0 =C2=A0 604bc000-6050f000 rw-p 002bc000 fc:01 270375=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/usr/bin/qemu-arm-static<br>
=C2=A0 =C2=A0 ...<br>
<br>
Signed-off-by: Zach Riggle &lt;<a href=3D"mailto:zachriggle@gmail.com">zach=
riggle@gmail.com</a>&gt;<br>
---<br>
</span>=C2=A0linux-user/syscall.c | 47 ++++++++++++++++++++++++++++--<wbr>-=
----------------<br>
=C2=A01 file changed, 28 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index 9bf901fa11..6c1f28a1f7 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int fd)<br=
>
<span class=3D""><br>
=C2=A0static int is_proc_myself(const char *filename, const char *entry)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (!strncmp(filename, &quot;/proc/&quot;, strlen(&quot;/pro=
c/&quot;))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D strlen(&quot;/proc/&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(filename, &quot;self/&quot;, strl=
en(&quot;self/&quot;))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D strlen(&quot;self/=
&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (*filename &gt;=3D &#39;1&#39; &amp;=
&amp; *filename &lt;=3D &#39;9&#39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char myself[80];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(myself, sizeof(myself),=
 &quot;%d/&quot;, getpid());<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(filename, myself, s=
trlen(myself))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename +=3D strl=
en(myself);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(filename, entry)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 char proc_self_entry[PATH_MAX + 1];<br>
+=C2=A0 =C2=A0 char proc_self_entry_realpath[PATH_<wbr>MAX + 1];<br>
+=C2=A0 =C2=A0 char filename_realpath[PATH_MAX + 1];<br>
+<br>
+=C2=A0 =C2=A0 if (PATH_MAX &lt; snprintf(proc_self_entry,<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(proc_self_entry),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/proc/self/%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 entry)) {<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ful=
l path to &quot;entry&quot; is too long to fit in the buffer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return 0;<br>
+<br>
+=C2=A0 =C2=A0 if (!realpath(filename, filename_realpath)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* File does not exist, or can&#39;t be canoni=
calized */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!realpath(proc_self_entry, proc_self_entry_realpath)) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Procfs entry does not exist */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (strcmp(filename_realpath, proc_self_entry_realpath) !=3D=
 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Paths are different */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* filename refers to /proc/self/&lt;entry&gt; */<br>
+=C2=A0 =C2=A0 return 1;<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(HOST_WORDS_BIGENDIAN) !=3D defined(TARGET_WORDS_<wbr>BIGE=
NDIAN)<br>
--<br>
2.14.3<br>
<br>
</div></div></blockquote></div><br></div>

--089e082651689b4e6b055c798c47--

