Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEd9F-0003W5-Cj
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2012 05:34:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TEd97-00039J-IX
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 05:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TEd91-0005yr-VX
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 05:34:09 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41392 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1TEd8y-0005y5-E7; Thu, 20 Sep 2012 05:34:00 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 8786EA0FED;
	Thu, 20 Sep 2012 11:33:59 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
Date: Thu, 20 Sep 2012 11:33:56 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <73237B62-A27E-4C9B-8C3D-D11EFEF89C65@suse.de>
References: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
To: Stefan Weil <sw@weilnetz.de>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ppc405_uc: Fix buffer overflow
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
X-List-Received-Date: Thu, 20 Sep 2012 09:34:15 -0000


On 31.08.2012, at 22:21, Stefan Weil wrote:

> Report from smatch:
> 
> ppc405_uc.c:209 dcr_read_pob(12) error: buffer overflow 'pob->besr' 2 <= 2
> ppc405_uc.c:232 dcr_write_pob(12) error: buffer overflow 'pob->besr' 2 <= 2
> 
> The old code reads and writes besr[POB0_BESR1 - POB0_BESR0] or besr[2]
> which is one too much.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to ppc-next.


Alex


