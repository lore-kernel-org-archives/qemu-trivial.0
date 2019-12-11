Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if38X-0004Hy-59
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 09:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1if38U-0004Dh-64
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:38:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1if38T-0003Vj-48
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:38:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35167
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1if38T-0003V6-0Q
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576075120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=klIMuesSgq04mPhGp+M/2xcKOkZFDyu9vngF4a6oHo8=;
 b=XcTZ/zsd04TkaWSfTQC79DPWBwDNp3hPoEeb8XNr4Z3x7GtNqChLGmpdIa50BZNwYGZ9aQ
 OmFX7gcbXw/gkTKUStkNy3EhV+o6H3PjZmU3B04lEFP4rycNWI+SFIuzu9Pov15US3JrHe
 2+/FdjxiEzoBlrF1MqBiUOpdCaSbt7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-_TU9B3loMNajdbDEtRDpgw-1; Wed, 11 Dec 2019 09:38:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C3F68C5091;
 Wed, 11 Dec 2019 14:38:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-11.ams2.redhat.com [10.36.117.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 681F35C1BB;
 Wed, 11 Dec 2019 14:38:32 +0000 (UTC)
Subject: Re: [PATCH] build-sys: build vhost-user-gpu only if CONFIG_TOOLS
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <1576074210-52834-1-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <de6f0a48-568f-7789-5b03-469527069390@redhat.com>
Date: Wed, 11 Dec 2019 15:38:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576074210-52834-1-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: _TU9B3loMNajdbDEtRDpgw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Wed, 11 Dec 2019 14:38:44 -0000

On 11/12/2019 15.23, Paolo Bonzini wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> vhost-user-gpu is always built and installed, but it is not part of the e=
mulator
> proper.  Cut it if --disable-tools is specified.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 53823c2..8d921c6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -321,14 +321,10 @@ HELPERS-y =3D
> =20
>  HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =3D qemu-bridge-h=
elper$(EXESUF)
> =20
> -ifdef CONFIG_LINUX
> -ifdef CONFIG_VIRGL
> -ifdef CONFIG_GBM
> +ifeq ($(CONFIG_LINUX)$(CONFIG_VIRGL)$(CONFIG_GBM)$(CONFIG_TOOLS),yyyy)
>  HELPERS-y +=3D vhost-user-gpu$(EXESUF)
>  vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-gpu.json
>  endif
> -endif
> -endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


