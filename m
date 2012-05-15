Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SU8KH-000309-UM
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2012 23:21:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SU8KD-0002lg-6h
	for qemu-trivial@nongnu.org; Mon, 14 May 2012 23:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SU8KB-0004WU-0S
	for qemu-trivial@nongnu.org; Mon, 14 May 2012 23:21:24 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:64995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1SU8K5-0004UN-O9; Mon, 14 May 2012 23:21:18 -0400
Received: by lbok6 with SMTP id k6so4479061lbo.4
	for <multiple recipients>; Mon, 14 May 2012 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1GMgNxzV7ivSD1bxtVautzGDQQDU9Eu8mMjV68MWjbE=;
	b=YWYtDACbGbeQnNP03b5FXH1M9IkyJbHNqvOB6ho4olv9Kq2sGRfEGyEI5o6BAaKQCl
	HvojwpysJzs0f8Kr5p6B59a8oiuXr1k1UXc3mWYAT4eqNUWGLOBM6BjVrrfhshgwpv5i
	XH64mNQuKtTviFDAcnfnLhV7rc2TC+j6PTY/oS123osWSVVt1AGCjSt2K6Dx+fn5Ht3b
	6LAj2QeeG8WltllUoQqP1rVFCOJIY0IGtVwsDEOnjTy6WL6yHW2EVqhx2WMepTXJsm2f
	OdY27aCM40ZrrmWJv4Ff0bF8IRRAObqLjtobseuaMzsCxgL2CHWVCT6i1g+8BXzDAwMc
	jmWA==
MIME-Version: 1.0
Received: by 10.112.49.230 with SMTP id x6mr4261179lbn.86.1337052074019; Mon,
	14 May 2012 20:21:14 -0700 (PDT)
Received: by 10.112.100.102 with HTTP; Mon, 14 May 2012 20:21:13 -0700 (PDT)
In-Reply-To: <20120514204011.GF28865@illuin>
References: <1336034082-5288-1-git-send-email-riegamaths@gmail.com>
	<4FB15EC4.3050206@weilnetz.de> <20120514204011.GF28865@illuin>
Date: Tue, 15 May 2012 11:21:13 +0800
Message-ID: <CAOZVR5bkPnLZrHNXC7UfZTK_aNQM8ev0eK-UYCdAtdWH8XLuQA@mail.gmail.com>
From: dunrong huang <riegamaths@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary=bcaec554deb2eb0d3e04c00ab127
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Fix memory leak
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
X-List-Received-Date: Tue, 15 May 2012 03:21:27 -0000

--bcaec554deb2eb0d3e04c00ab127
Content-Type: text/plain; charset=ISO-8859-1

Thanks for your reply.

As you say, for an input visitor we dont need to initialize the pointer.
"visit_type_str" in set_mac function and set_pci_devfn function is a input
visitor, it points to
"qmp_input_type_str", if qmp_input_type_str failed, it will alloc a Error
struct and return.

So, i think it doesnt matter whether initializing it or not in this
situation.
But the str must be freed to avoid memory leak


2012/5/15 Michael Roth <mdroth@linux.vnet.ibm.com>

