Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIzuO-0004j9-Jd
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2016 09:26:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aIzuM-0004fP-TW
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 09:26:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aIzuM-0006KU-5c
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 09:26:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aIzuG-0006Jf-1o; Tue, 12 Jan 2016 09:26:44 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A55CF8E257;
	Tue, 12 Jan 2016 14:26:43 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0CEQgVZ026070; Tue, 12 Jan 2016 09:26:43 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 8CCE0816C8; Tue, 12 Jan 2016 15:26:42 +0100 (CET)
Message-ID: <1452608802.29014.27.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Wolfgang Bumiller <w.bumiller@proxmox.com>
Date: Tue, 12 Jan 2016 15:26:42 +0100
In-Reply-To: <1452603159-19782-1-git-send-email-w.bumiller@proxmox.com>
References: <1452603159-19782-1-git-send-email-w.bumiller@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vnc: clear vs->tlscreds after
	unparenting it
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
X-List-Received-Date: Tue, 12 Jan 2016 14:26:51 -0000

On Di, 2016-01-12 at 13:52 +0100, Wolfgang Bumiller wrote:
> This pointer should be cleared in vnc_display_close()
> otherwise a use-after-free can happen when when using the
> old style 'x509' and 'tls' options rather than a persistent
> tls-creds -object, by issuing monitor commands to change
> the vnc server like so:
>=20
> Start with: -vnc unix:test.socket,x509,tls
> Then use the following monitor command:
>   change vnc unix:test.socket
>=20
> After this the pointer is still set but invalid and a crash
> can be triggered for instance by issuing the same command a
> second time which will try to object_unparent() the same
> pointer again.

Added to patch queue.

thanks,
  Gerd


