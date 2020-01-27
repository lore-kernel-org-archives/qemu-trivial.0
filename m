Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iw1xC-000203-Bl
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jan 2020 05:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iw1x9-0001xR-Eu
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2020 05:49:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iw1x8-0007mq-8N
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2020 05:49:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41145
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iw1x8-0007md-5H
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2020 05:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580122149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZGcZobXFPSfW+Y9ZDx4BxNaOVz1JOpgiSu/3hiEJ2I=;
 b=E+BbNRDX+dMDSZWtmkVXqPrQJQP71ZORj+N+jtIRxcEPWLFv3hyqas28G1lMLqwWP9cCST
 GBLqxxLetMjUEIGlDYHn0kReHYlnDHSp8X1+LqgP5pgsdUTvu8oPDZcr2oM/2rSWhgQSzI
 FDXeuolY8ALx59pLgFaVUaoaOt9vowA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-IblQ37RWOn-eVFF5RQniiw-1; Mon, 27 Jan 2020 05:49:07 -0500
Received: by mail-wm1-f70.google.com with SMTP id s25so1214654wmj.3
 for <qemu-trivial@nongnu.org>; Mon, 27 Jan 2020 02:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HWt5QEKWSaIwB8izXO+a+hyDvNnZfkOHSWr7GgQFrtI=;
 b=pvASyA2TiMYv43XZ0AsVTIo8HkCSdXyCbYP6oWErsC6uSCvCy6Dt0/RiOH27Id7uUZ
 Pe2ESSfJJlDllwJd14OOihPOs7J/Bq5EhJhzoWu7GkAzMMJ9ZYXWNEF+kX8G/oKa6iCl
 IvxBP5MT2drEbmiueiwzvDB2p8UfnvpVQi631jLLY6UZnyCkdRq/6EJJz2Rk5JNEi256
 z3BXVDZzc+8odEsORfW/8om1kOZ1XqOtFh7OnuE4c3vzTa5NBQ9584i/3vIz4JaV8iFq
 kUCV6NhUBEFQ/mlvSovrEKAMozIIP0nNqNedaAfDRF9vU3QYLiXv8liQ5KEVjElgSvXK
 +3BQ==
X-Gm-Message-State: APjAAAWlMwbUdZa5BgmFZTm0l68IdNxCSF5Y9jM2z4Dot43GZYOgauAw
 vfnDh0hRMI5IHple8hqzaAtwswc06qyZfZXCaWzpTf9kC1ldjn4xdAOSRoDaiW6Nk5+obrji7Xc
 CPhSZo3TQ15IvpDIN1g==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr11105319wmj.2.1580122145532; 
 Mon, 27 Jan 2020 02:49:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYU0QQeX1MvnSlyOfGGXAzIazUhdv7afSTWwPmgiDS1CnCpq6bpFnpQnHlpbIxQRk28gtaNQ==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr11105287wmj.2.1580122145240; 
 Mon, 27 Jan 2020 02:49:05 -0800 (PST)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id y20sm10350484wmi.23.2020.01.27.02.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 02:49:04 -0800 (PST)
Subject: Re: [PATCH v3 01/13] usb/dev-storage: remove unused include
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
 <20200127103647.17761-2-mlevitsk@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc640c71-dfec-f2a6-c5d3-f38d8fdbfa00@redhat.com>
Date: Mon, 27 Jan 2020 11:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200127103647.17761-2-mlevitsk@redhat.com>
Content-Language: en-US
X-MC-Unique: IblQ37RWOn-eVFF5RQniiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 27 Jan 2020 10:49:12 -0000

On 1/27/20 11:36 AM, Maxim Levitsky wrote:
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   hw/usb/dev-storage.c | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
> index 8545193488..50d12244ab 100644
> --- a/hw/usb/dev-storage.c
> +++ b/hw/usb/dev-storage.c
> @@ -19,7 +19,6 @@
>   #include "hw/scsi/scsi.h"
>   #include "ui/console.h"
>   #include "migration/vmstate.h"
> -#include "monitor/monitor.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/block-backend.h"
>   #include "qapi/visitor.h"
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


