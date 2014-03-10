Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WMznE-0007LH-Cf
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 08:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WMzn7-00079o-CT
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 08:58:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WMzn2-0003jw-DF
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 08:58:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WMzn2-0003jp-5y; Mon, 10 Mar 2014 08:58:44 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ACwgmr025171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 08:58:42 -0400
Received: from [10.36.5.44] (vpn1-5-44.ams2.redhat.com [10.36.5.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2ACwdBH006220; Mon, 10 Mar 2014 08:58:40 -0400
Message-ID: <1394456319.22422.6.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Date: Mon, 10 Mar 2014 13:58:39 +0100
In-Reply-To: <1394126013-26297-1-git-send-email-sw@weilnetz.de>
References: <1394126013-26297-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Prettify message for hosts
 without spice support
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
X-List-Received-Date: Mon, 10 Mar 2014 12:58:54 -0000

On Do, 2014-03-06 at 18:13 +0100, Stefan Weil wrote:
> Instead of
> 
>     spice support     no (/)
> 
> configure now prints
> 
>     spice support     no
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Added to spice patch queue.

thanks,
  Gerd



