Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bBITk-0008NS-Dy
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jun 2016 05:11:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bBITe-0008Ho-M8
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 05:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bBITZ-0003ws-Kj
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 05:11:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1bBITN-0003w8-DE; Fri, 10 Jun 2016 05:11:25 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA58FC05B1DE;
	Fri, 10 Jun 2016 09:11:24 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-22.ams2.redhat.com
	[10.36.116.22])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5A9BOvg023832; Fri, 10 Jun 2016 05:11:24 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 49E1A81D1B; Fri, 10 Jun 2016 11:11:23 +0200 (CEST)
Message-ID: <1465549883.2920.3.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Fri, 10 Jun 2016 11:11:23 +0200
In-Reply-To: <1465382576-25552-1-git-send-email-berrange@redhat.com>
References: <1465382576-25552-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 10 Jun 2016 09:11:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] ui: fix regression in printing VNC
 host/port on startup
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
X-List-Received-Date: Fri, 10 Jun 2016 09:11:47 -0000

On Mi, 2016-06-08 at 11:42 +0100, Daniel P. Berrange wrote:
> If VNC is chosen as the compile time default display backend,
> QEMU will print the host/port it listens on at startup.
> Previously this would look like
>=20
>   VNC server running on '::1:5900'
>=20
> but in 04d2529da27db512dcbd5e99d0e26d333f16efcc the ':' was
> accidentally replaced with a ';'. This the ':' back.

Added to ui queue.

thanks,
  Gerd


