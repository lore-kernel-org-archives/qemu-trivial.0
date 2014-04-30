Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WfYnt-0003JT-14
	for mharc-qemu-trivial@gnu.org; Wed, 30 Apr 2014 14:00:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WfYnq-0003He-Ne
	for qemu-trivial@nongnu.org; Wed, 30 Apr 2014 14:00:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WfYnp-0003bn-IT
	for qemu-trivial@nongnu.org; Wed, 30 Apr 2014 14:00:18 -0400
Received: from mail-oa0-x22e.google.com ([2607:f8b0:4003:c02::22e]:43785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>)
	id 1WfYnn-0003ZX-5G; Wed, 30 Apr 2014 14:00:15 -0400
Received: by mail-oa0-f46.google.com with SMTP id i4so1683192oah.33
	for <multiple recipients>; Wed, 30 Apr 2014 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/AsUvoOUhjdKx5aW5cW2elHrYsnHK9yPK3apR03zc5g=;
	b=Qdi3/lfG8mcJ5Q2KtAERjajK1xXP0d6CnyaP+r4mDwFsYYBtq1hSqK1vummQw1Ks9t
	BccEd+5ik1P4kv4Y5wkRFlQOn8+h6/6VD5JiKCFILi4gg/qo1drUEUHC13a8Z79vm1az
	iFJXuuOhUx7vIHvzkpyBPeaHqTf/PSzjC6mX3xw2cfjcuaWK8+g8cbuD9+5kqN143noj
	9ndd4mr/BU4c5nC6TVjAJQIeyHcqrC2aX8FjUcaaaCqyuClun25vMvuzm4dD0FRt/Lll
	x4+xMO++hTqygiDIm/fhXNBodpBGjxWhKWou3sR/GQjDpjTwlFrOQOcAn8UBu39944pW
	5SpA==
MIME-Version: 1.0
X-Received: by 10.60.59.196 with SMTP id b4mr6873250oer.48.1398880814112; Wed,
	30 Apr 2014 11:00:14 -0700 (PDT)
Received: by 10.60.43.104 with HTTP; Wed, 30 Apr 2014 11:00:13 -0700 (PDT)
In-Reply-To: <535CCB59.8020606@msgid.tls.msk.ru>
References: <53457D1A.7000602@redhat.com>
	<1397065744-9561-1-git-send-email-wangbj@gmail.com>
	<535CCB59.8020606@msgid.tls.msk.ru>
Date: Wed, 30 Apr 2014 11:00:13 -0700
Message-ID: <CAC+a-TYk83pezg-5HChW-SOQunhfsHk7isKZJF3XBGZ9GYy=Eg@mail.gmail.com>
From: Baojun Wang <wangbj@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: multipart/alternative; boundary=047d7b41bf80025ac504f846524f
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::22e
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH V5 1/1] qmp: add pmemload command
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
X-List-Received-Date: Wed, 30 Apr 2014 18:00:19 -0000

--047d7b41bf80025ac504f846524f
Content-Type: text/plain; charset=UTF-8

Sorry for reply late Michael (my gmail priority inbox didn't sort this
email into my inbox), I thought the change is trivial compare to the huge
patch set in the mailing list :)
I'm OK with the change not one in the -trivial tree.

Best Regards
Baojun


On Sun, Apr 27, 2014 at 2:18 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:

> 09.04.2014 21:49, Baojun Wang wrote:
> > I found this could be useful to have qemu-softmmu as a cross debugger
> (launch
> > with -s -S command line option), then if we can have a command to load
> guest
> > physical memory, we can use cross gdb to do some target debug which gdb
> cannot
> > do directly.
> >
> > Many thanks to Eric Blake for review the patch and suggestions.
>
> Okay, that looks sane, but can you explain please, why did you address
> qemu-trivial@?  The change definitely is not "trivial", as it introduces
> a new qmp command which becomes a part of public interface.  Even if
> the implementation may look trivial, the interface change should not be
> done using -trivial tree.
>
> Thanks,
>
> /mjt
>

--047d7b41bf80025ac504f846524f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:times ne=
w roman,serif">Sorry for reply late Michael (my gmail priority inbox didn&#=
39;t sort this email into my inbox), I thought the change is trivial compar=
e to the huge patch set in the mailing list :)<br>
</div><div class=3D"gmail_default" style=3D"font-family:times new roman,ser=
if">I&#39;m OK with the change not one in the -trivial tree.<br><br></div><=
div class=3D"gmail_default" style=3D"font-family:times new roman,serif">Bes=
t Regards<br>
Baojun<br></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmai=
l_quote">On Sun, Apr 27, 2014 at 2:18 AM, Michael Tokarev <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:mjt@tls.msk.ru" target=3D"_blank">mjt@tls.msk.ru</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">09.04.2014 21:49, Baojun Wan=
g wrote:<br>
&gt; I found this could be useful to have qemu-softmmu as a cross debugger =
(launch<br>
&gt; with -s -S command line option), then if we can have a command to load=
 guest<br>
&gt; physical memory, we can use cross gdb to do some target debug which gd=
b cannot<br>
&gt; do directly.<br>
&gt;<br>
&gt; Many thanks to Eric Blake for review the patch and suggestions.<br>
<br>
</div>Okay, that looks sane, but can you explain please, why did you addres=
s<br>
qemu-trivial@? =C2=A0The change definitely is not &quot;trivial&quot;, as i=
t introduces<br>
a new qmp command which becomes a part of public interface. =C2=A0Even if<b=
r>
the implementation may look trivial, the interface change should not be<br>
done using -trivial tree.<br>
<br>
Thanks,<br>
<br>
/mjt<br>
</blockquote></div><br></div>

--047d7b41bf80025ac504f846524f--

