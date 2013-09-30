Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQX2h-0001Bv-DR
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 02:33:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VQX2Z-0001Az-Ap
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 02:33:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VQX2Q-00085Y-GX
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 02:33:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1VQX2Q-00085T-9f; Mon, 30 Sep 2013 02:32:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8U6Wuec007138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 30 Sep 2013 02:32:56 -0400
Received: from [10.36.5.69] (vpn1-5-69.ams2.redhat.com [10.36.5.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8U6WrKa032074; Mon, 30 Sep 2013 02:32:54 -0400
Message-ID: <1380522773.3922.15.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 30 Sep 2013 08:32:53 +0200
In-Reply-To: <52488A79.8010803@msgid.tls.msk.ru>
References: <CA+K+NcStLJod1P3MhWqPJ=jhfMwMuV_cxuivi-QXduwnT2uwqg@mail.gmail.com>
	<52488A79.8010803@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: =?ISO-8859-1?Q?J=E1n_Vesel=FD?= <jano.vesely@gmail.com>,
	QEMU <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pci-ohci: Add missing 'break' in
 ohci_service_td
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
X-List-Received-Date: Mon, 30 Sep 2013 06:33:13 -0000

  Hi,

> While the actual interesting change (adding break) looks
> correct, and the whole thing is trivial indeed, this area
> has a maintainer, -- Cc'ing Gerd for this.  If he's okay
> I'll pick it up.

Patch is fine.

Acked-by: Gerd Hoffmann <kraxel@gmail.com>

cheers,
  Gerd



