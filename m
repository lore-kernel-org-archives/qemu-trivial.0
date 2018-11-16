Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNbLI-0001Aq-9q
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2018 05:27:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gNbLG-00019S-1q
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 05:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gNbLF-0006mv-5X
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 05:27:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gNbLA-0006ft-5L; Fri, 16 Nov 2018 05:27:08 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7BD1C0050BF;
	Fri, 16 Nov 2018 10:27:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5350600D6;
	Fri, 16 Nov 2018 10:27:03 +0000 (UTC)
Date: Fri, 16 Nov 2018 10:26:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	armbru@redhat.com, xiezhide@huawei.com
Message-ID: <20181116102659.GA28597@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20181115225052.1322639-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181115225052.1322639-1-eblake@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 16 Nov 2018 10:27:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi: Reduce Makefile
 boilerplate
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
X-List-Received-Date: Fri, 16 Nov 2018 10:27:15 -0000

On Thu, Nov 15, 2018 at 04:50:52PM -0600, Eric Blake wrote:
> Adding a new qapi module requires some rather tedious repetition to
> wire it into Makefile and Makefile.objs. Add some indirection by
> taking advantage of GNU Make string processing to expand a list
> of module names into all the required artifacts, so that future
> additions of a new module need only touch the list of module names.
>=20
> The list has to live in Makefile.objs, due to the way that
> unnest-vars slirps in that file without remembering any definition
> of $(QAPI_MODULES) from Makefile.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> ---
> v2: also condense Makefile.objs, prefer $(FOO:%=3Da%b) over
> %(patsubst %,a%b,$(foo))
> ---
>  Makefile      | 192 ++++++--------------------------------------------
>  Makefile.objs |  75 ++------------------
>  2 files changed, 30 insertions(+), 237 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Though I'd also suggest .gitignore is updated to use wildcards
to exclude the generated files.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

