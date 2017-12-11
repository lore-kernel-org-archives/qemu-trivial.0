Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eORMV-00023V-Fa
	for mharc-qemu-trivial@gnu.org; Mon, 11 Dec 2017 11:55:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eORMT-00023M-FX
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 11:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eORMP-0003sc-8m
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 11:55:25 -0500
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37027)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1eORMP-0003rk-22
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 11:55:21 -0500
Received: by mail-wm0-f53.google.com with SMTP id f140so15408950wmd.2
	for <qemu-trivial@nongnu.org>; Mon, 11 Dec 2017 08:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NKJ7MsWpvTvQ5D11UlZVBldvTgOC/AvDfTdi50n9LAc=;
	b=X2ZTfGB9idtEk3kemrajBBJX9whMQOPDDnZ52jSoVvuFkatnLW0JKQ7x4BiId+mrPG
	/TXDi1eEghr0dFfm92VnsmJyEWopdNuQo0aiNduTY+C2UjoGs4QX5a40MuaZz7EhGsQD
	+OjruBd5HzVb4Ha1vpPxhjfhyGeVgKFbZQCsI9XuaqOhgA4EhasDLtx6xLhaQYfb94a1
	Ci2z79eaLv0sOirU6o3XBm9G1rSG03s+D276dADDIcH49Mx1d82Fm9bCU5UN1s5bcXBr
	GlOsbiFNBwNKJBtBnUYl6/rsc8btjXo9mwxlPgVvBt6WmT1W1qpXRQwVIbGRax6qhTb5
	a9Dg==
X-Gm-Message-State: AKGB3mJCQZcBxDJdlkSSw80BY1DRPL2q5svgR2xS1exm5hSUQqZEnYeB
	lyX/WiRQm4MkthUP5QNB4c/82QUPkyY=
X-Google-Smtp-Source: ACJfBotKlWg807O+QPDdUxN7SpyO0vVCv1/JyyALA77MWKqpj4MpFiDOgv7kdgUHs7wJHRDzc9Fv0g==
X-Received: by 10.80.181.33 with SMTP id y30mr1924910edd.150.1513011319677;
	Mon, 11 Dec 2017 08:55:19 -0800 (PST)
Received: from [192.168.10.150] (dynamic-adsl-78-12-251-125.clienti.tiscali.it.
	[78.12.251.125]) by smtp.gmail.com with ESMTPSA id
	f11sm7039596edf.28.2017.12.11.08.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Dec 2017 08:55:18 -0800 (PST)
To: George Kennedy <george.kennedy@oracle.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <a2b410dd-1150-16a4-9376-069117a14c98@oracle.com>
	<5b24ac58-738a-ac39-f4ed-6cffb3727a26@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd3649e6-0268-7329-0574-0767fe04b3c9@redhat.com>
Date: Mon, 11 Dec 2017 17:55:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <5b24ac58-738a-ac39-f4ed-6cffb3727a26@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.53
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] lsi_scsi: add support for
 PPR Extended Message
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
X-List-Received-Date: Mon, 11 Dec 2017 16:55:26 -0000

On 11/12/2017 17:45, George Kennedy wrote:
> The LSI 53c895a code does not handle the PPR Extended Message. Add
> support to handle PPR Extended Message like SDTR and WDTR are handled.
> That is, to skip past the message bytes and ignore the message.
> 
> ---
>  hw/scsi/lsi53c895a.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 595c260..1e02a89 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -961,6 +961,10 @@ static void lsi_do_msgout(LSIState *s)
>                  DPRINTF("WDTR (ignored)\n");
>                  lsi_skip_msgbytes(s, 1);
>                  break;
> +            case 4:
> +                DPRINTF("PPR (ignored)\n");
> +                lsi_skip_msgbytes(s, 5);
> +                break;
>              default:
>                  goto bad;
>              }

Hi George,

for a patch to QEMU to be accepted, you need to confirm the origin of
your patch (according to the "Developer Certificate of Origin", see
https://developercertificate.org/).

In order to do this, it's enough to reply to this message with
"Signed-off-by: George Kennedy <george.kennedy@oracle.com>" in the reply.

Thanks,

Paolo

