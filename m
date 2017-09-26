Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwhO6-0003b5-2x
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 00:22:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwhO2-0003VL-3D
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:22:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwhO0-0002aG-Tp
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:22:22 -0400
Received: from tk2-216-17739.vs.sakura.ne.jp ([160.16.80.243]:60366
	helo=maro.localdomain)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daniel@loffgren.org>)
	id 1dwhNv-0002Wx-Ma; Tue, 26 Sep 2017 00:22:16 -0400
Received: from [10.0.0.206] (c-24-23-203-58.hsd1.ca.comcast.net [24.23.203.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by maro.localdomain (Postfix) with ESMTPSA id 6AEF319D436;
	Tue, 26 Sep 2017 13:19:57 +0900 (JST)
From: Daniel Loffgren <daniel@loffgren.org>
Message-Id: <415B68ED-AFB4-4673-8B66-90F74C4B64E1@loffgren.org>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D1D13756-4302-4451-9239-848A8F864F4D"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Mon, 25 Sep 2017 21:22:08 -0700
In-Reply-To: <759768e1-9acb-c14b-7136-743cba166ef0@redhat.com>
Cc: qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
To: Eric Blake <eblake@redhat.com>
References: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>
	<759768e1-9acb-c14b-7136-743cba166ef0@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 160.16.80.243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] thunk.h uses
 TARGET_ABI_BITS without including abitypes.h
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
X-List-Received-Date: Tue, 26 Sep 2017 04:22:23 -0000


--Apple-Mail=_D1D13756-4302-4451-9239-848A8F864F4D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 25, 2017, at 9:10 AM, Eric Blake <eblake@redhat.com> wrote:
>=20
> On 09/24/2017 08:02 PM, Daniel Loffgren wrote:
>>=20
>> Signed-off-by: Daniel Loffgren <daniel@loffgren.org =
<mailto:daniel@loffgren.org>>
>> ---
>> include/exec/user/thunk.h | 1 +
>> 1 file changed, 1 insertion(+)
>=20
> meta-comment: your patch is titled 2/2, but was sent as its own
> top-level thread (it is missing In-Reply-To: and References: headers).
> When sending 2 patches as a series, it is important to include a 0/2
> cover letter, and to properly thread things so that both 1/2 and 2/2 =
are
> in-reply-to the 0/2 cover letter.  'git send-email' is probably the
> easiest way to get this to work.  More patch submission hints at:
>=20
> https://wiki.qemu.org/Contribute/SubmitAPatch =
<https://wiki.qemu.org/Contribute/SubmitAPatch>

Oops, sorry about that! I used 'git format-patch' to get this email from =
a set of two commits, and sent each as-is. This commit can totally stand =
alone.

>>=20
>> diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
>> index f19ef4b230..12b5449d8c 100644
>> --- a/include/exec/user/thunk.h
>> +++ b/include/exec/user/thunk.h
>> @@ -19,6 +19,7 @@
>> #ifndef THUNK_H
>> #define THUNK_H
>>=20
>> +#include "abitypes.h"
>> #include "cpu.h"
>>=20
>> /* types enums definitions */
>>=20
>=20
> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org <http://qemu.org/> | libvirt.org =
<http://libvirt.org/>

--Apple-Mail=_D1D13756-4302-4451-9239-848A8F864F4D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Sep 25, 2017, at 9:10 AM, Eric Blake &lt;<a =
href=3D"mailto:eblake@redhat.com" class=3D"">eblake@redhat.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">On 09/24/2017 08:02 PM, Daniel =
Loffgren wrote:</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D""><br class=3D"">Signed-off-by: Daniel Loffgren &lt;<a =
href=3D"mailto:daniel@loffgren.org" =
class=3D"">daniel@loffgren.org</a>&gt;<br class=3D"">---<br =
class=3D"">include/exec/user/thunk.h | 1 +<br class=3D"">1 file changed, =
1 insertion(+)<br class=3D""></blockquote><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">meta-comment: your patch is =
titled 2/2, but was sent as its own</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">top-level thread (it is missing =
In-Reply-To: and References: headers).</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">When sending 2 patches as a =
series, it is important to include a 0/2</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">cover letter, and to properly =
thread things so that both 1/2 and 2/2 are</span><br style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">in-reply-to the 0/2 cover =
letter. &nbsp;'git send-email' is probably the</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">easiest way to get this to work. &nbsp;More =
patch submission hints at:</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://wiki.qemu.org/Contribute/SubmitAPatch</a><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Oops, sorry =
about that! I used 'git format-patch' to get this email from a set of =
two commits, and sent each as-is. This commit can totally stand =
alone.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D""><br class=3D"">diff --git =
a/include/exec/user/thunk.h b/include/exec/user/thunk.h<br =
class=3D"">index f19ef4b230..12b5449d8c 100644<br class=3D"">--- =
a/include/exec/user/thunk.h<br class=3D"">+++ =
b/include/exec/user/thunk.h<br class=3D"">@@ -19,6 +19,7 @@<br =
class=3D"">#ifndef THUNK_H<br class=3D"">#define THUNK_H<br class=3D""><br=
 class=3D"">+#include "abitypes.h"<br class=3D"">#include "cpu.h"<br =
class=3D""><br class=3D"">/* types enums definitions */<br class=3D""><br =
class=3D""></blockquote><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Eric Blake, Principal Software =
Engineer</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">Red Hat, Inc. =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+1-919-301-326=
6</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">Virtualization: &nbsp;</span><a =
href=3D"http://qemu.org/" style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">qemu.org</a><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>|<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://libvirt.org/" style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">libvirt.org</a></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_D1D13756-4302-4451-9239-848A8F864F4D--

