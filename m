Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1es9bZ-0007Gi-JN
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2018 11:01:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es9bX-0007FZ-IH
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 11:01:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es9bW-0006o7-OG
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 11:01:47 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anatoly.trosinenko@gmail.com>)
	id 1es9bU-0006le-8D; Sat, 03 Mar 2018 11:01:44 -0500
Received: by mail-oi0-x244.google.com with SMTP id c18so9172713oiy.9;
	Sat, 03 Mar 2018 08:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oJRyEt7iQbW+KEQlmzNl9/6aO/PKV3K3AS92Jt6EhW0=;
	b=ZVgR567S89/seVdUlfzAGSwanBcboPgQ0R+fhxaZ6NhVEsulBTRvHuR17qwBkVUGpw
	SBLFVz8vJsI3Cyi/vs1S8stefZUskSSoVUa+DajP8PZ11Br8MXbqEqApnX5eReuUvDV+
	ZKeRkm0/HI2mlSFT9WZ1SPz6aeO0D+Ixui4/hpjcf1bCpHuBFKA1bpIdqb+8nu/tiGJ6
	b/wDXbhaHD5kskx4jzyJ8PUDOLlc1EyqHByxIcAjFV/AelBJcoZBX7JiVl7kDxKtcU06
	MR9OMEkwdLKuXhAL8RME7SIGkc6T9GFtFTp/W2WwbdGUTDT5VovGAK4xgfrqtF8pRbP8
	Ic7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oJRyEt7iQbW+KEQlmzNl9/6aO/PKV3K3AS92Jt6EhW0=;
	b=C9c55BbYmFsv5htKlbGdOCXd+LUSV4UuUpaEricy1tjYz+p20yUC4H2y5td5R62c3r
	lO18wl/iuYMlt5SI9zHvJfE5ponBXuwt8+MVP24R9Y68JiieHmzkxaxtsH3YsRu/bQSi
	TW0+Taa28ZPVX82i5EgiSGrubFB/qdKXOL8KmjhjcuZBkWOkWDSm/wYq7B4+RCRyWidG
	TPTV1iCNQ+OYsMjmKQNTrfvGn5sjJbfHpxFPQIOzuSLe9sEmdgNiB9CuwhFDKwv15Om3
	lkVwaANsjGzdfAkDbvUA/RLZC+UMutxWcTxkCS1k2JnbXNvM1ioof7RDwBpPdFX4x3Rt
	oYoQ==
X-Gm-Message-State: APf1xPCl4qwchiIx7I5YZfWa10/gQgFRzJBN+1SW6XF6NdNffk6Kyd1R
	A7vmzlpRRaGS6/Pobu8pyZrb3GTHctkLtvZiiso=
X-Google-Smtp-Source: AG47ELveqmq1poNTZcUiLc/XlydnK9DjdyWCfF+1uNOG2EG5vyi4TWMCDP1ogUyYN4DHhwWYIJ4Jrnx7KhpSNYYxebw=
X-Received: by 10.202.240.212 with SMTP id o203mr6337778oih.182.1520092903381; 
	Sat, 03 Mar 2018 08:01:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.0.169 with HTTP; Sat, 3 Mar 2018 08:01:42 -0800 (PST)
In-Reply-To: <57abe9de-1258-3624-2f8a-882f1de1d19d@weilnetz.de>
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
	<CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
	<efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
	<CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
	<57abe9de-1258-3624-2f8a-882f1de1d19d@weilnetz.de>
From: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
Date: Sat, 3 Mar 2018 19:01:42 +0300
Message-ID: <CAE5jQCcKo_4iWaNd-+iFNjTCrhnU++GaWfkC+RmouYNufJh0eQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="94eb2c0919dc8826b505668435c0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [PATCH 1/1] tci: eliminate UB due to unaligned
 reads
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
X-List-Received-Date: Sat, 03 Mar 2018 16:01:48 -0000

--94eb2c0919dc8826b505668435c0
Content-Type: text/plain; charset="UTF-8"

2018-03-03 18:41 GMT+03:00 Stefan Weil <sw@weilnetz.de>:

> Am 03.03.2018 um 15:07 schrieb Anatoly Trosinenko:
> > Can rewriting TCI in such a way that every operation is aligned at 4- or
> > even 8-byte boundary fix the situation or are there some more serious
> > problems?
>
> That's my preferred solution. Are there cases which would require 8-byte
> alignment?
>

And what if create some function like

uint8_t *align_and_increment(uint8_t **ptr, int pow2) {
  size_t size = 1 << pow2;
  uint8_t *result = (uint8_t*)((((uintptr)*ptr) + size - 1) & ~(size - 1));
  *ptr = result + size;
  return result;
}

and rewrite get / put functions like this:

static uint32_t tci_read_i32(uint8_t **tb_ptr)
{
    uint32_t value = *(uint32_t *)align_and_increment(tb_ptr, 2);
    return value;
}

On one hand, it involves some slightly obscure pointer calculations
(just in one place), on the other hand, no modifications will probably
be required for TCI TCG backend or interpreter loop code (they can
still be useful for **optimizations** of bytecode size, but it should
just work as is).

--
Best regards,
Anatoly

--94eb2c0919dc8826b505668435c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2018=
-03-03 18:41 GMT+03:00 Stefan Weil <span dir=3D"ltr">&lt;<a href=3D"mailto:=
sw@weilnetz.de" target=3D"_blank">sw@weilnetz.de</a>&gt;</span>:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">Am 03.03.=
2018 um 15:07 schrieb Anatoly Trosinenko:<br>
&gt; Can rewriting TCI in such a way that every operation is aligned at 4- =
or<br>
&gt; even 8-byte boundary fix the situation or are there some more serious<=
br>
&gt; problems?<br>
<br>
</span>That&#39;s my preferred solution. Are there cases which would requir=
e 8-byte<br>
alignment?<br></blockquote><div><br>And what if create some function like<b=
r><br>uint8_t *align_and_increment(uint8_t **ptr, int pow2) {<br>=C2=A0 siz=
e_t size =3D 1 &lt;&lt; pow2;<br>=C2=A0 uint8_t *result =3D (uint8_t*)((((u=
intptr)*ptr) + size - 1) &amp; ~(size - 1));<br>=C2=A0 *ptr =3D result + si=
ze;<br>=C2=A0 return result;<br>}<br><br>and rewrite get / put functions li=
ke this:<br><br>static uint32_t tci_read_i32(uint8_t **tb_ptr)<br>{<br>=C2=
=A0=C2=A0=C2=A0 uint32_t value =3D *(uint32_t *)align_and_increment(tb_ptr,=
 2);<br>=C2=A0=C2=A0=C2=A0 return value;<br>}<br><br>On one hand, it involv=
es some slightly obscure pointer calculations<br></div><div>(just in one pl=
ace), on the other hand, no modifications will probably <br>be required for=
 TCI TCG backend or interpreter loop code (they can <br>still be useful for=
 **optimizations** of bytecode size, but it should <br>just work as is).<br=
><br>--<br></div><div>Best regards,<br></div><div>Anatoly<br></div></div></=
div></div>

--94eb2c0919dc8826b505668435c0--

