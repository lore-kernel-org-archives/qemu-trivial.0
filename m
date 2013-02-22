Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8qmB-0000cu-N0
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 06:26:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1U8qm2-00007S-15
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 06:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1U8qly-0001cg-Cb
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 06:26:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1U8qlr-0001bF-Jq; Fri, 22 Feb 2013 06:26:31 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1MBQUpq003047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 22 Feb 2013 06:26:30 -0500
Received: from rincewind.home.kraxel.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1MBQSN8021840; Fri, 22 Feb 2013 06:26:29 -0500
Message-ID: <512755E3.3080003@redhat.com>
Date: Fri, 22 Feb 2013 12:26:27 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1361483888-8976-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1361483888-8976-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r1MBQUpq003047
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] xhci: fix bad print specifier
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
X-List-Received-Date: Fri, 22 Feb 2013 11:26:50 -0000

On 02/21/13 22:58, Herv=C3=A9 Poussineau wrote:
> This fixes the following compilation error:
> hw/usb/hcd-xhci.c:1156:17: error: format =E2=80=98%llx=E2=80=99 expects=
 argument of type
> =E2=80=98long long unsigned int=E2=80=99, but argument 4 has type =E2=80=
=98unsigned int=E2=80=99
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

