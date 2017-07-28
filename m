Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dazGH-0002nN-Ih
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 03:00:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazGE-0002lN-Cu
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:00:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazGD-0007gs-LC
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:00:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dazG8-0007dB-EK; Fri, 28 Jul 2017 03:00:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F3C81A8060;
	Fri, 28 Jul 2017 07:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4F3C81A8060
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B471B7766B;
	Fri, 28 Jul 2017 07:00:25 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-6-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a7fdc125-9a1b-bec3-915f-e8f764816b0d@redhat.com>
Date: Fri, 28 Jul 2017 09:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 28 Jul 2017 07:00:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/47] MAINTAINERS: add
 missing KVM entry
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
X-List-Received-Date: Fri, 28 Jul 2017 07:00:35 -0000

On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b472d7a09..ece02522be 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -278,6 +278,7 @@ S: Supported
>  F: */kvm.*
>  F: accel/kvm/
>  F: include/sysemu/kvm*.h
> +F: linux-headers/asm-*/kvm*.h

The linux-headers are not really maintained by the QEMU project - so I
guess we do not need an entry for these?

 Thomas

