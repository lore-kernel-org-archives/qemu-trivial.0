Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJd3Y-0004jO-0Z
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jan 2016 03:14:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aJd3V-0004hD-Vr
	for qemu-trivial@nongnu.org; Thu, 14 Jan 2016 03:14:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aJd3V-0003cs-4x
	for qemu-trivial@nongnu.org; Thu, 14 Jan 2016 03:14:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aJd3M-0003YH-P9; Thu, 14 Jan 2016 03:14:44 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 36D5142E5D8;
	Thu, 14 Jan 2016 08:14:44 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0E8Egob017065; Thu, 14 Jan 2016 03:14:43 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id B03D181DC2; Thu, 14 Jan 2016 09:14:41 +0100 (CET)
Message-ID: <1452759281.19513.0.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Wolfgang Bumiller <w.bumiller@proxmox.com>
Date: Thu, 14 Jan 2016 09:14:41 +0100
In-Reply-To: <1452681360-29239-1-git-send-email-w.bumiller@proxmox.com>
References: <1452681360-29239-1-git-send-email-w.bumiller@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vnc: fix tls-creds error message
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
X-List-Received-Date: Thu, 14 Jan 2016 08:14:54 -0000

On Mi, 2016-01-13 at 11:36 +0100, Wolfgang Bumiller wrote:
> The parameter is called 'tls-creds', 'credid' is just the
> variable name in the code.

Added to patch queue.

thanks,
  Gerd


