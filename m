Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnN6w-0001bo-4K
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 04:12:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnN6t-0001X0-Om
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 04:12:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnN6t-0000TF-3p
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 04:12:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnN6o-0000Rd-H7; Wed, 29 Apr 2015 04:12:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 45F2542A5D;
	Wed, 29 Apr 2015 11:12:40 +0300 (MSK)
Message-ID: <55409278.8070801@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 11:12:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
 qemu-devel@nongnu.org
References: <1430293941-3214-1-git-send-email-crosthwaite.peter@gmail.com>
In-Reply-To: <1430293941-3214-1-git-send-email-crosthwaite.peter@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	kbastian@mail.uni-paderborn.de,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] tcg: Delete unused cpu_pc_from_tb()
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
X-List-Received-Date: Wed, 29 Apr 2015 08:12:48 -0000

29.04.2015 10:52, Peter Crosthwaite wrote:
> No code uses the cpu_pc_from_tb() function. Delete from tricore and
> arm which each provide an unused implementation. Update the comment
> in tcg.h to reflect that this is obsoleted by synchronize_from_tb.

This one looks much better!  Thank you, applied to -trivial tree.

/mjt

