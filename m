Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9UMM-0000t7-8T
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2019 08:42:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1h9UMK-0000V1-3Y
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2019 08:42:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1h9U9v-0006uI-P4
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2019 08:29:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1h9U9g-0006jq-1H; Thu, 28 Mar 2019 08:29:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA43770008;
	Thu, 28 Mar 2019 12:29:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFD619C77;
	Thu, 28 Mar 2019 12:29:04 +0000 (UTC)
Date: Thu, 28 Mar 2019 13:29:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20190328122903.GH4857@localhost.localdomain>
References: <20190327095634.53038-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327095634.53038-1-sgarzare@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 28 Mar 2019 12:29:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 0/2] block/vhdx: Use IEC binary
 prefixes from "qemu/units.h"
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
X-List-Received-Date: Thu, 28 Mar 2019 12:42:17 -0000

Am 27.03.2019 um 10:56 hat Stefano Garzarella geschrieben:
> v2:
> - Included units.h directly in the vhdx.h header file (John, Philippe)
> - Added a comment next to DEFAULT_LOG_SIZE definition (Kevin)
> - Added a second patch where I fixed some size constants using IEC
>   binary prefixes.
>   Note: checkpatch is not happy about a change in vhdx.h but all the comments
>   in that file doesn't respect the new coding style so I left the comment as is

Thanks, applied to the block-next branch for 4.1.

Kevin

