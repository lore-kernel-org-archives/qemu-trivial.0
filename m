Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daIyL-000667-SM
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 05:51:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1daIyI-00064C-TX
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 05:51:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1daIyE-0002gz-Kd
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 05:51:14 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:37947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dmitry@daynix.com>) id 1daIyE-0002gJ-5x
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 05:51:10 -0400
Received: by mail-wm0-x229.google.com with SMTP id m85so62646837wma.1
	for <qemu-trivial@nongnu.org>; Wed, 26 Jul 2017 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=daynix-com.20150623.gappssmtp.com; s=20150623;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=Q5aNGMhBkZX2v5se8E5zkdColbvvYvibdgU40QFXiwI=;
	b=T2BTQaeqfQUy+6murKmHWD8SZx8aEASLPrCCyVomlnU7wjTLjMNDsHeltVLiV+vKuF
	s3k7Ctz1XWQ01FrDMgWiN42GQzFLoCq/0se+4ZNqeoGXhpDIsX7cAh4WIf5cFPisbnwZ
	WYnYaTFjt0G+90tvsqvhcA96IQMIlalS7DuqkymjitKhKLO55hSZZOdQtYJWaidcwDPO
	w+Lu63QtJ3PNCgdHaHV9+fTfbiMEFZvfJyWDVzMwT0HnFGyEPAZSFqL+DnTJeOKGCIsY
	DcWpm4Ifx2zGfH6dzxlWUpUzjRYXvf8718iNsvUTxdQyLD5o/bybN86UJyjkPevTSuf1
	EKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=Q5aNGMhBkZX2v5se8E5zkdColbvvYvibdgU40QFXiwI=;
	b=mGL/PTiCv6C08GBsjJHErTfhPy5y0tdWYMW7OL6QCihkZTjFZGgAOw1zCcOMh6gIW7
	02z0fQR9dc6RxU0hV9+KkhhtupuqZ0a8Tmxb7Q4F41af28s5vJGdvVKBfqd7laxHHfxm
	IWrKleAisBI1lZ0BYKx2aPQDM7VDU1M5z3dQAtpTQqbAw2ualwEmfjOiBD9qjT/fg6l3
	EKjw9tbJV0gDGRgztbn99DnFsyEL8JXIbFpA2Aw2v42KSkNd9Lq07P49uEGi4hjklhVu
	5of4ICnVPlUaU0h5zBH9c00fRpkt6OZw/H1OnGzEAzFjJM02Y7oL3CYZlus/V2ardn86
	Cn8Q==
X-Gm-Message-State: AIVw1134sc02RPUg4MGlIPKk0UWfS6dnfZTtfdmtjhlRf/ANjD39cqDH
	iSEP2lF4bRLppXUA
X-Received: by 10.28.134.11 with SMTP id i11mr280688wmd.77.1501062669133;
	Wed, 26 Jul 2017 02:51:09 -0700 (PDT)
Received: from dmitrys-mbp.daynix ([141.226.163.173])
	by smtp.gmail.com with ESMTPSA id
	k23sm17778580wre.1.2017.07.26.02.51.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 02:51:07 -0700 (PDT)
From: Dmitry Fleytman <dmitry@daynix.com>
Message-Id: <5CB0C39F-09B4-465B-BAB5-05A0DF07A4FC@daynix.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_11C849DE-DEA9-43F9-8020-DC21D284823C"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Wed, 26 Jul 2017 12:51:06 +0300
In-Reply-To: <20170724182751.18261-11-f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-11-f4bug@amsat.org>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-trivial] [PATCH for 2.10 10/35] net/eth: fix incorrect
 check of iov_to_buf() return value
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
X-List-Received-Date: Wed, 26 Jul 2017 09:51:16 -0000


