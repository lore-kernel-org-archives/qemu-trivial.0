Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ztang-0008Mw-Cz
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:34:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ztane-0008KM-GZ
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:34:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ztand-0004Hm-Nv
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:34:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZtanX-0004GW-7F; Tue, 03 Nov 2015 07:34:47 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4D6E3407DB;
	Tue,  3 Nov 2015 15:34:44 +0300 (MSK)
Message-ID: <5638A9E4.6010900@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 15:34:44 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1445514690-7883-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1445514690-7883-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, cota@braap.org
Subject: Re: [Qemu-trivial] [PATCH] exec: avoid unnecessary cacheline bounce
	on ram_list.mru_block
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
X-List-Received-Date: Tue, 03 Nov 2015 12:34:55 -0000

22.10.2015 14:51, Paolo Bonzini write:
> Whenever the MRU cache hits for the list of RAM blocks, qemu_get_ram_block
> does an unnecessary write that causes a processor cache line to bounce
> from one core to another.  This causes a performance hit.

Applied to -trivial.  A good one! :)

/mjt


