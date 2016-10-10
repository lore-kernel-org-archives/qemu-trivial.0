Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btV42-0000BH-UY
	for mharc-qemu-trivial@gnu.org; Mon, 10 Oct 2016 03:31:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1btV41-00009W-Cr
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 03:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1btV3z-0003pX-Dy
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 03:31:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59894)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1btV3t-0003md-A2; Mon, 10 Oct 2016 03:31:49 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C30BC63E2B;
	Mon, 10 Oct 2016 07:31:47 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9A7Vk7r030234; Mon, 10 Oct 2016 03:31:47 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 0B829808FB; Mon, 10 Oct 2016 09:31:46 +0200 (CEST)
Message-ID: <1476084705.13132.26.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akanksha Srivastava <akanksha.dlf@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 10 Oct 2016 09:31:45 +0200
In-Reply-To: <1475973519-9591-1-git-send-email-akanksha.dlf@gmail.com>
References: <1475973519-9591-1-git-send-email-akanksha.dlf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 10 Oct 2016 07:31:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] usb: Change *_exitfn return type from
 int to void
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
X-List-Received-Date: Mon, 10 Oct 2016 07:31:58 -0000

  Hi,

> -    cc->exitfn =3D passthru_exitfn;
> +    cc->exitfn =3D NULL;

cc struct is zero-initialized, so setting to NULL is not needed.
You can just drop the line instead.

cheers,
  Gerd


