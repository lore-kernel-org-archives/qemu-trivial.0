Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhZsh-0000P0-Jv
	for mharc-qemu-trivial@gnu.org; Fri, 24 Oct 2014 04:05:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XhZsZ-0000Fi-MM
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 04:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XhZsT-0002Q4-LV
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 04:05:47 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54266 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1XhZs3-0002Mx-9i; Fri, 24 Oct 2014 04:05:15 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 010C7ACC4;
	Fri, 24 Oct 2014 08:05:13 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
From: Alexander Graf <agraf@suse.de>
X-Mailer: iPhone Mail (12A405)
In-Reply-To: <544A046D.4090204@msgid.tls.msk.ru>
Date: Fri, 24 Oct 2014 10:05:12 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <2DF5C850-3F54-4592-AFE6-C5AC16033F06@suse.de>
References: <543BE352.3080609@gmail.com> <543BE616.1000707@suse.de>
	<544A046D.4090204@msgid.tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: Chen Gang <gang.chen.5i5j@gmail.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: kvm: Fix memory overflow
	issue about strncat()
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
X-List-Received-Date: Fri, 24 Oct 2014 08:05:53 -0000




> Am 24.10.2014 um 09:49 schrieb Michael Tokarev <mjt@tls.msk.ru>:
>=20
>> On 10/13/2014 06:47 PM, Alexander Graf wrote:
>>> On 13.10.14 16:36, Chen Gang wrote:
>>> strncat() will append additional '\0' to destination buffer, so need
>>> additional 1 byte for it, or may cause memory overflow, just like other
>>> area within QEMU have done.
>>>=20
>>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>>=20
>> I agree with this patch. However, the code is pretty ugly - I'm sure it
>> must've been me who wrote it :).
>>=20
>> Could you please instead rewrite it to use g_strdup_printf() rather than
>> strncat()s? That way we resolve all string pitfalls automatically - and
>> this code is not the fast path, so doing an extra memory allocation is ok=
.
>=20
> I'd just use snprintf() like this:
>=20
> diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
> index 9c23c6b..5eaa36c 100644
> --- a/target-ppc/kvm.c
> +++ b/target-ppc/kvm.c
> @@ -1794,8 +1794,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *p=
ropname)
>         return -1;
>     }
>=20
> -    strncat(buf, "/", sizeof(buf) - strlen(buf));
> -    strncat(buf, propname, sizeof(buf) - strlen(buf));
> +    snprintf(buf + strlen(buf), sizeof(buf) - strlen(buf), "/%s", propnam=
e);
>=20
>     f =3D fopen(buf, "rb");
>     if (!f) {
>=20
> the buffer is of size PATH_MAX, and we're looking at /proc filesystem wher=
e
> names should be rather short so we're extremly unlikely to hit this prob i=
n
> practice, there's no need to dynamically allocate a buffer for this stuff.=


I've already applied the fix to ppc-next.

>=20
> (Or alternatively there's asprintf(), but still I think it is overkill).

That one isn't portable iirc.

>=20
> I can apply the above if everyone agrees.

No worries, it's all over already ;).

Alex


