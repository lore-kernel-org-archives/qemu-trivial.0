Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjo1q-0005aa-Hd
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 09:45:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bjo1k-0005Wp-EZ
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 09:45:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bjo1e-0007PW-QB
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 09:45:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1bjo1V-0007Bc-0p; Tue, 13 Sep 2016 09:45:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9090A9E637;
	Tue, 13 Sep 2016 13:45:16 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8DDjFIJ007273; Tue, 13 Sep 2016 09:45:16 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id A1D3280970; Tue, 13 Sep 2016 15:45:14 +0200 (CEST)
Message-ID: <1473774314.11547.28.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 13 Sep 2016 15:45:14 +0200
In-Reply-To: <65417ad4-e8ae-ac2e-09d2-d010373757cb@redhat.com>
References: <1470900060-25821-1-git-send-email-thuth@redhat.com>
	<1471001434.22974.30.camel@redhat.com>
	<65417ad4-e8ae-ac2e-09d2-d010373757cb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 13 Sep 2016 13:45:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/console: Fix non-working
 backspace key in monitor of gtk UI
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
X-List-Received-Date: Tue, 13 Sep 2016 13:45:37 -0000

On Di, 2016-09-13 at 15:26 +0200, Thomas Huth wrote:
> On 12.08.2016 13:30, Gerd Hoffmann wrote:
> > On Do, 2016-08-11 at 09:21 +0200, Thomas Huth wrote:
> >> +    [Q_KEY_CODE_BACKSPACE] =3D QEMU_KEY_BACKSPACE,
> >=20
> > Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>=20
> Gerd,
>=20
> thanks for your R-b! Could you take this through your ui tree? Or should
> it rather go through -trivial instead?

I was expecting it going through trivial as the qemu-trivial list was in
cc and the patch actually is trivial.  If that doesn't work out I can
pick it up for the next ui pull request.

cheers,
  Gerd


