Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si3jq-0002xG-Hs
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 09:17:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Si3jn-0002wU-BV
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 09:17:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Si3ji-0005jE-NU
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 09:17:22 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:36081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Si3ji-0005il-Go
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 09:17:18 -0400
Received: by bkwj10 with SMTP id j10so1650941bkw.4
	for <qemu-trivial@nongnu.org>; Fri, 22 Jun 2012 06:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=u2x8agnN0IGYmL8iOd3t8fEw8fuY71UlWYCIsAc5ThE=;
	b=RR4DbgqbNHDxF5pDD0W7BoEcu2gEjb27/wqy0g7YMYJF0Mjxd9iVkKsk+Gy4hSwkby
	+eKZKq1HuEuqRf22mKVuH6iTBaIeEltBhhl5t00ehgaLO/ymnH6Rd/sbiekVvk/07Tp5
	ssf9BhSPNau+XZ0tzz3MLs6L68WyDWCxy+qJ5m0QGF/V+3sZUzbcCqtj3DaFFU0kjkSr
	Gw6lu7luxt4wifi5M/0rgFAcSMibZrWOHmy5T3DOEcrda3I3Y4z41O0JUuLP5YQYi4XR
	O17OGlsyDORh16SWeD9jt/D+SEJAwnO/UYeh4heXIPTp3Loegp6uT5i0jzRMfczRz2HC
	alHg==
MIME-Version: 1.0
Received: by 10.204.148.74 with SMTP id o10mr751376bkv.111.1340371035599; Fri,
	22 Jun 2012 06:17:15 -0700 (PDT)
Received: by 10.204.119.199 with HTTP; Fri, 22 Jun 2012 06:17:15 -0700 (PDT)
In-Reply-To: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
References: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
Date: Fri, 22 Jun 2012 23:17:15 +1000
Message-ID: <CAEgOgz4ftvGuqoDP6GK+oX7AVKwxxLOqfVEmGa1nm1=7LJpKOw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
To: qemu-devel@nongnu.org, edgar.iglesias@gmail.com, qemu-trivial@nongnu.org, 
	jyoung5@us.ibm.com, hollisb@us.ibm.com,
	Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkI/R3PD8Wjl4K8Ibc1s13U51R3Luj9qaONMGl1BVj2GwhInGQBpmoakUkFYFKbemRF2faq
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: peter.crosthwaite@petalogix.com, john.williams@petalogix.com
Subject: Re: [Qemu-trivial] [PATCH v1] device_tree: load_device_tree():
	Allow NULL sizep
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
X-List-Received-Date: Fri, 22 Jun 2012 13:17:24 -0000

CC device-tree.c original contributors. (Jerome Young and Hollis Blanchard)=
.

I cant find a maintainer for device-tree, and Stefan wants a review.
This patch seem ok?

On Thu, Jun 21, 2012 at 2:51 PM, Peter A. G. Crosthwaite
<peter.crosthwaite@petalogix.com> wrote:
> The sizep arg is populated with the size of the loaded device tree. Since=
 this
> is one of those informational "please populate" type arguments it should =
be
> optional. Guarded writes to *sizep against NULL accordingly.
>
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> ---
> =A0device_tree.c | =A0 =A08 ++++++--
> =A01 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/device_tree.c b/device_tree.c
> index 86a694c..0ed0256 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -32,7 +32,9 @@ void *load_device_tree(const char *filename_path, int *=
sizep)
> =A0 =A0 int ret;
> =A0 =A0 void *fdt =3D NULL;
>
> - =A0 =A0*sizep =3D 0;
> + =A0 =A0if (sizep) {
> + =A0 =A0 =A0 =A0*sizep =3D 0;
> + =A0 =A0}
> =A0 =A0 dt_size =3D get_image_size(filename_path);
> =A0 =A0 if (dt_size < 0) {
> =A0 =A0 =A0 =A0 printf("Unable to get size of device tree file '%s'\n",
> @@ -65,7 +67,9 @@ void *load_device_tree(const char *filename_path, int *=
sizep)
> =A0 =A0 =A0 =A0 =A0 =A0 filename_path);
> =A0 =A0 =A0 =A0 goto fail;
> =A0 =A0 }
> - =A0 =A0*sizep =3D dt_size;
> + =A0 =A0if (sizep) {
> + =A0 =A0 =A0 =A0*sizep =3D dt_size;
> + =A0 =A0}
> =A0 =A0 return fdt;
>
> =A0fail:
> --
> 1.7.3.2
>

