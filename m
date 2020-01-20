Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itQ1L-0006ia-8R
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jan 2020 00:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1itQ1I-0006eJ-FG
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 00:54:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1itQ1F-0006Bp-NP
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 00:54:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51010
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1itQ1F-0006BG-K7
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 00:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579499676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=4EkOUPDmnZw5vrmCcpAKcV3iNLZ563Jg/RVQvolZcPQ=;
 b=Ej/ARJ27r9B80UvgEJI40h8719y+Sx9vxAIJrmf+pBQbVI1MP5hniB5qtSzIMorgPRIKRl
 XzvsKrp9i1yvtzSjLlRlogMUk6k5T5WYf+RevEK+b3u85pEB24Z32gellh3eXDeZrinEiL
 0D0NJXT6/E2+Ct3H+0XJM9gp3tIJ9+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-qBDv0p9UMLSLMjMy1lqzuA-1; Mon, 20 Jan 2020 00:54:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D0131005514;
 Mon, 20 Jan 2020 05:54:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-99.ams2.redhat.com [10.36.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A19460BF7;
 Mon, 20 Jan 2020 05:54:28 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] MAINTAINERS: Add missing m48t59 files to the PReP
 section
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org
References: <20200117165809.31067-1-philmd@redhat.com>
 <20200117165809.31067-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8b6ec2fe-7939-a9d4-8064-e0031eb4aa99@redhat.com>
Date: Mon, 20 Jan 2020 06:54:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200117165809.31067-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qBDv0p9UMLSLMjMy1lqzuA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Mon, 20 Jan 2020 05:54:42 -0000

On 17/01/2020 17.58, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b425d030d..c162145bd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1084,6 +1084,8 @@ F: hw/pci-host/prep.[hc]
>  F: hw/isa/i82378.c
>  F: hw/isa/pc87312.c
>  F: hw/dma/i82374.c
> +F: hw/rtc/m48t59.c
> +F: hw/rtc/m48t59-internal.h
>  F: hw/rtc/m48t59-isa.c

You could also use a wildcard instead of the three lines:

F: hw/rtc/m48t59*

 Thomas


