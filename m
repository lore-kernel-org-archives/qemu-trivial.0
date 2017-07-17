Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dX9YF-0006Hn-6G
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jul 2017 13:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dX9Y9-0006HX-EL
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 13:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dX9Y4-0005Bu-NY
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 13:11:13 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dX9Y4-0005BX-JC; Mon, 17 Jul 2017 13:11:08 -0400
Received: by mail-qt0-x244.google.com with SMTP id w12so18946410qta.2;
	Mon, 17 Jul 2017 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lIlJcFtvVGVgnee6OXDGb2EyM6nsDWHpJauwciJ46f8=;
	b=Z5R7aER05q2Sn/mmLl4YsOgojQzh9AsjK4Mf7fSCZXL2N3BPIJLytTSxZm73NE2W0e
	vU5cLo8XMJ+dTOxn7IwHpQ6AbJyJXl/D7zlBzgEbAhD5ez3V7zPJBj+CdVv/sJ+Ruyw2
	0WWi0WgFX0hEM9o9qlLzDiQUF0/KOrbSrMMpOMHv9VJLugN7Ubu12+c/C1fmgrEaNcrA
	XSNFu7xOPzlpA0t+scpQkBS78Q7jOQS3nDVuSOKIkQAiONsf2uZTD88vJ0ek/QizQozV
	AJ3ogBmxL/PY8LSRJcBzUvbrJvUNrvq+Hp8TVXrf9AplqR6RKkhE4/fKYHc3R0bZKjLO
	t2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lIlJcFtvVGVgnee6OXDGb2EyM6nsDWHpJauwciJ46f8=;
	b=QWUOD0pM7BuA6j/4ZqGD7pXz4nqhGw3k60EwnFjJjppA96vUX0H7Y3oc1hdb9r0GhP
	Q8hXzOVu4QzfTrn17xW0mgx/cSbNz+Kgquiqj4PUVA0ygrMwvG/mgxkg1ExAXpJ2tvRr
	FCvWtBlWA/M1lshom4lrhaPWwngDI1pB069Vfu2ZAm6n7uCUtpnc87pZ93DFB1Y8IGKQ
	Fqpq2EKSoSL8DZlRdSnY2b50CqkZbWGFfLjkX1SAqXgHGdv4HHXJss6+yzB1K1jehoUR
	dFpJgnfRuJE8wBFjQSZjpilyL4sxQkHn1Nxy6ido1yz0R+sMPDAcUEjRDgPHWb3Mqdab
	sLiA==
X-Gm-Message-State: AIVw1139DASdgazwBpAxAl7jOWsTX5of4KGDuOWpVvlcnMxbX7r1qNb8
	4vkVuMnQNZFCDw==
X-Received: by 10.237.61.146 with SMTP id i18mr9807949qtf.239.1500311467622;
	Mon, 17 Jul 2017 10:11:07 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	q17sm5060582qkh.53.2017.07.17.10.11.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 10:11:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, dgilbert@redhat.com, kraxel@redhat.com
References: <20170717151334.17954-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <64dc6715-c032-3e74-4eb8-f00b10e9c968@amsat.org>
Date: Mon, 17 Jul 2017 14:11:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170717151334.17954-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [PATCH] usb: Fix build with newer gcc
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
X-List-Received-Date: Mon, 17 Jul 2017 17:11:18 -0000

On 07/17/2017 12:13 PM, Eric Blake wrote:
> gcc 7 is pickier about our sources:
> 
> hw/usb/bus.c: In function ‘usb_port_location’:
> hw/usb/bus.c:410:66: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 15 [-Werror=format-truncation=]
>           snprintf(downstream->path, sizeof(downstream->path), "%s.%d",
>                                                                    ^~
> hw/usb/bus.c:410:9: note: ‘snprintf’ output between 3 and 28 bytes into a destination of size 16
>           snprintf(downstream->path, sizeof(downstream->path), "%s.%d",
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                    upstream->path, portnr);
>                    ~~~~~~~~~~~~~~~~~~~~~~~
> 
> But we know that there are at most 5 levels of USB hubs, with at
> most two digits per level; that plus the separating dots means we
> use at most 15 bytes (including trailing NUL) of our 16-byte field.
> Adding an assertion to show gcc that we checked for truncation is
> enough to shut up the false-positive warning.
> 
> Inspired by an idea by Dr. David Alan Gilbert <dgilbert@redhat.com>.

elegant :)

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/usb/bus.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index 5939b273b9..d910f849e7 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -407,8 +407,10 @@ void usb_register_companion(const char *masterbus, USBPort *ports[],
>   void usb_port_location(USBPort *downstream, USBPort *upstream, int portnr)
>   {
>       if (upstream) {
> -        snprintf(downstream->path, sizeof(downstream->path), "%s.%d",
> -                 upstream->path, portnr);
> +        int l = snprintf(downstream->path, sizeof(downstream->path), "%s.%d",
> +                         upstream->path, portnr);
> +        /* Max string is nn.nn.nn.nn.nn, which fits in 16 bytes */
> +        assert(l < sizeof(downstream->path));
>           downstream->hubcount = upstream->hubcount + 1;
>       } else {
>           snprintf(downstream->path, sizeof(downstream->path), "%d", portnr);
> 

