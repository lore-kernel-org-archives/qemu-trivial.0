Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zuc1A-000415-6B
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 03:05:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zuc17-0003vq-LR
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 03:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zuc14-0000XF-BZ
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 03:05:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zuc0v-0000Vt-I6; Fri, 06 Nov 2015 03:04:49 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7A0F040B3A;
	Fri,  6 Nov 2015 11:04:39 +0300 (MSK)
Message-ID: <563C5F17.7090409@msgid.tls.msk.ru>
Date: Fri, 06 Nov 2015 11:04:39 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Julio Guerra <julio@farjump.io>, qemu-devel@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <1444844599-33161-1-git-send-email-julio@farjump.io>
In-Reply-To: <1444844599-33161-1-git-send-email-julio@farjump.io>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: christophe@farjump.io, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH v2] taget-ppc: Fix read access to IBAT
 registers higher than IBAT3
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
X-List-Received-Date: Fri, 06 Nov 2015 08:05:02 -0000

14.10.2015 20:43, Julio Guerra wrote:
> Fix the index used to read the IBAT's vector which results in IBAT0..3 instead
> of IBAT4..N.
> 
> The bug appeared by saving/restoring contexts including IBATs values.

Applied to -trivial.  It'd be *much* better if such changes were
accepted by the maintainers who at least knows what's the talk about... :(

Thanks,

/mjt

