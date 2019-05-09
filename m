Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOjVT-0002Cf-Ta
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 09:54:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hOjVQ-000295-Hw
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 09:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hOjVP-0005sL-NN
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 09:54:40 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38819)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1hOjVN-0005qF-KG; Thu, 09 May 2019 09:54:37 -0400
Received: by mail-wr1-x443.google.com with SMTP id v11so3206273wru.5;
	Thu, 09 May 2019 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=k6RRKwWPLYth/9ZFL0q6xP+XfwMD3JRmUnwbWJFR320=;
	b=Dsq7XGhe/7gClCA9LmjT6nYfwDFWqdydCigU+sRo0Nkplq81Rm82ECGepXastpQGcJ
	d/fppOTkmoQM5aXDwYnHH8+3D9/cRtLQdBCoKBSSKRRmhN9JXOOm5CREvxlC/go+OJWO
	ad9yGaOIRo3Fsls0fovn3UDcUtpPh8nejd/QtTMJ2F+pbGLlJ7DZ0YzXONM1hcUcXopJ
	o9121jYlZDBO4qhUeDwWlVgEUd9PoACw7kEb+SLFSBKMbdhUvQcIMQCrYmY1ngpQTlFt
	BEHJ9G16E9i4RENyllTUM8Tio5X4ZPE+xSmelvkldI/EMSIejWp5fc0x6veo7f+gY3gn
	B8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k6RRKwWPLYth/9ZFL0q6xP+XfwMD3JRmUnwbWJFR320=;
	b=R8OWSBflCy3SS2r3i04dufN1qxk00fUjWMo6cwz8bTnXZ5tf5FVlpjN7jtE6tkB0xz
	k2k3XyECIuhPFR+mOXyJ00dWcbxfXJcVH2Hjk5XJ/jqKUgBAcnq9Tso0RaRXZCgQUCEp
	l1IjepipwSb7f5l/kV2GHewoqdA53MnsQAcb0wFioSG02fYy+gtV2J6SYJzfd0N1pdiJ
	vMPqs+7Tmys9cl72/oghgKgIvwTOSXcEWQCvbcl2SSnsuf0GOtDqg08L4/Z83HXNlChz
	DzmAtuAxwm4Jz/0jDqUILdUnJmEXMMdrGzqBUCna0SXMhCbGsuo9sgN16y7p9cAOEpgk
	XVaQ==
X-Gm-Message-State: APjAAAVPQwNH41e80YX+/rRajeeVwVETwEx3ofYWiYCggZxqEXKPpbJs
	CvFlwM/XMLqyYrDT98UTRL1TW1H+EaKu6xP5RAA=
X-Google-Smtp-Source: APXvYqxKjtmC2DRBbLGw3i37wG7R0DJ4R5h7t+6wYrgyKdjC0RO06zjmhsQuntmaDW+rNeF+zThkGm33kEoUnqQe4ng=
X-Received: by 2002:adf:9042:: with SMTP id h60mr3225042wrh.248.1557410076357; 
	Thu, 09 May 2019 06:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190509133737.242548-1-sgarzare@redhat.com>
In-Reply-To: <20190509133737.242548-1-sgarzare@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 9 May 2019 15:54:24 +0200
Message-ID: <CAJ+F1CJth8eCirh6qQK=mL-LDVStSEJhe9R+vsLX-iWytFZ0+Q@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/slirp: fix the error
 message when the prefix len is invalid
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
X-List-Received-Date: Thu, 09 May 2019 13:54:41 -0000

On Thu, May 9, 2019 at 3:39 PM Stefano Garzarella <sgarzare@redhat.com> wro=
te:
>
> Add a missing parentheses at the end of the error message,
> when we have an invalid prefix len.
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  net/slirp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index 95934fb36d..0f4ae0abc0 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -498,7 +498,8 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
>      }
>      if (vprefix6_len < 0 || vprefix6_len > 126) {
>          error_setg(errp,
> -                   "Invalid prefix provided (prefix len must be in range=
 0-126");
> +                   "Invalid prefix provided "
> +                   "(prefix len must be in range 0-126)");
>          return -1;
>      }
>
> --
> 2.20.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

