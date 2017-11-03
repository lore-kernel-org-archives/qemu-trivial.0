Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAPxR-0004Gl-Uy
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 20:35:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eAPxP-0004FU-ON
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 20:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eAPxO-0001pO-PD
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 20:35:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eAPxK-0001mb-8g; Thu, 02 Nov 2017 20:35:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E9DD356C1;
	Fri,  3 Nov 2017 00:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3E9DD356C1
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-17.gru2.redhat.com [10.97.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2691D5D757;
	Fri,  3 Nov 2017 00:35:21 +0000 (UTC)
Date: Fri, 3 Nov 2017 01:35:20 +0100
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, "Emilio G . Cota" <cota@braap.org>,
	Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20171103003520.GF3111@localhost.localdomain>
References: <20171030181459.1951-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20171030181459.1951-1-f4bug@amsat.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 03 Nov 2017 00:35:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [RFC PATCH] vl: only display available
 accelerators
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
X-List-Received-Date: Fri, 03 Nov 2017 00:35:36 -0000

On Mon, Oct 30, 2017 at 03:14:59PM -0300, Philippe Mathieu-Daud=E9 wrote:
> examples configuring with '--enable-kvm --disable-tcg'
>=20
> - before
>=20
>   $ qemu-system-x86_64 -accel help
>   Possible accelerators: kvm, xen, hax, tcg
>=20
>   $ qemu-system-x86_64 -accel tcg
>   qemu-system-x86_64: -machine accel=3Dtcg: No accelerator found
>=20
>   # qemu-system-x86_64 -accel hax
>   qemu-system-x86_64: -machine accel=3Dhax: No accelerator found
>=20
> - after
>=20
>   $ qemu-system-x86_64 -accel help
>   Possible accelerators:
>     xen
>     kvm
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
> since RFC:
>   - use much cleaner object_class_get_list(TYPE_ACCEL, false)
>=20
>  vl.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>=20
> diff --git a/vl.c b/vl.c
> index ec299099ff..0f13641715 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2764,6 +2764,39 @@ static gint machine_class_cmp(gconstpointer a, g=
constpointer b)
>      exit(!name || !is_help_option(name));
>  }
> =20
> +static void accel_list_entry(gpointer data, gpointer user_data)
> +{
> +    ObjectClass *oc =3D data;
> +    const char *typename =3D object_class_get_name(oc);
> +    int len;
> +
> +    if (!qtest_driver() && !g_strcmp0(typename, ACCEL_CLASS_NAME("qtes=
t"))) {
> +        return; /* used by test cases */
> +    }

I would prefer to not hardcode the accel name here.  If you want
qtest to have special behavior, you can add a new field to
AccelClass to implement that.

However, I don't think I agree we should hide qtest from the
user: it is accepted on the command-line, so why should we lie?
Why not add a description field and indicate that qtest is useful
only for testing?

> +
> +    len =3D strlen(typename) - strlen("-" TYPE_ACCEL);

You can use AccelClass::name here.

> +    if (len > 0) {
> +        error_printf("  %.*s\n", len, typename);
> +    }
> +}
> +
> +static void accel_parse(const char *name, QemuOpts *accel_opts)
> +{
> +    const char *optarg =3D qemu_opt_get(accel_opts, "accel");
> +    GSList *list;
> +
> +    if (!is_help_option(optarg)) {
> +        return;
> +    }
> +
> +    list =3D object_class_get_list(TYPE_ACCEL, false);
> +    error_printf("Possible accelerators:\n");
> +    g_slist_foreach(list, accel_list_entry, NULL);
> +    g_slist_free(list);
> +
> +    exit(0);
> +}
> +
>  void qemu_add_exit_notifier(Notifier *notify)
>  {
>      notifier_list_add(&exit_notifiers, notify);
> @@ -3881,11 +3914,7 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_accel:
>                  accel_opts =3D qemu_opts_parse_noisily(qemu_find_opts(=
"accel"),
>                                                       optarg, true);
> -                optarg =3D qemu_opt_get(accel_opts, "accel");
> -                if (!optarg || is_help_option(optarg)) {
> -                    error_printf("Possible accelerators: kvm, xen, hax=
, tcg\n");
> -                    exit(0);
> -                }
> +                accel_parse(optarg, accel_opts);
>                  opts =3D qemu_opts_create(qemu_find_opts("machine"), N=
ULL,
>                                          false, &error_abort);
>                  qemu_opt_set(opts, "accel", optarg, &error_abort);
> --=20
> 2.15.0.rc2
>=20

--=20
Eduardo

