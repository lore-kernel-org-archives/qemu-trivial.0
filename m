Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnWhx-0000tT-0Z
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 16:04:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1bnWht-0000of-Tq
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 16:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1bnWhr-000785-BR
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 16:04:24 -0400
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:34129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1bnWhr-00076T-61
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 16:04:23 -0400
Received: by mail-ua0-x236.google.com with SMTP id q42so57201349uaq.1
	for <qemu-trivial@nongnu.org>; Fri, 23 Sep 2016 13:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=natulte-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Abh2H629M4YGKJySnl41s/De2+dVjp9MGZaKYSmbHg=;
	b=vzK51KQ6RwX2wz7vrM6k3a1U+XL22q9pbch4KfiHCV0wLrtpdT/ZLrO25grAN3jRTh
	OZQHScK5eoc9CMf0dWYeJdAK+QjRuQ4qRNXeZImDD1Ed/BYJtyTO+BU+vUOpukvh04P6
	geL3vlwgKKZR0dRDFBaiNCOxmLW5nqboHVBXw05aZum8vjvz/jxcamBDpCHjfDSfZqbq
	Ar2nmK5WPEqRvOnw2+l9VVauQx53Ye/+uZLz5qol55LEgAuS2UAn3TdZ/xWVbP09817D
	ySW2bxRfbt0DxvSgnR9m4f5ZnACAPK9ooFCfUlINxQulyr2pz4UIkf7H9oHYQ0fwQTeA
	3E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Abh2H629M4YGKJySnl41s/De2+dVjp9MGZaKYSmbHg=;
	b=g/w/z0f3Rc2LMm2ZbzftBK9MizGt7RHi9rQal5hAaNeE1ZJgPoqL4ONS74b6ArGYkM
	NJu0KDoEwp1E+o3ZcZLDsstprDUihJIA3MH4lut/3fypvgc5IBR6kAT/vwBx6KqkX4FG
	bJCVR9D/XGrOxSSimOQi/sH3XIa+Pr3fcDvbxPoI5JhCGArMichBw+kSjvY+pDpILnpF
	/BBFr6hts5/tr/vTZvzQN+otvEfxrMh6dAyFrfp8piI998ZZuJ64j/FKr3ong70MG0Mg
	gAe53G1vEkcxP0NHnPlK2Je33TMb/O9SIFwoVU8nzJYjLVZd/iX2sc/XwTkQzC+dvFGX
	JKuA==
X-Gm-Message-State: AE9vXwPYT3RdIG6Ab6KdD52anBTm1OY6M94zz1EIMT/ih7jxxmHHU+637U73KmqLzAk1Nt4YSm2xhSzwLZgEZg==
X-Received: by 10.176.4.80 with SMTP id 74mr4860001uav.6.1474661061344; Fri,
	23 Sep 2016 13:04:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.83.90 with HTTP; Fri, 23 Sep 2016 13:04:00 -0700 (PDT)
In-Reply-To: <dcfeabcb-bfb5-b184-0842-b3413889eb56@redhat.com>
References: <20160922040019.19165-1-dave@natulte.net>
	<dcfeabcb-bfb5-b184-0842-b3413889eb56@redhat.com>
From: David Anderson <dave@natulte.net>
Date: Fri, 23 Sep 2016 13:04:00 -0700
Message-ID: <CAMx+r7XKTASxhX3N=7n_BxO=9vnNPed2fsSGyQw8wigiGgk65A@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary=001a114a2410b9d453053d324858
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: make the json schema
 files more regular.
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
X-List-Received-Date: Fri, 23 Sep 2016 20:04:27 -0000

--001a114a2410b9d453053d324858
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 22, 2016 at 6:07 AM, Eric Blake <eblake@redhat.com> wrote:

