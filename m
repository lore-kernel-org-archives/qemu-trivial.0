Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YPnWp-0001yA-2f
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 02:34:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YPnWm-0001vj-AD
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 02:34:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YPnWl-0004vl-IB
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 02:34:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YPnWc-0004uu-HS; Mon, 23 Feb 2015 02:33:54 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1N7XpWd013743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 23 Feb 2015 02:33:51 -0500
Received: from [10.36.116.38] (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1N7XnGe001852; Mon, 23 Feb 2015 02:33:50 -0500
Message-ID: <1424676829.23631.11.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jorge Acereda =?ISO-8859-1?Q?Maci=E1?= <jacereda@gmail.com>
Date: Mon, 23 Feb 2015 08:33:49 +0100
In-Reply-To: <4EE0ACB8-AA07-4A62-92D1-AF866DA241FB@gmail.com>
References: <4EE0ACB8-AA07-4A62-92D1-AF866DA241FB@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	t1N7XpWd013743
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, aliguori@amazon.com
Subject: Re: [Qemu-trivial] [PATCH] Fix crash when connecting to VNC through
	websocket
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
X-List-Received-Date: Mon, 23 Feb 2015 07:34:05 -0000

On So, 2015-02-22 at 22:58 +0100, Jorge Acereda Maci=C3=A1 wrote:
> Connecting to VNC through websocket crashes in vnc_flush() when trying
> to acquire a mutex that hasn't been initialized (vnc_init_state(vs)
> hasn't been called at this point).

Added to vnc queue.

thanks,
  Gerd



