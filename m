Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihGpB-0001ov-P5
	for mharc-qemu-trivial@gnu.org; Tue, 17 Dec 2019 12:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihGp9-0001lC-Ds
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 12:39:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihGp8-0000rx-Dh
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 12:39:55 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41927
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihGp8-0000r8-Ac
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 12:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576604393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otHh6o7oxDp9j6yghQWHjKyedFvOrFKCAiJYw7JbOso=;
 b=bnPZalXMiAaF53WxblMvaAk6GFNlAyhlmGtNc555QdflK8aeToXuarQu8onLZf2pNiw0AO
 leKUy7Jyjt447Z4TQKuKlqrrj2DZA9jAqxs/7958D6pxh7lh2NqJSDrjnDPG0NhIb0Fd74
 bFVg/b5J5IVKytkFNgpC3PZjUF5uQV8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-4EIAgU1aN2upRyQVkR9HMQ-1; Tue, 17 Dec 2019 12:39:52 -0500
Received: by mail-wr1-f69.google.com with SMTP id u18so5621376wrn.11
 for <qemu-trivial@nongnu.org>; Tue, 17 Dec 2019 09:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bAAJWyVVZ1IKai9f9il7x2Z+RsApLRgS+QHt3wBYLSA=;
 b=ZjDjiMI78nIh6pCzyDUyVjeC10GtrJNyq2KqWR849oQbxltcN+65r+nOrQTJqZ/sTE
 afQ7gXuFvgfrQsuW2427xilGSRurhd4FPB0Sf7DQywvOCPoz6QLnQRoIYCasGMvRqdOA
 VDsyibc24yF32ZXSg/GhBAU1aWpA4rhMUxmb5GHFtcikzJR9iURFRdfBoPgNW8YGTSUq
 431uv1GxJ0/8BjjW8yd9zwA5hvoYgB/zYxA/fBnEwzBkZL1gUrFo3adKFzJFseY5qXi7
 bLxwhooLXUJKhY5c/eHXhAJLHDVb5ZBpMB71y5VFpayviItNaV3vJLQQhGRzPv9qXgsz
 Imng==
X-Gm-Message-State: APjAAAWjx0MCirS1YcNrWLQd+tXzXW8jWlvC7TYJcaShe+g5ve3fH2f0
 aarCIbBMwQbJzci+wbChEDjrJ/wMJ+kkRkCNfjNarzX4sT3NtwmbA8Ch64e4ah/WZ2rItq64QVt
 pGGnJer1t/zNf6K1MeA==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr38388337wru.40.1576604390835; 
 Tue, 17 Dec 2019 09:39:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFBpSiHMJZuiUp5KC+DdlpgXyZDlJKyko8FRSj5XpUtFN/99wAgHNrx1ZQ4OV5F9Cdqp7BRQ==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr38388290wru.40.1576604390534; 
 Tue, 17 Dec 2019 09:39:50 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id h17sm27417449wrs.18.2019.12.17.09.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 09:39:50 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Max Reitz <mreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Gerd Hoffmann <kraxel@redhat.com>,
 Hannes Reinecke <hare@suse.com>, =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?=
 <dirty.ice.hu@gmail.com>
References: <20191217173252.4672-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6a8266c6-7c6d-3139-249f-2dd46c98e02f@redhat.com>
Date: Tue, 17 Dec 2019 18:39:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217173252.4672-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 4EIAgU1aN2upRyQVkR9HMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Dec 2019 17:39:56 -0000

On 12/17/19 6:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix some trivial warnings when building with -O3.
>=20
> Philippe Mathieu-Daud=C3=A9 (6):
>    audio/audio: Add missing fall through comment
>    hw/display/tcx: Add missing fall through comments
>    hw/net/imx_fec: Rewrite fall through comments
>    hw/timer/aspeed_timer: Add a fall through comment
>    hw/scsi/megasas: Silent GCC9 duplicated-cond warning
>    qemu-io-cmds: Silent GCC9 format-overflow warning

Sorry, this series failed because I used this tag in the first patch:

Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Then git-send-email was happy with --dry-run, but then failed:
(body) Adding cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.co=
m> from line 'Cc:=20
K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>'
5.1.1 <K  v  g  >: Recipient address rejected: User unknown in local=20
recipient table

Note to self, enclose utf-8 names, as:
Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>


