Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uy8Pv-0004si-7V
	for mharc-qemu-trivial@gnu.org; Sat, 13 Jul 2013 18:35:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Uy8Pq-0004m0-Ff
	for qemu-trivial@nongnu.org; Sat, 13 Jul 2013 18:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Uy8Pn-000168-UX
	for qemu-trivial@nongnu.org; Sat, 13 Jul 2013 18:35:46 -0400
Received: from mail-qc0-x22f.google.com ([2607:f8b0:400d:c01::22f]:59598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1Uy8Ph-00015A-Hl; Sat, 13 Jul 2013 18:35:37 -0400
Received: by mail-qc0-f175.google.com with SMTP id k14so5573982qcv.6
	for <multiple recipients>; Sat, 13 Jul 2013 15:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OJzMizTS9IDwiC0lrhS5eHuvx6Qkq39UNzObU1HZrqM=;
	b=yObpghBUympxYHoHRcao/iCj90PiH+chPxWMwIlMu/Z9y7+LqUeu3JqKkuMtGYS35w
	cxwntd5NvbdqdbNgP9bghvABvL5l6+khNm8mDnowbjC57PRnxbJScWMkx7p8BM39EtZH
	JNUNCd5nadiL8YmPi0LMAncrsqo1fQmUW4jKnm5hZT72F7+y1NsZ73MSWZZJXkeWZgjA
	9k7nbQlBXJY+KFeQQBJl64lOU25iC08L9ZOySMLCqAIVEQnWrdd8lwgwTh5YTSc4Tq7z
	56SZZgUgm70l0REXiB2c/5qJGBTWyATTUA+dcglhgcb+z0voOCtbec2pDM7TMp/uevLb
	JR1Q==
MIME-Version: 1.0
X-Received: by 10.49.132.69 with SMTP id os5mr42424840qeb.48.1373754936822;
	Sat, 13 Jul 2013 15:35:36 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.209.6 with HTTP; Sat, 13 Jul 2013 15:35:36 -0700 (PDT)
In-Reply-To: <51E11A1B.2020503@msgid.tls.msk.ru>
References: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
	<51E11A1B.2020503@msgid.tls.msk.ru>
Date: Sat, 13 Jul 2013 18:35:36 -0400
X-Google-Sender-Auth: UDDM6Wm1lmnN2OCap0bfxv8CZAo
Message-ID: <CAPyFy2BW9+hLC=7+oxnyiA17Lm484VgaQRz8S-RaV_vv92LoHg@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: multipart/alternative; boundary=047d7bdc7dde04932c04e16c3f11
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22f
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: reorder include to
 fix FreeBSD build failure
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
X-List-Received-Date: Sat, 13 Jul 2013 22:35:50 -0000

--047d7bdc7dde04932c04e16c3f11
Content-Type: text/plain; charset=ISO-8859-1

On 13 July 2013 05:12, Michael Tokarev <mjt@tls.msk.ru> wrote:

> Remaining:
>
> struct mbuf {
>         union M_dat {
>                 char    m_dat_[1]; /* ANSI don't like 0 sized arrays */
>                 char    *m_ext_;
>         } M_dat;
> };
>
> #define m_dat           M_dat.m_dat_
> #define m_ext           M_dat.m_ext_
>
> This can be done by using an unnamed union, ie, by omitting
>

Yeah, struct mbuf and those #defines date back to the beginning of BSD
networking.

I think we're probably unconcerned with a slirp upstream at this point, so
such a change seems reasonable.  I'm not sure that anonymous union support
is universal across all compilers used to build QEMU though - do you know?

--047d7bdc7dde04932c04e16c3f11
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 July 2013 05:12, Michael Tokarev <span dir=3D"ltr">&lt;<a href=3D"mailto:=
mjt@tls.msk.ru" target=3D"_blank">mjt@tls.msk.ru</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">


Remaining:<br>
<br>
struct mbuf {<br>
=A0 =A0 =A0 =A0 union M_dat {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char =A0 =A0m_dat_[1]; /* ANSI don&#39;t li=
ke 0 sized arrays */<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char =A0 =A0*m_ext_;<br>
=A0 =A0 =A0 =A0 } M_dat;<br>
};<br>
<br>
#define m_dat =A0 =A0 =A0 =A0 =A0 M_dat.m_dat_<br>
#define m_ext =A0 =A0 =A0 =A0 =A0 M_dat.m_ext_<br>
<br>
This can be done by using an unnamed union, ie, by omitting<br></blockquote=
><div><br>Yeah, struct mbuf and those #defines date back to the beginning o=
f BSD networking.<br><br>I think we&#39;re probably unconcerned with a slir=
p upstream at this point, so such a change seems reasonable.=A0 I&#39;m not=
 sure that anonymous union support is universal across all compilers used t=
o build QEMU though - do you know?<br>
<br></div><br></div></div></div>

--047d7bdc7dde04932c04e16c3f11--

