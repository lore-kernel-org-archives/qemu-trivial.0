Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQbnm-0005FX-Kt
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dQbnk-0005DT-2P
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dQbnj-0006sf-99
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:56:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45774)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dQbne-0006pa-7d; Thu, 29 Jun 2017 11:56:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9348432A891;
	Thu, 29 Jun 2017 15:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9348432A891
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9348432A891
Received: from [10.36.116.90] (ovpn-116-90.ams2.redhat.com [10.36.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07396900C9;
	Thu, 29 Jun 2017 15:56:01 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, "Emilio G . Cota" <cota@braap.org>,
	Stefan Weil <sw@weilnetz.de>, Yang Zhong <yang.zhong@intel.com>
Cc: qemu-trivial@nongnu.org
References: <20170629150308.22766-1-f4bug@amsat.org>
	<20170629150308.22766-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e2dba5c3-ab08-f4c4-3b1f-7bd82d093399@redhat.com>
Date: Thu, 29 Jun 2017 17:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170629150308.22766-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 29 Jun 2017 15:56:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/5] MAINTAINERS: update
 KVM entries
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
X-List-Received-Date: Thu, 29 Jun 2017 15:56:17 -0000

On 29.06.2017 17:03, Philippe Mathieu-Daud=C3=A9 wrote:
> moved in 92229a57 to accel/
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 06006fc7df..86a08c5aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -273,8 +273,8 @@ Overall
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  L: kvm@vger.kernel.org
>  S: Supported
> -F: kvm-*
>  F: */kvm.*

While you're at it ... what's the */kvm.* good for nowadays? Was this
though for the target-*/kvm.c files? If so, we should update this to
target/*/kvm* instead.

> +F: accel/kvm/
>  F: include/sysemu/kvm*.h

Maybe also add an entry for scripts/kvm ?

 Thomas

