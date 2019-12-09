Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieFs4-000764-4o
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2019 05:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ieFs1-00074E-Cj
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 05:02:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ieFrz-0002CK-9i
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 05:02:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53835
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ieFrz-0002AQ-5d
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 05:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=xxMmNC5FGITGyG1+6EhX9Q2cuRNo/kPIvv4PpcDRbsU=;
 b=UFUCgTmq02n3zj4pHXFLK3Sm7lly6kupbLMQfIHl/DqIF3XEqnT1a7yTn3Af3WE3/rMmuN
 RqcDtfczL0HhrH5DTopzXtuJDbEA6Lv4m5eS1sdJKhDWu/eqfPKc8RduGbRSH4DH+wrmD5
 Xw1sqfX1lSDQug0aqVAbIU55Y70+riw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-QjKFY9XyOeen4Q3QFgFomg-1; Mon, 09 Dec 2019 05:02:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78829800C78;
 Mon,  9 Dec 2019 10:02:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A0818231;
 Mon,  9 Dec 2019 10:02:02 +0000 (UTC)
Subject: Re: [PATCH-for-5.0 v3 1/6] hw/pci-host/i440fx: Correct the header
 description
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Durrant <paul@xen.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <12e7069c-46f0-ae9f-4e1f-70f0b8318180@redhat.com>
Date: Mon, 9 Dec 2019 11:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191209095002.32194-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: QjKFY9XyOeen4Q3QFgFomg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Mon, 09 Dec 2019 10:02:26 -0000

On 09/12/2019 10.49, Philippe Mathieu-Daud=C3=A9 wrote:
> Missed during the refactor in commits 14a026dd58 and 0f25d865a,
> this file is now only about the i440FX chipset.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/pci-host/i440fx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index f27131102d..3fc94426ea 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU i440FX/PIIX3 PCI Bridge Emulation
> + * QEMU i440FX PCI Bridge Emulation
>   *
>   * Copyright (c) 2006 Fabrice Bellard
>   *
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>


