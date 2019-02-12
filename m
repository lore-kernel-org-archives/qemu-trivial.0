Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtZkV-0007jj-DU
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 10:13:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gtZkT-0007ia-9z
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 10:13:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gtZkR-0000wA-GI
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 10:13:25 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gtZkP-0000tJ-Us; Tue, 12 Feb 2019 10:13:23 -0500
Received: by mail-wr1-x442.google.com with SMTP id q1so3067611wrp.7;
	Tue, 12 Feb 2019 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=86OgqEAvhQp9t77EUYf/JnHSe5QYnBtfm3bAW7sEcR0=;
	b=MXnDvDJ03ZKuAlrB6qiOHGWyWBOAWcs+NOdB8yq5WE17uFxsFux5uPvrHJqL9ee4Ju
	WCOgE+IIwmzlAq6q9UC3aVQY/DsJLIblCWy+YFXavHsN0rCBLM92fygmHokOXw66LIY+
	0DV1qcg55n0IPyzZYqeGS8/9F7T1ZLplRoVsItPq8W3isJInINRLJeyjYHYFNw5JJxp3
	bO/kGvoP99l4jFJ/9YC73lRsDLd5kyQtCsdv/ya9ueIuJ+bJBZmE9hx9CEfQQNPUtGCP
	nm6f9EyJdA/bSX8ERktpKJ49ncu2yzyd112w+q+maM0nJr0LkFauG16dD3TQriEOMJL+
	jOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=86OgqEAvhQp9t77EUYf/JnHSe5QYnBtfm3bAW7sEcR0=;
	b=dkGWDzsPOs19Z/VWuGbYGmLJF9raZw3xXSKtzX80FcN+h5NE5ZcLwuh68xcwxIc2WC
	emfLo5LO9ufVWryXLocznCW4uvtvLNCa4o6S2yk0gkuQcgQIRxF93dsybJk5Mq4QTwOx
	F+Y7r+bYUtts4vK+PbnNfPBV8eYMXe9kr68ejPxsyxhtzfVL9xa9xqnnUsncNqOVU1Od
	DnsxIeeoofPs45URjuO6V+JLTtdlWnAr4C9pz/uNLmwb8x6kloxWd6a9FZw54EeTS0+p
	UC1nbaUxmIztKomLUf7d3Ju+l+ph3fiWUCBDGx3nSWf++GUIwycDr6i/HrnomirTO0TP
	XBIA==
X-Gm-Message-State: AHQUAuaNDJ62UTi7bBjBUrSCC+7pui9jwdXnDWLRJ1v7nOekovbtd+od
	STS2kqAKLDPb4YfiV4nRHNnGK+vPle6iZK1LkOo=
X-Google-Smtp-Source: AHgI3IamMQdEUvcMt+2y1Uq/bENnGNph20NlzNwSraCuV6fWzFnG2AAJYt6UUn5LITZC2NnXIQfBZTE5HmZ9CurtmYA=
X-Received: by 2002:adf:dc08:: with SMTP id t8mr3219550wri.57.1549984400375;
	Tue, 12 Feb 2019 07:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20190212145722.31891-1-philmd@redhat.com>
In-Reply-To: <20190212145722.31891-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 12 Feb 2019 16:13:08 +0100
Message-ID: <CAJ+F1CKSOKYpfY8Pa6K-cttjopq2Tc_SEHvW2biU9E2WFYjAjQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Anatoli Huseu1 <avg.tolik@gmail.com>, qemu trival <qemu-trivial@nongnu.org>,
	QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] chardev/wctablet: Fix a typo
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
X-List-Received-Date: Tue, 12 Feb 2019 15:13:26 -0000

On Tue, Feb 12, 2019 at 4:12 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The correct name is Wacom.
> Fix the typo present this the origin of this file (378af96155d).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/wctablet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/chardev/wctablet.c b/chardev/wctablet.c
> index 969d014574..35dbd29a33 100644
> --- a/chardev/wctablet.c
> +++ b/chardev/wctablet.c
> @@ -177,7 +177,7 @@ static void wctablet_input_sync(DeviceState *dev)
>  }
>
>  static QemuInputHandler wctablet_handler =3D {
> -    .name  =3D "QEMU Wacome Pen Tablet",
> +    .name  =3D "QEMU Wacom Pen Tablet",
>      .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
>      .event =3D wctablet_input_event,
>      .sync  =3D wctablet_input_sync,
> --
> 2.20.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

