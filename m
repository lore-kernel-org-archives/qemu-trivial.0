Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQs5q-0007Y8-Hy
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 01:38:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YQs5n-0007V6-P1
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 01:38:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YQs5m-0005d4-Up
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 01:38:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YQs5h-0005cO-0V; Thu, 26 Feb 2015 01:38:33 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1Q6cSfW009542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 26 Feb 2015 01:38:28 -0500
Received: from [10.36.116.36] (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1Q6cQTH002830; Thu, 26 Feb 2015 01:38:27 -0500
Message-ID: <1424932706.23631.47.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jorge Acereda =?ISO-8859-1?Q?Maci=E1?= <jacereda@gmail.com>
Date: Thu, 26 Feb 2015 07:38:26 +0100
In-Reply-To: <8A3EBB15-2138-4AC6-92B7-B0DA9825225A@gmail.com>
References: <8A3EBB15-2138-4AC6-92B7-B0DA9825225A@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	t1Q6cSfW009542
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, aliguori@amazon.com
Subject: Re: [Qemu-trivial] [PATCH v2] Fix crash when connecting to VNC
	through websocket
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
X-List-Received-Date: Thu, 26 Feb 2015 06:38:40 -0000

On Do, 2015-02-26 at 00:21 +0100, Jorge Acereda Maci=C3=A1 wrote:
> Connecting to VNC through websocket crashes in vnc_flush() when trying
> to acquire a mutex that hasn't been initialized (vnc_init_state(vs)
> hasn't been called at this point).

Patch updated.

thanks,
  Gerd