> On Mon, May 14, 2012 at 09:36:36PM +0200, Stefan Weil wrote:
> > Hello,
> >
> > Am 03.05.2012 10:34, schrieb dunrong huang:
> > >The str allocated in visit_type_str was not freed
> > >
> > >Signed-off-by: dunrong huang <riegamaths@gmail.com>
> > >---
> > >hw/qdev-properties.c | 8 ++++++--
> > >1 files changed, 6 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
> > >index 98dd06a..8088699 100644
> > >--- a/hw/qdev-properties.c
> > >+++ b/hw/qdev-properties.c
> > >@@ -726,7 +726,7 @@ static void set_mac(Object *obj, Visitor *v,
> > >void *opaque,
> > >MACAddr *mac = qdev_get_prop_ptr(dev, prop);
> > >Error *local_err = NULL;
> > >int i, pos;
> > >- char *str, *p;
> > >+ char *str = NULL, *p;
> >
> > Is this change really needed?
> >
> > >
> > >if (dev->state != DEV_STATE_CREATED) {
> > >error_set(errp, QERR_PERMISSION_DENIED);
> > >@@ -753,10 +753,12 @@ static void set_mac(Object *obj, Visitor *v,
> > >void *opaque,
> > >}
> > >mac->a[i] = strtol(str+pos, &p, 16);
> > >}
> > >+ g_free(str);
> > >return;
> > >
> > >inval:
> > >error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> > >+ g_free(str);
> > >}
> > >
> > >PropertyInfo qdev_prop_macaddr = {
> > >@@ -825,7 +827,7 @@ static void set_pci_devfn(Object *obj, Visitor
> > >*v, void *opaque,
> > >uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
> > >unsigned int slot, fn, n;
> > >Error *local_err = NULL;
> > >- char *str = (char *)"";
> > >+ char *str = NULL;
> >
> > As far as I could see, str does not need an initial value, so
> > neither the old nor the new code is optimal (both versions do
> > work).
> >
> > >
> > >if (dev->state != DEV_STATE_CREATED) {
> > >error_set(errp, QERR_PERMISSION_DENIED);
> > >@@ -847,10 +849,12 @@ static void set_pci_devfn(Object *obj,
> > >Visitor *v, void *opaque,
> > >goto invalid;
> > >}
> > >*ptr = slot << 3 | fn;
> > >+ g_free(str);
> > >return;
> > >
> > >invalid:
> > >error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> > >+ g_free(str);
> > >}
> > >
> > >static int print_pci_devfn(DeviceState *dev, Property *prop, char
> > >*dest, size_t len)
> >
> > Maybe some expert (Michael Roth?) can comment on the correct
> > usage of visit_type_str.
> >
> > Is the initial value for the 2nd argument really needed?
> > The current QEMU code sometimes uses initialization,
> > but not always (see the code above, for example), so it is confusing.
>
> For an output visitor (native-to-<QMP/String/etc>), we assume we're
> getting a pointer to a valid string, and generally treat NULL as an
> indication
> to generate an empty string, so the initial value matters in that case.
> For that situation the changes would be warranted.
>
> But for an input visitor (<QMP/String/etc>-to-native) like we're using in
> the
> setters this patch modifies, the initial value gets clobbered with a
> pointer
> to whatever the visitor allocates, so initializing the pointers isn't
> neccessary.
>
> >
> > Otherwise the patch is ok. It fixes memory leaks,
> > therefore it should be added to QEMU 1.1.
> >
> > Tested-by: Stefan Weil <sw@weilnetz.de>
> > > Regards,
> >
> > Stefan Weil
> >
> >
>



-- 
linuxer and emacser and pythoner living in beijing
blog: http://mathslinux.org
twitter: https://twitter.com/mathslinux
google+: https://plus.google.com/118129852578326338750

--bcaec554deb2eb0d3e04c00ab127
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for your reply.<br><br>As you say,  for an input visitor we dont nee=
d to initialize the pointer.<br>&quot;visit_type_str&quot; in set_mac funct=
ion and set_pci_devfn function is a input visitor, it points to<br>&quot;qm=
p_input_type_str&quot;,  if qmp_input_type_str failed, it will alloc a Erro=
r struct and return.<br>
<br>So, i think it doesnt matter whether initializing it or not in this sit=
uation.<br>But the str must be freed  to avoid memory leak<br><br><br><div =
class=3D"gmail_quote">2012/5/15 Michael Roth <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mdroth@linux.vnet.ibm.com" target=3D"_blank">mdroth@linux.vnet.i=
bm.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On M=
on, May 14, 2012 at 09:36:36PM +0200, Stefan Weil wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; Am 03.05.2012 10:34, schrieb dunrong huang:<br>
&gt; &gt;The str allocated in visit_type_str was not freed<br>
&gt; &gt;<br>
&gt; &gt;Signed-off-by: dunrong huang &lt;<a href=3D"mailto:riegamaths@gmai=
l.com">riegamaths@gmail.com</a>&gt;<br>
&gt; &gt;---<br>
&gt; &gt;hw/qdev-properties.c | 8 ++++++--<br>
&gt; &gt;1 files changed, 6 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt;diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c<br>
&gt; &gt;index 98dd06a..8088699 100644<br>
&gt; &gt;--- a/hw/qdev-properties.c<br>
&gt; &gt;+++ b/hw/qdev-properties.c<br>
&gt; &gt;@@ -726,7 +726,7 @@ static void set_mac(Object *obj, Visitor *v,<b=
r>
&gt; &gt;void *opaque,<br>
&gt; &gt;MACAddr *mac =3D qdev_get_prop_ptr(dev, prop);<br>
&gt; &gt;Error *local_err =3D NULL;<br>
&gt; &gt;int i, pos;<br>
&gt; &gt;- char *str, *p;<br>
&gt; &gt;+ char *str =3D NULL, *p;<br>
&gt;<br>
&gt; Is this change really needed?<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;if (dev-&gt;state !=3D DEV_STATE_CREATED) {<br>
&gt; &gt;error_set(errp, QERR_PERMISSION_DENIED);<br>
&gt; &gt;@@ -753,10 +753,12 @@ static void set_mac(Object *obj, Visitor *v,=
<br>
&gt; &gt;void *opaque,<br>
&gt; &gt;}<br>
&gt; &gt;mac-&gt;a[i] =3D strtol(str+pos, &amp;p, 16);<br>
&gt; &gt;}<br>
&gt; &gt;+ g_free(str);<br>
&gt; &gt;return;<br>
&gt; &gt;<br>
&gt; &gt;inval:<br>
&gt; &gt;error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);<br>
&gt; &gt;+ g_free(str);<br>
&gt; &gt;}<br>
&gt; &gt;<br>
&gt; &gt;PropertyInfo qdev_prop_macaddr =3D {<br>
&gt; &gt;@@ -825,7 +827,7 @@ static void set_pci_devfn(Object *obj, Visitor=
<br>
&gt; &gt;*v, void *opaque,<br>
&gt; &gt;uint32_t *ptr =3D qdev_get_prop_ptr(dev, prop);<br>
&gt; &gt;unsigned int slot, fn, n;<br>
&gt; &gt;Error *local_err =3D NULL;<br>
&gt; &gt;- char *str =3D (char *)&quot;&quot;;<br>
&gt; &gt;+ char *str =3D NULL;<br>
&gt;<br>
&gt; As far as I could see, str does not need an initial value, so<br>
&gt; neither the old nor the new code is optimal (both versions do<br>
&gt; work).<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;if (dev-&gt;state !=3D DEV_STATE_CREATED) {<br>
&gt; &gt;error_set(errp, QERR_PERMISSION_DENIED);<br>
&gt; &gt;@@ -847,10 +849,12 @@ static void set_pci_devfn(Object *obj,<br>
&gt; &gt;Visitor *v, void *opaque,<br>
&gt; &gt;goto invalid;<br>
&gt; &gt;}<br>
&gt; &gt;*ptr =3D slot &lt;&lt; 3 | fn;<br>
&gt; &gt;+ g_free(str);<br>
&gt; &gt;return;<br>
&gt; &gt;<br>
&gt; &gt;invalid:<br>
&gt; &gt;error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);<br>
&gt; &gt;+ g_free(str);<br>
&gt; &gt;}<br>
&gt; &gt;<br>
&gt; &gt;static int print_pci_devfn(DeviceState *dev, Property *prop, char<=
br>
&gt; &gt;*dest, size_t len)<br>
&gt;<br>
&gt; Maybe some expert (Michael Roth?) can comment on the correct<br>
&gt; usage of visit_type_str.<br>
&gt;<br>
&gt; Is the initial value for the 2nd argument really needed?<br>
&gt; The current QEMU code sometimes uses initialization,<br>
&gt; but not always (see the code above, for example), so it is confusing.<=
br>
<br>
</div></div>For an output visitor (native-to-&lt;QMP/String/etc&gt;), we as=
sume we&#39;re<br>
getting a pointer to a valid string, and generally treat NULL as an indicat=
ion<br>
to generate an empty string, so the initial value matters in that case.<br>
For that situation the changes would be warranted.<br>
<br>
But for an input visitor (&lt;QMP/String/etc&gt;-to-native) like we&#39;re =
using in the<br>
setters this patch modifies, the initial value gets clobbered with a pointe=
r<br>
to whatever the visitor allocates, so initializing the pointers isn&#39;t<b=
r>
neccessary.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Otherwise the patch is ok. It fixes memory leaks,<br>
&gt; therefore it should be added to QEMU 1.1.<br>
&gt;<br>
&gt; Tested-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilne=
tz.de</a>&gt;<br>
&gt; &gt; Regards,<br>
&gt;<br>
&gt; Stefan Weil<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>linuxer and=
 emacser and pythoner living in beijing<br>blog: <a href=3D"http://mathslin=
ux.org" target=3D"_blank">http://mathslinux.org</a><br>twitter: <a href=3D"=
https://twitter.com/mathslinux" target=3D"_blank">https://twitter.com/maths=
linux</a><br>
google+: <a href=3D"https://plus.google.com/118129852578326338750" target=
=3D"_blank">https://plus.google.com/118129852578326338750</a><br><br>

--bcaec554deb2eb0d3e04c00ab127--

