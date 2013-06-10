Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ulue8-0006zI-Gh
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 01:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ulue6-0006vu-CB
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 01:27:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ulue5-0008JH-4g
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 01:27:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ulue1-0008IK-FI; Mon, 10 Jun 2013 01:27:53 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5A5RoYX013846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 01:27:50 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5A5ReYm030309; Mon, 10 Jun 2013 01:27:46 -0400
Message-ID: <51B563CC.5040907@redhat.com>
Date: Mon, 10 Jun 2013 07:27:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
	<51B2E26F.8030106@msgid.tls.msk.ru>
In-Reply-To: <51B2E26F.8030106@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Peter Crosthwaite <peter.crosthwaite@petalogix.com>,
	=?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] ioport/memory: check that both .read and
 .write callbacks are defined
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
X-List-Received-Date: Mon, 10 Jun 2013 05:27:59 -0000

  Hi,

> Maybe instead (or in addition to), we should provide a dummy
> read or write functions -- instead of fixing each such occurence
> to use its own dummy function

Makes sense, especially for write where we can just ignore what the
guest attempts to write.  Not sure we can have a generic handler for
reads.  Maybe two, one which returns 0xff and one which returns 0x00.

cheers,
  Gerd



