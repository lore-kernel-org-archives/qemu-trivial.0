Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ul5Gm-0004qJ-NZ
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jun 2013 18:36:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ul5Gk-0004n9-HB
	for qemu-trivial@nongnu.org; Fri, 07 Jun 2013 18:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ul5Gj-0007eb-DT
	for qemu-trivial@nongnu.org; Fri, 07 Jun 2013 18:36:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ul5Gg-0007dn-Ma; Fri, 07 Jun 2013 18:36:22 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F3E7640DA7;
	Sat,  8 Jun 2013 02:36:21 +0400 (MSK)
Message-ID: <51B26065.3000705@msgid.tls.msk.ru>
Date: Sat, 08 Jun 2013 02:36:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <cover.1370572420.git.peter.crosthwaite@xilinx.com>
	<1ec46fbd250efe78699a1e4cf6838c0c88f4acc7.1370572420.git.peter.crosthwaite@xilinx.com>
	<CAEgOgz7vk_8z+KzFMfj0iWjLPeykkLUP4ePu8AECLSHn1t3KcQ@mail.gmail.com>
In-Reply-To: <CAEgOgz7vk_8z+KzFMfj0iWjLPeykkLUP4ePu8AECLSHn1t3KcQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 1/5] intc/xilinx_intc: Use qemu_set_irq
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
X-List-Received-Date: Fri, 07 Jun 2013 22:36:27 -0000

07.06.2013 06:39, Peter Crosthwaite wrote:
>> Use qemu_set_irq rather than if-elsing qemu_irq_(lower|raise). No
>> functional change, just reduces verbosity.

Thanks, applied to the trivial patches queue.

/mjt

