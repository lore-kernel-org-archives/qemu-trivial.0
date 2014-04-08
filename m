Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXfSL-00066p-N0
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 19:29:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WXfSI-00060k-7w
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 19:29:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WXfSG-0001wV-Fp
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 19:29:26 -0400
Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236]:36548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>)
	id 1WXfSC-0001vt-Ec; Tue, 08 Apr 2014 19:29:20 -0400
Received: by mail-ob0-f182.google.com with SMTP id uz6so1843259obc.41
	for <multiple recipients>; Tue, 08 Apr 2014 16:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=s+XpXTo9U7WdfMGgY7oSD5ut/QpJQKzMKNWkzg9WeBw=;
	b=gU0Uzwe/8468mtB8bzH9KHho3Jnlw0WQlubjjeNMrJPvB8GrZonwbTwxmVII/jI79d
	lin8BIYpWg9CBAbfqBHxY4QzCd3cUxByiCmEbNFraVV1GvLIHXtUjGI31NKMjBk9Z2VF
	jPdW9bGgtZ+/a+bmv6I+F35P2qACcgZcZfoJSih0i8sd1OlHRzK84z+8Gh45ZqVgzki0
	PwFm/+7gbJ5IZWJjhOhjlcFUFknFa15+StpJFbCUgKZJDNbcGZHMMhwQW6YCMlGzwQ9D
	eNE3aB7/9a4pNG4u6c7t56+ZuM+P9f0GVDsCx8poDXZDdirCX8U/sVm6Vsdj2uQAjB+z
	U12A==
MIME-Version: 1.0
X-Received: by 10.182.129.134 with SMTP id nw6mr5666673obb.34.1396999759805;
	Tue, 08 Apr 2014 16:29:19 -0700 (PDT)
Received: by 10.60.43.104 with HTTP; Tue, 8 Apr 2014 16:29:19 -0700 (PDT)
In-Reply-To: <5344513D.7050806@redhat.com>
References: <1396985438-19741-1-git-send-email-wangbj@gmail.com>
	<5344513D.7050806@redhat.com>
Date: Tue, 8 Apr 2014 16:29:19 -0700
Message-ID: <CAC+a-TYVLK8covhRMwoeAqTJt=Gby2Kf4Jz8z5w=ZLDhNaCdZw@mail.gmail.com>
From: Baojun Wang <wangbj@gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary=089e015370886f43f004f6905aaa
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH V3 1/1] Add pmemsave command for both
 monitor and qmp,
 which could be useful to have qemu-softmmu as a cross debugger to load guest
 physical memory.
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
X-List-Received-Date: Tue, 08 Apr 2014 23:29:28 -0000

--089e015370886f43f004f6905aaa
Content-Type: text/plain; charset=UTF-8

(Re-send because missing reply-to-all)

Really appreciate your time and valuable input Eric. I almost didn't submit
any patches, so there is quite a lot to learn about it.


I'd agree with you on this, but memsave/pmemsave function are using stdio,
thus I was trying to be consistent with them.


