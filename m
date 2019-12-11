Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if7ik-0001LU-As
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 14:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1if7ii-0001Km-3f
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 14:32:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1if7ig-0003MT-0B
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 14:32:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36554
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1if7if-0003Ks-SP
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 14:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576092740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=yvo8n6RCTc2X2WRj2epWJdsDbQMPsAJanlqukKi8eDw=;
 b=Jzk61zFjSTvGMjJGyQCpRKnav0nz3KMiM+nthRdYZtSinbvi0rcJ+1dPQe86XOy3GCUPdi
 +wngxxPKFu/FR2J7dJ511ItRr5aHhcoYsfI74BFpQJkehxUWWiRpm15vT3Q6cGDdXJYXTd
 47ttlphZLtWoBOCgSrxjtjbNG2pLTVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-OuwC4UVpN_Cc01hJtnT7Pw-1; Wed, 11 Dec 2019 14:32:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1112100550E;
 Wed, 11 Dec 2019 19:32:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-85.ams2.redhat.com [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A54D96293B;
 Wed, 11 Dec 2019 19:32:15 +0000 (UTC)
Subject: Re: [PATCH] glib: use portable g_setenv()
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <1576074210-52834-7-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0e1b1e96-9780-7ee0-d463-2199ce66f840@redhat.com>
Date: Wed, 11 Dec 2019 20:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576074210-52834-7-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: OuwC4UVpN_Cc01hJtnT7Pw-1
X-Mimecast-Spam-Score: 0
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
X-List-Received-Date: Wed, 11 Dec 2019 19:32:25 -0000

On 11/12/2019 15.23, Paolo Bonzini wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> We have a setenv() wrapper in os-win32.c that no one is actually using.
> Drop it and change to g_setenv() uniformly.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/sysemu/os-win32.h        |  2 --
>  os-win32.c                       | 22 ----------------------
>  tests/libqtest.c                 |  2 +-
>  tests/test-crypto-tlscredsx509.c |  2 +-
>  tests/test-crypto-tlssession.c   |  2 +-
>  tests/test-io-channel-tls.c      |  2 +-
>  tests/test-vmstate.c             |  2 +-
>  ui/sdl2.c                        |  2 +-
>  8 files changed, 6 insertions(+), 30 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


