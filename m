Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1is2EO-0007e7-Tj
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2020 05:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is2EJ-0007Sl-Ql
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 05:18:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is2EG-0002ly-9z
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 05:18:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39056
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is2EG-0002lZ-75
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 05:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579169899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAatYQTNUTPdJ6d03tJcmCC/Xn+XsxgHaQaBOVtCAWk=;
 b=abSK3dZy5kJSREk/bE5XVt7B0YIKwcW9WsBJhAOjVuvCNTe8GmWW9FacGk1oRdeN6ChlES
 VYiAFgu5jBMSPAAG3szrwR4NCOoLiVDZAuatMxs/Qdm+Rl5sOb7AH7s3NDbfYcaw8Sxmn8
 vKQUUU2Kf/fpKrmczNBVAaeWFYA76Bo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-77GuOgSsNYCXURxFtB0hYA-1; Thu, 16 Jan 2020 05:18:17 -0500
Received: by mail-wr1-f71.google.com with SMTP id u12so9091447wrt.15
 for <qemu-trivial@nongnu.org>; Thu, 16 Jan 2020 02:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ykBfbSPQQu4tuR0Vtt/rxXrBmMQ6N/p5anJQxasXpAg=;
 b=QCQAZXGS9Fcz3k2vb51OoQhupBgTZleUqkmR/VBTdiiLnW7fOQTudxvZXQJIMUh7W0
 fg3DlwvfvwPZRi36NSMQhdTah9I9bZRhfOatpgC4eOjmq9MaXG/a3RDcVHefmqRdQ4lJ
 DApPTGZPlHUnd5BhKeeyVLdxz/MrAPraNmhZHwklmAhs0i4XGuYE6PIrv+DiVmW7HZw0
 rvmEw4DMMBdQZIA9P//IsunAmIdE6z11e1LrusNmMtze7PVElg+lnZdS9hGuZp0/yTLQ
 qijCwse/IDy7Kuo3/1Ae0gcf4CRy6F5u/n6ZyLKtG2u/zrCN6yVczPU73qJwGng6EaYy
 La+A==
X-Gm-Message-State: APjAAAXwJGrkOCtAIY4yVfHdzd3tf/QtF1HQoWlSxHuFsRAcyfYosPx2
 iTLx1JtRMmLSdlHQfJvrub35v1Om28xon800twuXedN4GcyaYl1X48MwProWW1Zl0lz3Evj6WN1
 vnS1u+6wpDdmYvBmFgA==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr5054114wmk.131.1579169896125; 
 Thu, 16 Jan 2020 02:18:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPsP6g7rvou7kkiPJ4stcYjfvNO3ofRRsEITTv+FzHl/Rb8/zlKK1iC6sEdpGadzxcB2WyEA==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr5054091wmk.131.1579169895880; 
 Thu, 16 Jan 2020 02:18:15 -0800 (PST)
Received: from [192.168.1.24] (lfbn-mon-1-1519-115.w92-167.abo.wanadoo.fr.
 [92.167.83.115])
 by smtp.gmail.com with ESMTPSA id i8sm29579393wro.47.2020.01.16.02.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 02:18:15 -0800 (PST)
Subject: Re: [PATCH] Makefile: Keep trace-events-subdirs ordered
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Laurent Vivier <lvivier@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>
References: <20200116091314.25024-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <21923d70-a19a-71ef-ab11-2b77214eab19@redhat.com>
Date: Thu, 16 Jan 2020 11:18:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116091314.25024-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 77GuOgSsNYCXURxFtB0hYA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
X-List-Received-Date: Thu, 16 Jan 2020 10:18:27 -0000

On 1/16/20 10:13 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> To ease review and reduce likelihood of merge failures (see [*]),
> keep trace-events-subdirs ordered when possible, following eb7ccb3c0.
>=20
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg671007.html
>      Duplicate trace-events-subdirs entries generates duplicated
>      symbols when using the LTTng Userspace Tracer library.

If it seems useful/relevant we can add to this description UST backend=20
config and the error when using duplicate entries:

   $ ./configure --enable-trace-backends=3Dust && make
   [...]
     CC      trace-ust-all.o
   In file included from trace-ust-all.h:13,
                    from trace-ust-all.c:13:
   trace-ust-all.h:35151:1: error: redefinition of=20
=E2=80=98__tracepoint_cb_qemu___loader_write_rom=E2=80=99
   35151 | TRACEPOINT_EVENT(
         | ^~~~~~~~~~~~~~~~
   trace-ust-all.h:31791:1: note: previous definition of=20
=E2=80=98__tracepoint_cb_qemu___loader_write_rom=E2=80=99 was here
   31791 | TRACEPOINT_EVENT(
         | ^~~~~~~~~~~~~~~~

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> "Fixes: 26b8e6dc & 8d5d515a0"
>=20
> To be even safer we should use $(sort $(trace-events-subdirs))
> ---
>   Makefile.objs | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Makefile.objs b/Makefile.objs
> index 7c1e50f9d6..d62f908965 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -142,8 +142,8 @@ trace-events-subdirs +=3D nbd
>   trace-events-subdirs +=3D scsi
>   endif
>   ifeq ($(CONFIG_SOFTMMU),y)
> -trace-events-subdirs +=3D chardev
>   trace-events-subdirs +=3D audio
> +trace-events-subdirs +=3D chardev
>   trace-events-subdirs +=3D hw/9pfs
>   trace-events-subdirs +=3D hw/acpi
>   trace-events-subdirs +=3D hw/alpha
> @@ -191,6 +191,7 @@ trace-events-subdirs +=3D migration
>   trace-events-subdirs +=3D net
>   trace-events-subdirs +=3D ui
>   endif
> +trace-events-subdirs +=3D hw/core
>   trace-events-subdirs +=3D hw/display
>   trace-events-subdirs +=3D qapi
>   trace-events-subdirs +=3D qom
> @@ -203,7 +204,6 @@ trace-events-subdirs +=3D target/riscv
>   trace-events-subdirs +=3D target/s390x
>   trace-events-subdirs +=3D target/sparc
>   trace-events-subdirs +=3D util
> -trace-events-subdirs +=3D hw/core
>  =20
>   trace-events-files =3D $(SRC_PATH)/trace-events $(trace-events-subdirs:=
%=3D$(SRC_PATH)/%/trace-events)
>  =20
>=20


