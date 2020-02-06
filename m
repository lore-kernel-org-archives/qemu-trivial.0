Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izeGD-000105-SZ
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 05:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1izeGB-0000wh-IX
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 05:19:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1izeG9-00067h-Nr
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 05:19:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33923
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1izeG9-00060X-IK
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 05:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580984384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=aAqlWyoIpQxTSGvdx3xhKNH2/8zol/m6HDWfLkkbzOY=;
 b=JSdO4fD9jjnpkBCQf5y3oCajno+5jQ+KucqmnXy8BNeZRKRjUaneTQSrflRZqBAdvL4PTi
 JgpU5mcTnQkgwbw1V4Qxz+B/EDUAoD+Yeq+DkldhiS32CleUnFIr1Py8W6bYT3VjjUfqck
 d5fNWevgBKPzqDrqsMOANLso7M2MY5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-hRM8m4EcP_CuZd5_wpqIeA-1; Thu, 06 Feb 2020 05:19:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC25F104FB6D;
 Thu,  6 Feb 2020 10:19:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-151.ams2.redhat.com [10.36.116.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EEFA60BEC;
 Thu,  6 Feb 2020 10:19:39 +0000 (UTC)
Subject: Re: [PATCH] tests/plugin: prevent uninitialized warning
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, alex.bennee@linaro.org
Cc: qemu-trivial@nongnu.org, richard.henderson@linaro.org,
 zhang.zhanghailiang@huawei.com
References: <20200206093238.203984-1-kuhn.chenqun@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <85dc652f-1a54-bac4-6ed3-f6e6d6dd08a0@redhat.com>
Date: Thu, 6 Feb 2020 11:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200206093238.203984-1-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: hRM8m4EcP_CuZd5_wpqIeA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Thu, 06 Feb 2020 10:19:48 -0000

On 06/02/2020 10.32, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> According to the glibc function requirements, we need initialise
>  the variable. Otherwise there will be compilation warnings:
>=20
> glib-autocleanups.h:28:3: warning: =E2=80=98out=E2=80=99 may be
> used uninitialized in this function [-Wmaybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  tests/plugin/bb.c   | 2 +-
>  tests/plugin/insn.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
> index f30bea08dc..8b9da23a04 100644
> --- a/tests/plugin/bb.c
> +++ b/tests/plugin/bb.c
> @@ -22,7 +22,7 @@ static bool do_inline;
> =20
>  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  {
> -    g_autofree gchar *out;
> +    g_autofree gchar *out =3D NULL;
>      out =3D g_strdup_printf("bb's: %" PRIu64", insns: %" PRIu64 "\n",
>                            bb_count, insn_count);
>      qemu_plugin_outs(out);
> diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
> index 0a8f5a0000..c83b1c0157 100644
> --- a/tests/plugin/insn.c
> +++ b/tests/plugin/insn.c
> @@ -44,7 +44,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct q=
emu_plugin_tb *tb)
> =20
>  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  {
> -    g_autofree gchar *out;
> +    g_autofree gchar *out =3D NULL;
>      out =3D g_strdup_printf("insns: %" PRIu64 "\n", insn_count);
>      qemu_plugin_outs(out);
>  }

Just a matter of taste, but I think in these simple cases, it would be
nicer to put everything in one line, e.g.:

    g_autofree gchar *out =3D g_strdup_printf("insns: %" PRIu64 "\n",
                                            insn_count);

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>


