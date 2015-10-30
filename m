Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zs7dN-0003tw-Cj
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2015 07:14:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Zs7dJ-0003mn-PC
	for qemu-trivial@nongnu.org; Fri, 30 Oct 2015 07:14:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Zs7dI-0003Nm-Vd
	for qemu-trivial@nongnu.org; Fri, 30 Oct 2015 07:14:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Zs7dB-0003IK-KZ; Fri, 30 Oct 2015 07:14:01 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 39339461C5;
	Fri, 30 Oct 2015 11:14:01 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-67.ams2.redhat.com
	[10.36.116.67])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9UBDwhi017652; Fri, 30 Oct 2015 07:13:59 -0400
Message-ID: <1446203638.1144.28.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Fri, 30 Oct 2015 12:13:58 +0100
In-Reply-To: <1446134122-32292-1-git-send-email-armbru@redhat.com>
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] ui audio qxl usb: Use g_new() &
 friends where that makes obvious sense
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
X-List-Received-Date: Fri, 30 Oct 2015 11:14:10 -0000

On Do, 2015-10-29 at 16:55 +0100, Markus Armbruster wrote:
> v2:
> * Trivially rebased
> 
> Markus Armbruster (4):
>   ui: Use g_new() & friends where that makes obvious sense
>   audio: Use g_new() & friends where that makes obvious sense
>   qxl: Use g_new() & friends where that makes obvious sense
>   usb: Use g_new() & friends where that makes obvious sense

I'd prefer to drop the audio one because there still is the gsoc patch
series pending which touches all this anyway.

Otherwise looks fine to me.

Do you want me pick this up or send a pull request yourself?

On case of the latter:

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd



