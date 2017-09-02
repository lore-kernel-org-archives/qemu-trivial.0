Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1do4X9-0007rK-Nw
	for mharc-qemu-trivial@gnu.org; Sat, 02 Sep 2017 05:16:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1do4Wz-0007lZ-Hr
	for qemu-trivial@nongnu.org; Sat, 02 Sep 2017 05:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1do4Wu-0005PK-Ts
	for qemu-trivial@nongnu.org; Sat, 02 Sep 2017 05:15:57 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:35460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1do4Wk-00055u-TD; Sat, 02 Sep 2017 05:15:43 -0400
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1do4WP-0003lS-Mb; Sat, 02 Sep 2017 11:15:21 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1do4WO-00041G-QD; Sat, 02 Sep 2017 11:15:20 +0200
Date: Sat, 2 Sep 2017 11:15:20 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org
Message-ID: <20170902091520.bxecfhisvy46o4cb@aurel32.net>
References: <20170901110332.32650-1-otubo@redhat.com>
	<20170901143016.GK7570@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170901143016.GK7570@localhost.localdomain>
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-trivial] [PATCH] dma/i82374: avoid double creation of
 i82374 device
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
X-List-Received-Date: Sat, 02 Sep 2017 09:16:02 -0000

On 2017-09-01 11:30, Eduardo Habkost wrote:
> i82374 is compiled in only on ppc and sh4, so I'm CCing the
> maintainers for those architectures.

The i82374 device is not useful nor usable on SH4. It has just been
added in commit 85d3846a39 to be able to run the tests.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