--Apple-Mail=_11C849DE-DEA9-43F9-8020-DC21D284823C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 24 Jul 2017, at 21:27 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> So we have sizeof(struct in6_address) !=3D sizeof(uintptr_t)
> and Clang > Coverity on this, see 4555ca6816c :)
>=20
> net/eth.c:426:30: warning: The code calls sizeof() on a pointer type. =
This can produce an unexpected result
>        return bytes_read =3D=3D sizeof(dst_addr);
>                             ^     ~~~~~~~~~~
> net/eth.c:475:34: warning: The code calls sizeof() on a pointer type. =
This can produce an unexpected result
>            return bytes_read =3D=3D sizeof(src_addr);
>                                 ^     ~~~~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> net/eth.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/net/eth.c b/net/eth.c
> index 5b9ba26a56..ae5d881aae 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -423,7 +423,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, =
int pkt_frags,
>                                 rthdr_offset + sizeof(*ext_hdr),
>                                 dst_addr, sizeof(*dst_addr));
>=20
> -        return bytes_read =3D=3D sizeof(dst_addr);
> +        return bytes_read =3D=3D sizeof(*dst_addr);
>     }
>=20
>     return false;
> @@ -472,7 +472,7 @@ _eth_get_rss_ex_src_addr(const struct iovec *pkt, =
int pkt_frags,
>                                     opt_offset + sizeof(opthdr),
>                                     src_addr, sizeof(*src_addr));
>=20
> -            return bytes_read =3D=3D sizeof(src_addr);
> +            return bytes_read =3D=3D sizeof(*src_addr);
>         }
>=20

Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>

>         opt_offset +=3D optlen;
> --=20
> 2.13.3
>=20


--Apple-Mail=_11C849DE-DEA9-43F9-8020-DC21D284823C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D""><div style=3D"orphans: auto; text-align: =
start; text-indent: 0px; widows: auto; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"orphans: auto; text-align: start; text-indent: =
0px; widows: auto; word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><div style=3D"orphans: =
auto; text-align: start; text-indent: 0px; widows: auto; word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;" class=3D""><div style=3D"orphans: auto; text-align: =
start; text-indent: 0px; widows: auto; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""></div></div></div></div></div><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 24 Jul 2017, at 21:27 PM, =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" =
class=3D"">f4bug@amsat.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">So =
we have sizeof(struct in6_address) !=3D sizeof(uintptr_t)<br =
class=3D"">and Clang &gt; Coverity on this, see 4555ca6816c :)<br =
class=3D""><br class=3D"">net/eth.c:426:30: warning: The code calls =
sizeof() on a pointer type. This can produce an unexpected result<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return bytes_read =
=3D=3D sizeof(dst_addr);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;^ &nbsp;&nbsp;&nbsp;&nbsp;~~~~~~~~~~<br =
class=3D"">net/eth.c:475:34: warning: The code calls sizeof() on a =
pointer type. This can produce an unexpected result<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
bytes_read =3D=3D sizeof(src_addr);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^ =
&nbsp;&nbsp;&nbsp;&nbsp;~~~~~~~~~~<br class=3D""><br =
class=3D"">Reported-by: Clang Static Analyzer<br class=3D"">Signed-off-by:=
 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" =
class=3D"">f4bug@amsat.org</a>&gt;<br class=3D"">---<br class=3D""> =
net/eth.c | 4 ++--<br class=3D""> 1 file changed, 2 insertions(+), 2 =
deletions(-)<br class=3D""><br class=3D"">diff --git a/net/eth.c =
b/net/eth.c<br class=3D"">index 5b9ba26a56..ae5d881aae 100644<br =
class=3D"">--- a/net/eth.c<br class=3D"">+++ b/net/eth.c<br class=3D"">@@ =
-423,7 +423,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int =
pkt_frags,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rthdr_offset + =
sizeof(*ext_hdr),<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dst_addr, =
sizeof(*dst_addr));<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return bytes_read =3D=3D =
sizeof(dst_addr);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return bytes_read =3D=3D =
sizeof(*dst_addr);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;return false;<br =
class=3D"">@@ -472,7 +472,7 @@ _eth_get_rss_ex_src_addr(const struct =
iovec *pkt, int pkt_frags,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opt_of=
fset + sizeof(opthdr),<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;src_ad=
dr, sizeof(*src_addr));<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
bytes_read =3D=3D sizeof(src_addr);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
bytes_read =3D=3D sizeof(*src_addr);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div><div =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; -webkit-line-break: after-white-space;" class=3D""><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><font color=3D"#545454"=
 face=3D"arial, sans-serif" size=3D"2" class=3D""><span =
style=3D"background-color: rgb(255, 255, 255);" class=3D"">Reviewed-by: =
Dmitry Fleytman &lt;<a href=3D"mailto:dmitry@daynix.com" =
class=3D"">dmitry@daynix.com</a>&gt;</span></font></div><div =
class=3D""><br class=3D""></div></div></div></div></div></div><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opt_offset +=3D =
optlen;<br class=3D"">-- <br class=3D"">2.13.3<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_11C849DE-DEA9-43F9-8020-DC21D284823C--

