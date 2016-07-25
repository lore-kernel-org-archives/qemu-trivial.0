Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bRYXB-000799-Ds
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2016 01:34:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1bRYX8-00078m-V6
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2016 01:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1bRYX4-0001qN-Om
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2016 01:34:30 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1bRYX4-0001q7-Cw
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2016 01:34:26 -0400
Received: by mail-wm0-x242.google.com with SMTP id i5so15115976wmg.2
	for <qemu-trivial@nongnu.org>; Sun, 24 Jul 2016 22:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=daynix-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
	:to; bh=qU/d4SBdJOd4bSxgMMZAspn7GoIo1FyZnJnWxOQ+3LA=;
	b=Wd9AysIcu6r9HGPGjwmvcNoR9JetswPH480Qrg+mcT9D7YWVdj1nUVWrGGkCBtPYdh
	3pWjePutnGqupP7Vwb4cTfA9srpX4s2AfJWClFNoNTiqM9IS3Y/JxS9X1J1A5MJK+oD9
	2yl/jMAZvcOCzg+Wej+KIgmEnfkjQxYxSlTsnVnxYIicRdxr9JZyS2CzgkVQPy6wdGGy
	Bjmc9PYvaGZs1r6e+9nM2oTFYwgv49VEM07LtijTpI6w3LKkW6a/K3CpPIGbl9NipmuB
	FiOM2gr4VyhBds/rmALzJioRhvRTGgByS40OGX1HmFk3CAvFT1VX7/pCldqL5g2qwP8c
	Iuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qU/d4SBdJOd4bSxgMMZAspn7GoIo1FyZnJnWxOQ+3LA=;
	b=avOINHkxtblpp5Ghvl+vyDwTtcKkJbWntg3yZGo7uGAvh22Y/O4Ea3T6XH7B0Zz5D3
	ny+7s0Ur1ykAN1yQjkBlbPoK7W5Bym2b3f8UGF9y+am8B+ZbyfACN187rsoXnxu2JXKV
	OoRXe4YoADVRhfxpne3I1AlbHuAJXMGPySRStDqklDV8GcieAZBfENJfM2KwtdZTfrNr
	0PHJBs3cx3X5G6skIbFsAzOnmkKwVytFS9v4vxulpsUSpOLeuoHWpnXQND7HKgp1rQiz
	XpKMdObKvbnEYi8YkFMKBWXdjD1cUtchkmlNIb4pkJnzWOq0++9AwVohpqHLgd3b/At+
	pr8A==
X-Gm-Message-State: ALyK8tLume+VqO1IDyIv3TpM4TTbfhYwrMFqGs8X1N/dTk3NnoKAKgQTQBaB/Wm+epDQdQ==
X-Received: by 10.28.128.207 with SMTP id b198mr39693811wmd.56.1469424865037; 
	Sun, 24 Jul 2016 22:34:25 -0700 (PDT)
Received: from [10.0.1.86] ([5.102.236.99]) by smtp.gmail.com with ESMTPSA id
	z18sm25404816wmz.6.2016.07.24.22.34.23
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jul 2016 22:34:24 -0700 (PDT)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8DA94B94-8DE4-4641-BFE4-FBD613FE48BD"
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Dmitry Fleytman <dmitry@daynix.com>
In-Reply-To: <1469418480-18574-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Date: Mon, 25 Jul 2016 08:34:24 +0300
Cc: Jason Wang <jasowang@redhat.com>, qemu devel <qemu-devel@nongnu.org>,
	qemu trival <qemu-trivial@nongnu.org>
Message-Id: <6FFD4FFD-A622-45DF-A8EC-74DD80901717@daynix.com>
References: <1469418480-18574-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [PATCH] hw/net/e1000: Fix compiler warning
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
X-List-Received-Date: Mon, 25 Jul 2016 05:34:32 -0000


--Apple-Mail=_8DA94B94-8DE4-4641-BFE4-FBD613FE48BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

s/e1000/e1000e/ in commit message subject, except this looks ok.

Thanks for the patch,
Dmitry

Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>

