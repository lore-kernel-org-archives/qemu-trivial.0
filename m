Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RzPI9-0002ia-Ox
	for mharc-qemu-trivial@gnu.org; Mon, 20 Feb 2012 04:12:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RzPI1-0002F6-RY
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2012 04:12:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RzPHx-0003we-QE
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2012 04:12:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:22331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1RzPHo-0003vN-Mt; Mon, 20 Feb 2012 04:11:56 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1K9BtbZ021030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 20 Feb 2012 04:11:55 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-24.ams2.redhat.com
	[10.36.112.24])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1K9Bq7v006699; Mon, 20 Feb 2012 04:11:52 -0500
Message-ID: <4F420E57.9090804@redhat.com>
Date: Mon, 20 Feb 2012 10:11:51 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1329695347-9289-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1329695347-9289-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q1K9BtbZ021030
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [PATCH] qom: Fix object_initialize_with_type()
	assertion
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2012 09:12:15 -0000

On 02/20/2012 12:49 AM, Andreas F=C3=A4rber wrote:
> Assert the object is at least sizeof(Object), not sizeof(ObjectClass).
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  qom/object.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/qom/object.c b/qom/object.c
> index b1ead15..dbfd6a4 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -262,7 +262,7 @@ void object_initialize_with_type(void *data, TypeIm=
pl *type)
>      Object *obj =3D data;
> =20
>      g_assert(type !=3D NULL);
> -    g_assert(type->instance_size >=3D sizeof(ObjectClass));
> +    g_assert(type->instance_size >=3D sizeof(Object));
> =20
>      type_class_init(type);
>      g_assert(type->abstract =3D=3D false);

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

