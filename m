Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRcV1-0000Gc-KZ
	for mharc-qemu-trivial@gnu.org; Fri, 05 Feb 2016 04:16:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aRcUv-00009V-Fd
	for qemu-trivial@nongnu.org; Fri, 05 Feb 2016 04:16:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aRcUu-0005os-Gt
	for qemu-trivial@nongnu.org; Fri, 05 Feb 2016 04:16:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aRcUp-0005oP-VJ; Fri, 05 Feb 2016 04:16:08 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id CDC76C076618;
	Fri,  5 Feb 2016 09:16:06 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u159G5Tv016194; Fri, 5 Feb 2016 04:16:06 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id E745A81C87; Fri,  5 Feb 2016 10:16:04 +0100 (CET)
Message-ID: <1454663764.5539.17.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Serpell <daniel.serpell@gmail.com>
Date: Fri, 05 Feb 2016 10:16:04 +0100
In-Reply-To: <1454612620-7819-2-git-send-email-daniel.serpell@gmail.com>
References: <1454612620-7819-1-git-send-email-daniel.serpell@gmail.com>
	<1454612620-7819-2-git-send-email-daniel.serpell@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Adds keycode 86 to the
 hid_usage_keys translation table.
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
X-List-Received-Date: Fri, 05 Feb 2016 09:16:17 -0000

On Do, 2016-02-04 at 16:03 -0300, Daniel Serpell wrote:
> This key is present in international keyboards, between left shift and
> the 'Z' key, ant is described in the HID usage tables as "Keyboard
> Non-US \ and |": http://www.usb.org/developers/hidpage/Hut1_12v2.pdf
>=20
> This patch fixes the usb-kbd devices.
>=20
> Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

