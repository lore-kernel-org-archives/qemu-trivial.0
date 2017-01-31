Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYTDa-0005Jc-Fc
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 02:51:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cYTDY-0005IY-Cf
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 02:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cYTDX-0005rS-JN
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 02:51:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37484)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1cYTDT-0005qg-5C; Tue, 31 Jan 2017 02:51:03 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06A4F4621C;
	Tue, 31 Jan 2017 07:51:03 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 993411CAD37;
	Tue, 31 Jan 2017 07:51:02 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 35B6D8080D; Tue, 31 Jan 2017 08:51:00 +0100 (CET)
Message-ID: <1485849060.23903.15.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ziyue Yang <skiver.cloud.yzy@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Anthony Liguori
	<aliguori@us.ibm.com>, Thomas Huth <thuth@redhat.com>, Ziyue Yang
	<yzylivezh@hotmail.com>
Date: Tue, 31 Jan 2017 08:51:00 +0100
In-Reply-To: <1485826335-15686-1-git-send-email-skiver.cloud.yzy@gmail.com>
References: <1485826335-15686-1-git-send-email-skiver.cloud.yzy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 31 Jan 2017 07:51:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] ui/gtk.c: add ctrl-alt-= support for
 zoom in acceleration
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
X-List-Received-Date: Tue, 31 Jan 2017 07:51:09 -0000

On Di, 2017-01-31 at 09:32 +0800, Ziyue Yang wrote:
> From: Ziyue Yang <yzylivezh@hotmail.com>
>=20
> Solving wishlist item at
> https://bugs.launchpad.net/qemu/+bug/1656710
> by accepting Ctrl-Alt-=3D as an additional zoom-in acceleration.
>=20
> Using gtk_accel_group_connect to support multiple accelerations
> triggering a single menu item since that gtk_accel_map_add_entry
> seems to support only one acceleration. A wrapper function
> gd_accel_zoom_in is added to support gtk_accel_group_connect's
> callback activities.
>=20
> Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>

Added to UI queue.

thanks,
  Gerd

