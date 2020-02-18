Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zlJ-000636-GL
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 05:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zlG-0005wi-DM
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:05:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zlF-0000ut-Aw
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:05:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20901
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zlF-0000uB-5p
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582020348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fA3qA3hN2cAGYJmN+23/u+eYsRYv732LFFW/O7nLGA=;
 b=S2kXHtmATwfmQv0zzY3IjIYuH8duhex7C1Ih6Q/b9DC2TJKudPA3SccNzii2lVcFPi4Xf4
 vhboeY/P64SUWZC5TVUnww0b9opDIQvBRGHoO7+qij7r2fhpCqMJRvGVgx6fb6VUUvY5v8
 v+znHJyf4m7irqs9T8KI2pmp3VyjEco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-31IcOHKSPqGEBO0qrYQR9g-1; Tue, 18 Feb 2020 05:05:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79B2477;
 Tue, 18 Feb 2020 10:05:44 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29CDF8CCC5;
 Tue, 18 Feb 2020 10:05:22 +0000 (UTC)
Date: Tue, 18 Feb 2020 10:05:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
Subject: Re: [PATCH RESEND 12/13] tests/qtest/libqos/qgraph: Remove
 superfluous semicolons
Message-ID: <20200218100519.GO3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-13-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-13-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 31IcOHKSPqGEBO0qrYQR9g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Tue, 18 Feb 2020 10:05:51 -0000

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: fc281c80202
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
> ---
>  tests/qtest/libqos/qgraph.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
> index 7a7ae2a19e..ca01de0743 100644
> --- a/tests/qtest/libqos/qgraph.c
> +++ b/tests/qtest/libqos/qgraph.c
> @@ -474,7 +474,7 @@ QOSEdgeType qos_graph_edge_get_type(QOSGraphEdge *edg=
e)
>      if (!edge) {
>          return -1;
>      }
> -    return edge->type;;
> +    return edge->type;
>  }
> =20
>  char *qos_graph_edge_get_dest(QOSGraphEdge *edge)
> @@ -590,7 +590,7 @@ void qos_add_test(const char *name, const char *inter=
face,
>                    QOSTestFunc test_func, QOSGraphTestOptions *opts)
>  {
>      QOSGraphNode *node;
> -    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);=
;
> +    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);
>      QOSGraphTestOptions def_opts =3D { };
> =20
>      if (!opts) {
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


