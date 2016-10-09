Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btAU9-0003Sm-P9
	for mharc-qemu-trivial@gnu.org; Sun, 09 Oct 2016 05:33:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1btAU7-0003Qk-3q
	for qemu-trivial@nongnu.org; Sun, 09 Oct 2016 05:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1btAU5-0002w1-NN
	for qemu-trivial@nongnu.org; Sun, 09 Oct 2016 05:33:31 -0400
Received: from mail-it0-x22d.google.com ([2607:f8b0:4001:c0b::22d]:37252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>)
	id 1btAU2-0002tE-Em; Sun, 09 Oct 2016 05:33:26 -0400
Received: by mail-it0-x22d.google.com with SMTP id z65so45492262itc.0;
	Sun, 09 Oct 2016 02:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zzu02fG+eGRtGTkyV+0o8/1Fx4Ddf572c6GNIyQJ1OY=;
	b=c5nbGz081UTvdFDM03CVa8lvV6CEPOB7zDO0QHBwy+ax7OgnYJ/60Fv+bun4XUnvJU
	TQBw7n2tZD7y1J1A9dTYY6QvSqzTRg/XzPdVVd9hY1JtqjwRZxS5ntUBdiv03g9EtJJh
	BILOce68dALvQSdrQBmQryUrzXr7tSRO/agoFeygwnV+q4fP6Zl1H2l7zof6Dna/RMxL
	xOMUG5EaQ5JxZIXGuMYtyJzDfKc2PMQ8hwzmze2i259j50eZTvIc4e32J/i8Tc8NUuIJ
	ME1C3HkprX7wOw6Gq4VDyq3BF51CVeD5twJNiGKvYz6NVYO21U+O+foQbNFCb0QOoVK7
	+oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zzu02fG+eGRtGTkyV+0o8/1Fx4Ddf572c6GNIyQJ1OY=;
	b=FLPMXODB43H+jIc1YSA9w0wNrGdimtSg6wJzZaQ8bo9zzaoGJmFsh9JgcYHeTcXcEm
	lcjaelXYxWpFoKbjFI60ItDi8SHQKtlxgUa+tiVR9CienyXfXvf7kfdXpxTnDmgpOHF9
	QD4VKFdEvmvzZLslHXqeOpofPbp8HlXC5OYysDe9RCX+oL5/GKn2HGlOVGJ8r0UK+7CX
	NDxzyjhmu6ZLYyWaah+ioGVxUrqV6vRTdaMNN888GiCp4Ydf1X/+FquOgmsQWGsrXeR9
	JmRNuMTOBds3ruAc2cqUAXC7nDLTYtGk0NQcmvnTVz2IPsS25ylxgqOk2uRJIJFXObeB
	CvZw==
X-Gm-Message-State: AA6/9RnkCWLV4HVPNosYjvW/y8zmC5L2OQkgnrh21jZSqntrYudXcswWsGwO+X2GPt48lRwsrqs37u3SCsFy6g==
X-Received: by 10.36.3.141 with SMTP id e135mr4943763ite.76.1476005605895;
	Sun, 09 Oct 2016 02:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.159.8 with HTTP; Sun, 9 Oct 2016 02:33:25 -0700 (PDT)
In-Reply-To: <45036bfe-789a-3f56-4b24-a507b9e9140a@redhat.com>
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
	<290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
	<CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>
	<45036bfe-789a-3f56-4b24-a507b9e9140a@redhat.com>
From: Anand J <anand.indukala@gmail.com>
Date: Sun, 9 Oct 2016 15:03:25 +0530
Message-ID: <CANDALvmjgU4JERC1e7DaUzzw8C1LonikfpZrwo9DpbiEBdaOxg@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=001a1144d692d37526053e6b5562
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] clean-up: removed duplicate
 #includes
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
X-List-Received-Date: Sun, 09 Oct 2016 09:33:32 -0000

--001a1144d692d37526053e6b5562
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 9, 2016 at 3:04 AM, Eric Blake <eblake@redhat.com> wrote:

> On 10/08/2016 06:32 AM, Anand J wrote:
> > I have replied for the questions inline. Also I'll make changes to the
> > patch as per the review and send the updated one.
> >
> > Thanks,
> > Anand
> >
> > On Fri, Oct 7, 2016 at 8:01 PM, Eric Blake <eblake@redhat.com> wrote:
> >
> >> On 10/07/2016 03:46 AM, Anand J wrote:
> >>> Some files contain multiple #includes of the same header file.
> >>> Removed most of those unnecessary duplicate entries.
> >>
> >> How did you find these? Is it a repeatable formula for rerunning a year
> >> from now to find new culprits?  If so, listing it in the commit message
> >> would be worthwhile.  Is it something we should add to
> >> scripts/clean-includes?
> >>
> > I executed the following bash script to get multiple occurrences of
> > #includes and manually checked each and every file from the output.
> >
> > grep -r --exclude-dir=bin/ "#include" | sort | uniq -c | awk '{if ($1 >
> 1)
> > print $2}'
>
> Seems simple enough that we ought to make it part of the
> scripts/clean-includes, rather than remembering to manually run it.
>