> On 09/21/2016 11:00 PM, David Anderson wrote:
> > This makes it easier to parse the schema file for tool generation:
> > each paragraph is either a non-docstring comment, or a docstring
> > immediately followed by a Python dict describing an API item.
> >
> > Signed-off-by: David Anderson <dave@natulte.net>
> > ---
> >  qapi-schema.json     | 3 +--
> >  qapi/block-core.json | 5 -----
> >  2 files changed, 1 insertion(+), 7 deletions(-)
>
> Related to the work Marc-Andre is already doing, but fine to take now.
>

Do you have a link to that work? It sounds like the schema format may be
changing, which is relevant to my interests since I'm trying to parse it :).

- Dave


>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> >
> > diff --git a/qapi-schema.json b/qapi-schema.json
> > index e507061..edd803f 100644
> > --- a/qapi-schema.json
> > +++ b/qapi-schema.json
> > @@ -752,6 +752,7 @@
> >              'cpu-throttle-increment': 'int',
> >              'tls-creds': 'str',
> >              'tls-hostname': 'str'} }
> > +
> >  ##
> >  # @query-migrate-parameters
> >  #
> > @@ -4115,7 +4116,6 @@
> >  #
> >  # Since 1.6
> >  ##
> > -
> >  { 'struct': 'RxFilterInfo',
> >    'data': {
> >      'name':               'str',
> > @@ -4335,7 +4335,6 @@
> >  #
> >  # Since: 2.1
> >  ##
> > -
> >  { 'struct': 'Memdev',
> >    'data': {
> >      'size':       'size',
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 24223fd..e12fbd3 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -25,7 +25,6 @@
> >  # Since: 1.3
> >  #
> >  ##
> > -
> >  { 'struct': 'SnapshotInfo',
> >    'data': { 'id': 'str', 'name': 'str', 'vm-state-size': 'int',
> >              'date-sec': 'int', 'date-nsec': 'int',
> > @@ -81,7 +80,6 @@
> >  #
> >  # Since: 1.7
> >  ##
> > -
> >  { 'union': 'ImageInfoSpecific',
> >    'data': {
> >        'qcow2': 'ImageInfoSpecificQCow2',
> > @@ -129,7 +127,6 @@
> >  # Since: 1.3
> >  #
> >  ##
> > -
> >  { 'struct': 'ImageInfo',
> >    'data': {'filename': 'str', 'format': 'str', '*dirty-flag': 'bool',
> >             '*actual-size': 'int', 'virtual-size': 'int',
> > @@ -181,7 +178,6 @@
> >  # Since: 1.4
> >  #
> >  ##
> > -
> >  { 'struct': 'ImageCheck',
> >    'data': {'filename': 'str', 'format': 'str', 'check-errors': 'int',
> >             '*image-end-offset': 'int', '*corruptions': 'int', '*leaks':
> 'int',
> > @@ -518,7 +514,6 @@
> >  #
> >  # Since: 2.5
> >  ##
> > -
> >  { 'struct': 'BlockDeviceTimedStats',
> >    'data': { 'interval_length': 'int', 'min_rd_latency_ns': 'int',
> >              'max_rd_latency_ns': 'int', 'avg_rd_latency_ns': 'int',
> >
>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>
>

--001a114a2410b9d453053d324858
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Sep 22, 2016 at 6:07 AM, Eric Blake <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:eblake@redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 09/21/2016 11:=
00 PM, David Anderson wrote:<br>
&gt; This makes it easier to parse the schema file for tool generation:<br>
&gt; each paragraph is either a non-docstring comment, or a docstring<br>
&gt; immediately followed by a Python dict describing an API item.<br>
&gt;<br>
&gt; Signed-off-by: David Anderson &lt;<a href=3D"mailto:dave@natulte.net">=
dave@natulte.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qapi-schema.json=C2=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;=C2=A0 qapi/block-core.json | 5 -----<br>
&gt;=C2=A0 2 files changed, 1 insertion(+), 7 deletions(-)<br>
<br>
</span>Related to the work Marc-Andre is already doing, but fine to take no=
w.<br></blockquote><div><br></div><div>Do you have a link to that work? It =
sounds like the schema format may be changing, which is relevant to my inte=
rests since I&#39;m trying to parse it :).</div><div><br></div><div>- Dave<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@red=
hat.com</a>&gt;<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt; diff --git a/qapi-schema.json b/qapi-schema.json<br>
&gt; index e507061..edd803f 100644<br>
&gt; --- a/qapi-schema.json<br>
&gt; +++ b/qapi-schema.json<br>
&gt; @@ -752,6 +752,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;cpu-throttle-incr=
ement&#39;: &#39;int&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tls-creds&#39;: &=
#39;str&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tls-hostname&#39;=
: &#39;str&#39;} }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @query-migrate-parameters<br>
&gt;=C2=A0 #<br>
&gt; @@ -4115,7 +4116,6 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Since 1.6<br>
&gt;=C2=A0 ##<br>
&gt; -<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;RxFilterInfo&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;name&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; @@ -4335,7 +4335,6 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Since: 2.1<br>
&gt;=C2=A0 ##<br>
&gt; -<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;Memdev&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;size&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;siz=
e&#39;,<br>
&gt; diff --git a/qapi/block-core.json b/qapi/block-core.json<br>
&gt; index 24223fd..e12fbd3 100644<br>
&gt; --- a/qapi/block-core.json<br>
&gt; +++ b/qapi/block-core.json<br>
&gt; @@ -25,7 +25,6 @@<br>
&gt;=C2=A0 # Since: 1.3<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ##<br>
&gt; -<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;SnapshotInfo&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: { &#39;id&#39;: &#39;str&#39;, &#39;name&=
#39;: &#39;str&#39;, &#39;vm-state-size&#39;: &#39;int&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;date-sec&#39;: &#=
39;int&#39;, &#39;date-nsec&#39;: &#39;int&#39;,<br>
&gt; @@ -81,7 +80,6 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Since: 1.7<br>
&gt;=C2=A0 ##<br>
&gt; -<br>
&gt;=C2=A0 { &#39;union&#39;: &#39;ImageInfoSpecific&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qcow2&#39;: &#39;ImageInfoSpecificQCow=
2&#39;,<br>
&gt; @@ -129,7 +127,6 @@<br>
&gt;=C2=A0 # Since: 1.3<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ##<br>
&gt; -<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;ImageInfo&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: {&#39;filename&#39;: &#39;str&#39;, &#39;=
format&#39;: &#39;str&#39;, &#39;*dirty-flag&#39;: &#39;bool&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*actual-size&#39;:=
 &#39;int&#39;, &#39;virtual-size&#39;: &#39;int&#39;,<br>
&gt; @@ -181,7 +178,6 @@<br>
&gt;=C2=A0 # Since: 1.4<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ##<br>
&gt; -<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;ImageCheck&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: {&#39;filename&#39;: &#39;str&#39;, &#39;=
format&#39;: &#39;str&#39;, &#39;check-errors&#39;: &#39;int&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*image-end-offset&=
#39;: &#39;int&#39;, &#39;*corruptions&#39;: &#39;int&#39;, &#39;*leaks&#39=
;: &#39;int&#39;,<br>
&gt; @@ -518,7 +514,6 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Since: 2.5<br>
&gt;=C2=A0 ##<br>
&gt; -<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;BlockDeviceTimedStats&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: { &#39;interval_length&#39;: &#39;int&#39=
;, &#39;min_rd_latency_ns&#39;: &#39;int&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;max_rd_latency_ns=
&#39;: &#39;int&#39;, &#39;avg_rd_latency_ns&#39;: &#39;int&#39;,<br>
&gt;<br>
<br>
--<br>
</div></div>Eric Blake=C2=A0 =C2=A0eblake redhat com=C2=A0 =C2=A0 <a href=
=3D"tel:%2B1-919-301-3266" value=3D"+19193013266">+1-919-301-3266</a><br>
Libvirt virtualization library <a href=3D"http://libvirt.org" rel=3D"norefe=
rrer" target=3D"_blank">http://libvirt.org</a><br>
<br>
</blockquote></div><br></div></div>

--001a114a2410b9d453053d324858--

