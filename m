Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDOnx-0000O1-Nk
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 05:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kDOnv-0000I0-Ni; Wed, 02 Sep 2020 05:11:43 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kDOnt-0001uR-N4; Wed, 02 Sep 2020 05:11:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 0A6325D1695F;
 Wed,  2 Sep 2020 11:11:14 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 2 Sep 2020
 11:11:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004413dc447-e02e-489b-88f8-579818e6ef04,
 AA3809B24A0F88596FE87CA7447536A9393A4537) smtp.auth=groug@kaod.org
Date: Wed, 2 Sep 2020 11:11:12 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
CC: <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Corey Minyard <minyard@acm.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, <qemu-trivial@nongnu.org>, <qemu-ppc@nongnu.org>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, "Richard Henderson"
 <rth@twiddle.net>
Subject: Re: [PATCH 5/5] util/qsp: Do not declare local variable only used
 for assertion
Message-ID: <20200902111112.251568b8@bahia.lan>
In-Reply-To: <20200902080801.160652-6-philmd@redhat.com>
References: <20200902080801.160652-1-philmd@redhat.com>
 <20200902080801.160652-6-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5f154def-14d6-494c-8d40-f7f09a8a8ede
X-Ovh-Tracer-Id: 7039407695747062264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheprhhthhesthifihguughlvgdrnhgvth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 04:59:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 02 Sep 2020 09:11:44 -0000

On Wed,  2 Sep 2020 10:08:01 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> This variable is used once in an assertion. Remove single
> declaration and access directly in the assert().
>=20
> See in "qemu/osdep.h":
>=20
>  *                                  [...] disable assertion is not
>  * supported upstream so the risk is all yours.  Meanwhile, please
>  * submit patches to remove any side-effects inside an assertion, or
>  * fixing error handling that should use Error instead of assert.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  util/qsp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/util/qsp.c b/util/qsp.c
> index 7d5147f1b20..1db044ecedd 100644
> --- a/util/qsp.c
> +++ b/util/qsp.c
> @@ -560,9 +560,7 @@ static void qsp_iter_diff(void *p, uint32_t hash, voi=
d *htp)
> =20
>      /* No point in reporting an empty entry */
>      if (new->n_acqs =3D=3D 0 && new->ns =3D=3D 0) {
> -        bool removed =3D qht_remove(ht, new, hash);
> -
> -        g_assert(removed);
> +        g_assert(qht_remove(ht, new, hash));

Urgh... this is doing exactly the opposite of the "qemu/osdep.h"
recommandations above. We still want to remove new from the
hash table even if QEMU was built without assertions.

>          g_free(new);
>      }
>  }


