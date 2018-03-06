Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etDWT-0004tF-HB
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 09:24:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1etDWR-0004rF-Dy
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 09:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1etDWQ-0001Lh-Ff
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 09:24:55 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51022 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1etDWL-0001J3-Rh; Tue, 06 Mar 2018 09:24:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BD4D84222;
	Tue,  6 Mar 2018 14:24:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 769C41C711;
	Tue,  6 Mar 2018 14:24:42 +0000 (UTC)
Date: Tue, 6 Mar 2018 14:24:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180306142440.GK6163@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180306134402.997-1-berrange@redhat.com>
	<10097c87-9302-5de5-9b63-e76200989ac1@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10097c87-9302-5de5-9b63-e76200989ac1@ilande.co.uk>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 06 Mar 2018 14:24:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 06 Mar 2018 14:24:49 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc,
 ide: remove use of HWADDR_PRIx in trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 14:24:56 -0000

On Tue, Mar 06, 2018 at 02:16:00PM +0000, Mark Cave-Ayland wrote:
> On 06/03/18 13:44, Daniel P. Berrang=C3=A9 wrote:
>=20
> > The trace events all use a uint64_t data type, so should be using the
> > corresponding PRIx64 format, not HWADDR_PRIx which is intended for us=
e
> > with the 'hwaddr' type.
>=20
> Ha okay looks like you beat me to it ;)  I wonder if we can teach
> checkpatch.pl about this...

We should just make tracetool whitelist the data types it permits, and
it could also report on unusual format macros like this - only allow
the standard PRI* ones. That way all build configs would immediately
fail, instead of only the  ust build config

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

