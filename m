Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXPzB-0002eY-OC
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 02:58:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXPz4-0002K2-N5
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 02:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXPyy-0007TN-J4
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 02:58:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXPym-0007RO-0O; Tue, 08 Apr 2014 02:57:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 12F6A40CC9;
	Tue,  8 Apr 2014 10:57:55 +0400 (MSK)
Message-ID: <53439DF3.9060608@msgid.tls.msk.ru>
Date: Tue, 08 Apr 2014 10:57:55 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1396895303-5356-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1396895303-5356-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Anthony Liguori <aliguori@amazon.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] misc: Use cpu_physical_memory_read and
 cpu_physical_memory_write
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
X-List-Received-Date: Tue, 08 Apr 2014 06:58:21 -0000

07.04.2014 22:28, Stefan Weil =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> These functions don't need type casts (as does cpu_physical_memory_rw)
> and also make the code better readable.

This will wait 2.0.  While technically it is quite simple, but we're
too close to release now.

Thanks,

/mjt

