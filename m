Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBdjy-0005d4-6y
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 08:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jBdjv-0005Yd-Ah
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:12:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1jBdjt-0005ik-25
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:12:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21748
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1jBdjs-0005ga-TV
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 08:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583842320;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzC93OPPr1WY7OjgIekilNVM+YLGWNqOdOR7/NdCoAo=;
 b=i8StdWQFhRAIuYfhvtQxjJBkTZr9HBzAP1Dy5QOLYC8O/3X42luKgloG6z0aqXpyTvYX6D
 t8jFkAqt3hJzpdonJ5r38GG8RPNV1wqH41Z7kVgngBtdCXAMjjRg5Bx9i4igBTlS98Yrst
 4MIcMR0wYbxkOPZMoy8dxFw4nLih8OQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-phlM-FQZMeKHXN36KeSXYg-1; Tue, 10 Mar 2020 08:11:56 -0400
X-MC-Unique: phlM-FQZMeKHXN36KeSXYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C791005509;
 Tue, 10 Mar 2020 12:11:53 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E161001B3F;
 Tue, 10 Mar 2020 12:11:37 +0000 (UTC)
Date: Tue, 10 Mar 2020 12:11:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Helge Deller <deller@gmx.de>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PULL 00/33] Trivial branch patches
Message-ID: <20200310121134.GG3234052@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
 <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
 <20200310114548.GA6926@linux.fritz.box>
 <ced636a7-dbda-9247-5dd7-37e8c2ccabce@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ced636a7-dbda-9247-5dd7-37e8c2ccabce@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Tue, 10 Mar 2020 12:12:04 -0000

On Tue, Mar 10, 2020 at 01:00:12PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> On 3/10/20 12:45 PM, Kevin Wolf wrote:
> > Am 10.03.2020 um 09:02 hat Laurent Vivier geschrieben:
> > > Le 09/03/2020 =C3=A0 20:30, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=
=C2=A0:
> > > > On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
> > > > > On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
> > > > > > The following changes since commit
> > > > > > 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
> > > > > >=20
> > > > > >  =C2=A0=C2=A0 Merge remote-tracking branch 'remotes/mst/tags/fo=
r_upstream' into
> > > > > > staging (2020-03-09 10:32:53 +0000)
> > > > > >=20
> > > > > > are available in the Git repository at:
> > > > > >=20
> > > > > >  =C2=A0=C2=A0 git://github.com/vivier/qemu.git tags/trivial-bra=
nch-pull-request
> > > > > >=20
> > > > > > for you to fetch changes up to 916c92503bd5348a33e561db600d8894=
bde636bb:
> > > > > >=20
> > > > > >  =C2=A0=C2=A0 monitor/hmp-cmds: Remove redundant statement in
> > > > > > hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
> > > > >=20
> > > > >=20
> > > > > Could you avoid CC everyone involved on the whole PULL req?
> > > > > I was involved in a patch or two and don't really need to see
> > > > > the whole series. Just the cover and the relevant patches
> > > > > would be enough - if I do want it there's always lore.
> > > >=20
> > > > I suppose Laurent used git-publish, which has this limitation.
> > > >=20
> > >=20
> > > Yes, I use git publish and CC are automatically added.
> > >=20
> > > Philippe, you told me some time ago you have a patch to fix this
> > > behaviour and only CC people on a patch base. Is it available?
>=20
> I guess you mean https://github.com/philmd/git-publish/commit/5bab6e2cc77=
, I
> haven't improved it but plan to spend time on it during my next holidays.
>=20
> > Actually, I don't think it's even necessary to CC anyone at all (except
> > the relevant lists) for pull requests. These patches were already
> > reviewed.
>=20
> Well as a contributor I find useful to get notified when patches are merg=
ed.

Yeah, I tend to agree with that - it is good to know when something is
merged, more so if you are an infrequent contributor to an area of code
or QEMU in general.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


