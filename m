Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8e-0002ly-8M
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Uoobt-0003zC-Br
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 01:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Uoobs-0002uj-HB
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 01:37:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Uoobq-0002uD-Fa; Tue, 18 Jun 2013 01:37:38 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5I5bYBL030424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Jun 2013 01:37:35 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5I5bVtM013206; Tue, 18 Jun 2013 01:37:33 -0400
Message-ID: <51BFF21A.7050008@redhat.com>
Date: Tue, 18 Jun 2013 07:37:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1371487106-17194-1-git-send-email-anthony.perard@citrix.com>
	<51BFCDA1.8040507@msgid.tls.msk.ru>
In-Reply-To: <51BFCDA1.8040507@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:35 -0400
Cc: Anthony PERARD <anthony.perard@citrix.com>, qemu-trivial@nongnu.org,
	Alon Levy <alevy@redhat.com>, QEMU-devel <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] qxl: Fix QXLRam initialisation.
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
X-List-Received-Date: Tue, 18 Jun 2013 05:37:42 -0000

  Hi,

>> If memory is set to 0xc2c2.., it leads to a spice-critical error when
>> trying to start qxl.

> But maybe instead of doing it this way, we should just memset the
> whole thing to 0, to avoid similar bugs in the future?  Are there
> any arches out there which have cpu_to_le32(0) != 0 ?

On qemu + kvm guest memory (including pci device memory where this lives
in) _is_ zero initialized.

IIRC xen has a debug mode where it fills memory with non-zero values
instead, for debugging / testing purposes, and this is where things blow up.

So while the fix is clearly correct, the patch isn't as critical as it
initially looks like.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd


