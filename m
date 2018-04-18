Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8oKM-0001qI-Dv
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 10:44:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f8oKK-0001ny-4S
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 10:44:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f8oKJ-00052P-6G
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 10:44:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36656 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f8oKD-0004ys-R9; Wed, 18 Apr 2018 10:44:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67088FBE63;
	Wed, 18 Apr 2018 14:44:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 677AF1C723;
	Wed, 18 Apr 2018 14:44:35 +0000 (UTC)
Date: Wed, 18 Apr 2018 15:44:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Olaf Hering <olaf@aepfle.de>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Fam Zheng <famz@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418144433.GV27579@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 18 Apr 2018 14:44:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 18 Apr 2018 14:44:45 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Wed, 18 Apr 2018 14:44:53 -0000

On Wed, Apr 18, 2018 at 02:29:47PM +0100, Peter Maydell wrote:
> On 18 April 2018 at 13:47, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> > On Wed, Apr 18, 2018 at 02:38:37PM +0200, Olaf Hering wrote:
> >> Since usage of g_realloc_n was introduced, glib-2.22 can not be used=
 anymore.
> >> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
> >
> > Normally we expect ./include/glib-compat.h to be changed in this scen=
ario
> > to add compat for the missing symbol.
> >
> > IIRC, one of Peters desired build targets required 2.22, but I guess =
we
> > missed this bug because that platform would not enable vfio functiona=
lity ?
>=20
> Yes, my OSX build system is on glib 2.22. It's using 'fink' for 3rd
> party library installations, and they somehow seem to have got stuck
> on 2.22. Looking at the website the project seems to have basically
> stagnated, and I guess I need to move to homebrew at some point
> (likely after we get 2.12 out the door). But for the moment this
> patch would break my pullrequest testing builds.

Yeah that sounds reasonable as it would also align your build env with
what we are testing via travis too.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