scripts/clean-includes does an in place modification of the duplicate
entries in the files.
There is no guarantee that my script with return all genuine duplicate
entries. Some can be false positive as well.
Are you asking me to add this script in as a comment in
scripts/clean-includes files? Like the one
for checking if all the files start with #include "osdep.h" ?

# for i in $(git ls-tree --name-only HEAD) ; do test -f $i && \
#   grep -E '^# *include' $i | head -1 | grep 'osdep.h' ; test $? != 0 && \
#   echo $i ; done



> >
> > But there are lot of noise in the output of this command. Most of the
> > multiple #includes were not genuine issue. @Eric Do you want me to add
> this
> > in the comment?
>
> Yes - whatever we end up with (whether a manual script or a run of
> scripts/clean-includes), documenting the process used makes it easier to
> verify that you didn't miss anything, and for someone else to repeat the
> process in another year when some mistakes have crept back in during the
> meantime.
>
agree. Adding to the comments for future reference.

>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>
>

--001a1144d692d37526053e6b5562
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Oct 9, 2016 at 3:04 AM, Eric Blake <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:eblake@redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-">On 10/08/2016 06:32 AM, Anand J wrote:<br>
&gt; I have replied for the questions inline. Also I&#39;ll make changes to=
 the<br>
&gt; patch as per the review and send the updated one.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Anand<br>
&gt;<br>
&gt; On Fri, Oct 7, 2016 at 8:01 PM, Eric Blake &lt;<a href=3D"mailto:eblak=
e@redhat.com">eblake@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On 10/07/2016 03:46 AM, Anand J wrote:<br>
&gt;&gt;&gt; Some files contain multiple #includes of the same header file.=
<br>
&gt;&gt;&gt; Removed most of those unnecessary duplicate entries.<br>
&gt;&gt;<br>
&gt;&gt; How did you find these? Is it a repeatable formula for rerunning a=
 year<br>
&gt;&gt; from now to find new culprits?=C2=A0 If so, listing it in the comm=
it message<br>
&gt;&gt; would be worthwhile.=C2=A0 Is it something we should add to<br>
&gt;&gt; scripts/clean-includes?<br>
&gt;&gt;<br>
&gt; I executed the following bash script to get multiple occurrences of<br=
>
&gt; #includes and manually checked each and every file from the output.<br=
>
&gt;<br>
&gt; grep -r --exclude-dir=3Dbin/ &quot;#include&quot; | sort | uniq -c | a=
wk &#39;{if ($1 &gt; 1)<br>
&gt; print $2}&#39;<br>
<br>
</span>Seems simple enough that we ought to make it part of the<br>
scripts/clean-includes, rather than remembering to manually run it.<br></bl=
ockquote><div>=C2=A0</div><div>scripts/clean-includes does an in place modi=
fication of the duplicate entries in the files.=C2=A0</div><div>There is no=
 guarantee that my script with return all genuine duplicate entries. Some c=
an be false positive as well.</div><div>Are you asking me to add this scrip=
t in as a comment in scripts/clean-includes files? Like the one</div><div>f=
or checking if all the files start with #include &quot;osdep.h&quot; ?</div=
><div><br></div><div><div># for i in $(git ls-tree --name-only HEAD) ; do t=
est -f $i &amp;&amp; \</div><div># =C2=A0 grep -E &#39;^# *include&#39; $i =
| head -1 | grep &#39;osdep.h&#39; ; test $? !=3D 0 &amp;&amp; \</div><div>=
# =C2=A0 echo $i ; done</div></div><div><br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt;<br>
&gt; But there are lot of noise in the output of this command. Most of the<=
br>
&gt; multiple #includes were not genuine issue. @Eric Do you want me to add=
 this<br>
&gt; in the comment?<br>
<br>
</span>Yes - whatever we end up with (whether a manual script or a run of<b=
r>
scripts/clean-includes), documenting the process used makes it easier to<br=
>
verify that you didn&#39;t miss anything, and for someone else to repeat th=
e<br>
process in another year when some mistakes have crept back in during the<br=
>
meantime.<br></blockquote><div>agree. Adding to the comments for future ref=
erence.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
--<br>
Eric Blake=C2=A0 =C2=A0eblake redhat com=C2=A0 =C2=A0 +1-919-301-3266<br>
Libvirt virtualization library <a href=3D"http://libvirt.org" rel=3D"norefe=
rrer" target=3D"_blank">http://libvirt.org</a><br>
<br>
</div></div></blockquote></div><br></div></div>

--001a1144d692d37526053e6b5562--