> On 25 Jul 2016, at 06:48 AM, Changlong Xie <xiecl.fnst@cn.fujitsu.com> =
wrote:
>=20
> slave:~/.xie/qemu-colo # gcc --version
> gcc (SUSE Linux) 4.3.4 [gcc-4_3-branch revision 152973]
>=20
> slave:~/.xie/qemu-colo # make -j8
> CC    hw/net/e1000e_core.o
> hw/net/e1000e_core.c:56: warning: =E2=80=98e1000e_set_interrupt_cause=E2=
=80=99 declared inline after being called
> hw/net/e1000e_core.c:56: warning: previous declaration of =
=E2=80=98e1000e_set_interrupt_cause=E2=80=99 was here
> LINK  x86_64-softmmu/qemu-system-x86_64
>=20
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
> hw/net/e1000e_core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index badb1fe..e0bd31c 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -52,7 +52,7 @@
>                                      second according to spec 10.2.4.2 =
*/
> #define E1000E_MAX_TX_FRAGS (64)
>=20
> -static void
> +static inline void
> e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
>=20
> static inline void
> --=20
> 1.9.3
>=20
>=20
>=20


--Apple-Mail=_8DA94B94-8DE4-4641-BFE4-FBD613FE48BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">Hi,</div><div class=3D""><br =
class=3D""></div>s/e1000/e1000e/ in commit message subject, except this =
looks ok.<div class=3D""><br class=3D""></div><div class=3D"">Thanks for =
the patch,</div><div class=3D"">Dmitry</div><div class=3D""><br =
class=3D""><div class=3D""><div class=3D"">
<div style=3D"orphans: auto; text-align: start; text-indent: 0px; =
widows: auto; word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><div style=3D"orphans: =
auto; text-align: start; text-indent: 0px; widows: auto; word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;" class=3D""><div style=3D"orphans: auto; text-align: =
start; text-indent: 0px; widows: auto; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"orphans: auto; text-align: start; text-indent: =
0px; widows: auto; word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><font color=3D"#545454"=
 face=3D"arial, sans-serif" size=3D"2" class=3D""><span =
style=3D"background-color: rgb(255, 255, 255);" class=3D"">Reviewed-by: =
Dmitry Fleytman &lt;<a href=3D"mailto:dmitry@daynix.com" =
class=3D"">dmitry@daynix.com</a>&gt;</span></font></div></div></div></div>=

</div>
<br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 25 Jul 2016, at 06:48 AM, Changlong Xie &lt;<a =
href=3D"mailto:xiecl.fnst@cn.fujitsu.com" =
class=3D"">xiecl.fnst@cn.fujitsu.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">slave:~/.xie/qemu-colo # gcc --version<br class=3D"">gcc =
(SUSE Linux) 4.3.4 [gcc-4_3-branch revision 152973]<br class=3D""><br =
class=3D"">slave:~/.xie/qemu-colo # make -j8<br class=3D"">CC =
&nbsp;&nbsp;&nbsp;hw/net/e1000e_core.o<br =
class=3D"">hw/net/e1000e_core.c:56: warning: =
=E2=80=98e1000e_set_interrupt_cause=E2=80=99 declared inline after being =
called<br class=3D"">hw/net/e1000e_core.c:56: warning: previous =
declaration of =E2=80=98e1000e_set_interrupt_cause=E2=80=99 was here<br =
class=3D"">LINK &nbsp;x86_64-softmmu/qemu-system-x86_64<br class=3D""><br =
class=3D"">Signed-off-by: Changlong Xie &lt;<a =
href=3D"mailto:xiecl.fnst@cn.fujitsu.com" =
class=3D"">xiecl.fnst@cn.fujitsu.com</a>&gt;<br class=3D"">---<br =
class=3D""> hw/net/e1000e_core.c | 2 +-<br class=3D""> 1 file changed, 1 =
insertion(+), 1 deletion(-)<br class=3D""><br class=3D"">diff --git =
a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c<br class=3D"">index =
badb1fe..e0bd31c 100644<br class=3D"">--- a/hw/net/e1000e_core.c<br =
class=3D"">+++ b/hw/net/e1000e_core.c<br class=3D"">@@ -52,7 +52,7 @@<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
second according to spec 10.2.4.2 */<br class=3D""> #define =
E1000E_MAX_TX_FRAGS (64)<br class=3D""><br class=3D"">-static void<br =
class=3D"">+static inline void<br class=3D""> =
e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);<br =
class=3D""><br class=3D""> static inline void<br class=3D"">-- <br =
class=3D"">1.9.3<br class=3D""><br class=3D""><br class=3D""><br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_8DA94B94-8DE4-4641-BFE4-FBD613FE48BD--