>  > +    if (!f) {
> > +        error_setg_file_open(errp, errno, filename);
> > +        return;
> > +    }
> > +
> > +    while (size != 0) {
> > +        l = fread(buf, 1, sizeof(buf), f);
> > +        if (l > size)
> > +            l = size;
>
> How about error handling as below, the same error handling is used by
memsave/pmemsave.

        l = fread(buf, 1, sizeof(buf), f);
        if (l ! = sizeof(buf)) {
            error_set(errp, QERR_IO_ERROR);
            goto eixt;
        }



> This is lousy at error detection.  Again, you should be using read(),
> not fread(), and properly erroring out on read failures rather than
> silently ignoring them.
>
>
> > +        .name       = "pmemload",
> > +        .args_type  = "val:l,size:i,filename:s",
>
> Would it make sense to put filename as the FIRST argument, with val and
> size as optional arguments (defaulting to reading in at address 0 and
> for the size determined by the length of the input file), rather than
> forcing the user to pass in a size up front?
>
> Same reason as above, I though it could be easier if pmemload takes the
same arguments as memsave/pmemsave.

Again, really thanks for your patient.

Best Regards


On Tue, Apr 8, 2014 at 12:42 PM, Eric Blake <eblake@redhat.com> wrote:

> On 04/08/2014 01:30 PM, Baojun Wang wrote:
>
> Your subject line is extremely long.  In general, we strive for
> something less than 60 characters, so that 'git shortlog -30' can
> display the entire line in an 80-column terminal.  Also, the subject
> mentions pmemsave, but your commit mentions pmemload - it's very
> misleading to provide a patch where the commit message doesn't even
> mention the name of the command the patch is adding.  I would suggest a
> subject line of:
>
> qmp: add pmemload command
>
> > I found this could be useful to have qemu-softmmu as a cross debugger
> (launch
> > with -s -S command line option), then if we can have a command to load
> guest
> > physical memory, we can use cross gdb to do some target debug which gdb
> cannot
> > do directly.
> >
>
> Your patch is lacking a Signed-off-by designation, therefore we cannot
> accept it yet.
>
> > Many thanks to Eric Blake for review the patch.
>
> This comment may be useful to reviewers, but is not part of the commit
> itself, so it belongs better...
>
> >
> > ---
>
> ...here, after the --- separator.
>
>
> >
> > +void qmp_pmemload(int64_t addr, int64_t size, const char *filename,
> > +                  Error **errp)
> > +{
> > +    FILE *f;
> > +    uint32_t l;
> > +    uint8_t buf[1024];
> > +
> > +    f = fopen(filename, "rb");
>
> Rather than using fopen() and FILE* operations, I'd prefer you use
> qemu_open() and lower-level read() operations.  In particular, this will
> automatically make it possible for management applications to pass in
> '/dev/fdset/1' to reuse a file descriptor that they passed in to qemu,
> rather than forcing qemu to directly open the file.
>
> > +    if (!f) {
> > +        error_setg_file_open(errp, errno, filename);
> > +        return;
> > +    }
> > +
> > +    while (size != 0) {
> > +        l = fread(buf, 1, sizeof(buf), f);
> > +        if (l > size)
> > +            l = size;
>
> This is lousy at error detection.  Again, you should be using read(),
> not fread(), and properly erroring out on read failures rather than
> silently ignoring them.
>
>
> > +        .name       = "pmemload",
> > +        .args_type  = "val:l,size:i,filename:s",
>
> Would it make sense to put filename as the FIRST argument, with val and
> size as optional arguments (defaulting to reading in at address 0 and
> for the size determined by the length of the input file), rather than
> forcing the user to pass in a size up front?
>
> > +++ b/qapi-schema.json
> > @@ -1708,6 +1708,26 @@
> >    'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
> >
> >  ##
> > +# @pmemload:
> > +#
> > +# Load a portion of guest physical memory from a file.
> > +#
> > +# @val: the physical address of the guest to start from
> > +#
> > +# @size: the size of memory region to load
> > +#
> > +# @filename: the file to load the memory from as binary data
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 2.1
> > +#
> > +# Notes: Errors were not reliably returned until 2.1
>
> Delete this line.  I guess I didn't make it clear in my first review
> that this line is bogus copy and paste.  You don't need it.  pmemsave
> needed it, because pmemsave went through some iterations where earlier
> versions were buggy.  But your pmemload command is brand new, and should
> not have bugs worth worrying about.
>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>
>

--089e015370886f43f004f6905aaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(Re-send because missing reply-to-all)<br><br><div>Really =
appreciate your time and valuable input Eric. I almost didn&#39;t=20
submit any patches, so there is quite a lot to learn about it.<br><br><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div>I&#39;d agree wit=
h you on this, but memsave/pmemsave function are using stdio, thus I was tr=
ying to be consistent with them.<br>
=C2=A0<br></div><div class=3D"im"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<div>
&gt; + =C2=A0 =C2=A0if (!f) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_file_open(errp, errno, filenam=
e);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; + =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0while (size !=3D 0) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D fread(buf, 1, sizeof(buf), f);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (l &gt; size)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D size;<br>
<br></div></blockquote></div><div>How about error handling as below, the sa=
me error handling is used by memsave/pmemsave.<div class=3D"im"><br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l =3D fread(buf, 1, sizeof(buf), f);<b=
r></div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (l ! =3D sizeof(buf))=
 {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_se=
t(errp, QERR_IO_ERROR);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto eix=
t;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br><br>=C2=A0<br></div><=
div class=3D"im"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
</div>This is lousy at error detection. =C2=A0Again, you should be using re=
ad(),<br>
not fread(), and properly erroring out on read failures rather than<br>
silently ignoring them.<br>
<div><br>
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =C2=A0 =C2=A0 =C2=A0 =3D &quot;pmem=
load&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0.args_type =C2=A0=3D &quot;val:l,size:i,f=
ilename:s&quot;,<br>
<br>
</div>Would it make sense to put filename as the FIRST argument, with val a=
nd<br>
size as optional arguments (defaulting to reading in at address 0 and<br>
for the size determined by the length of the input file), rather than<br>
forcing the user to pass in a size up front?<br>
<div><br></div></blockquote></div><div>Same reason as above, I though it co=
uld be easier if pmemload takes the same arguments as memsave/pmemsave.<br>=
</div></div><br></div><div class=3D"gmail_extra">Again, really thanks for y=
our patient.<br>
<br></div>Best Regards</div></div><div class=3D"gmail_extra"><br><br><div c=
lass=3D"gmail_quote">On Tue, Apr 8, 2014 at 12:42 PM, Eric Blake <span dir=
=3D"ltr">&lt;<a href=3D"mailto:eblake@redhat.com" target=3D"_blank">eblake@=
redhat.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 04/08/2014 01:30 PM, Baojun Wang wrote:<b=
r>
<br>
Your subject line is extremely long. =C2=A0In general, we strive for<br>
something less than 60 characters, so that &#39;git shortlog -30&#39; can<b=
r>
display the entire line in an 80-column terminal. =C2=A0Also, the subject<b=
r>
mentions pmemsave, but your commit mentions pmemload - it&#39;s very<br>
misleading to provide a patch where the commit message doesn&#39;t even<br>
mention the name of the command the patch is adding. =C2=A0I would suggest =
a<br>
subject line of:<br>
<br>
qmp: add pmemload command<br>
<div class=3D""><br>
&gt; I found this could be useful to have qemu-softmmu as a cross debugger =
(launch<br>
&gt; with -s -S command line option), then if we can have a command to load=
 guest<br>
&gt; physical memory, we can use cross gdb to do some target debug which gd=
b cannot<br>
&gt; do directly.<br>
&gt;<br>
<br>
</div>Your patch is lacking a Signed-off-by designation, therefore we canno=
t<br>
accept it yet.<br>
<div class=3D""><br>
&gt; Many thanks to Eric Blake for review the patch.<br>
<br>
</div>This comment may be useful to reviewers, but is not part of the commi=
t<br>
itself, so it belongs better...<br>
<br>
&gt;<br>
&gt; ---<br>
<br>
...here, after the --- separator.<br>
<div class=3D""><br>
<br>
&gt;<br>
&gt; +void qmp_pmemload(int64_t addr, int64_t size, const char *filename,<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error =
**errp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0FILE *f;<br>
&gt; + =C2=A0 =C2=A0uint32_t l;<br>
&gt; + =C2=A0 =C2=A0uint8_t buf[1024];<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0f =3D fopen(filename, &quot;rb&quot;);<br>
<br>
</div>Rather than using fopen() and FILE* operations, I&#39;d prefer you us=
e<br>
qemu_open() and lower-level read() operations. =C2=A0In particular, this wi=
ll<br>
automatically make it possible for management applications to pass in<br>
&#39;/dev/fdset/1&#39; to reuse a file descriptor that they passed in to qe=
mu,<br>
rather than forcing qemu to directly open the file.<br>
<div class=3D""><br>
&gt; + =C2=A0 =C2=A0if (!f) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_file_open(errp, errno, filenam=
e);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; + =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0while (size !=3D 0) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D fread(buf, 1, sizeof(buf), f);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (l &gt; size)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D size;<br>
<br>
</div>This is lousy at error detection. =C2=A0Again, you should be using re=
ad(),<br>
not fread(), and properly erroring out on read failures rather than<br>
silently ignoring them.<br>
<div class=3D""><br>
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =C2=A0 =C2=A0 =C2=A0 =3D &quot;pmem=
load&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0.args_type =C2=A0=3D &quot;val:l,size:i,f=
ilename:s&quot;,<br>
<br>
</div>Would it make sense to put filename as the FIRST argument, with val a=
nd<br>
size as optional arguments (defaulting to reading in at address 0 and<br>
for the size determined by the length of the input file), rather than<br>
forcing the user to pass in a size up front?<br>
<div class=3D""><br>
&gt; +++ b/qapi-schema.json<br>
&gt; @@ -1708,6 +1708,26 @@<br>
&gt; =C2=A0 =C2=A0&#39;data&#39;: {&#39;val&#39;: &#39;int&#39;, &#39;size&=
#39;: &#39;int&#39;, &#39;filename&#39;: &#39;str&#39;} }<br>
&gt;<br>
&gt; =C2=A0##<br>
&gt; +# @pmemload:<br>
&gt; +#<br>
&gt; +# Load a portion of guest physical memory from a file.<br>
&gt; +#<br>
&gt; +# @val: the physical address of the guest to start from<br>
&gt; +#<br>
&gt; +# @size: the size of memory region to load<br>
&gt; +#<br>
&gt; +# @filename: the file to load the memory from as binary data<br>
&gt; +#<br>
&gt; +# Returns: Nothing on success<br>
&gt; +#<br>
&gt; +# Since: 2.1<br>
&gt; +#<br>
&gt; +# Notes: Errors were not reliably returned until 2.1<br>
<br>
</div>Delete this line. =C2=A0I guess I didn&#39;t make it clear in my firs=
t review<br>
that this line is bogus copy and paste. =C2=A0You don&#39;t need it. =C2=A0=
pmemsave<br>
needed it, because pmemsave went through some iterations where earlier<br>
versions were buggy. =C2=A0But your pmemload command is brand new, and shou=
ld<br>
not have bugs worth worrying about.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Eric Blake =C2=A0 eblake redhat com =C2=A0 =C2=A0<a href=3D"tel:%2B1-919-30=
1-3266" value=3D"+19193013266">+1-919-301-3266</a><br>
Libvirt virtualization library <a href=3D"http://libvirt.org" target=3D"_bl=
ank">http://libvirt.org</a><br>
<br>
</font></span></blockquote></div><br></div>

--089e015370886f43f004f6905aaa--

