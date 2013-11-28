Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vm2dT-0004Hb-NA
	for mharc-qemu-trivial@gnu.org; Thu, 28 Nov 2013 09:32:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Vm2dK-0003zG-KR
	for qemu-trivial@nongnu.org; Thu, 28 Nov 2013 09:32:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Vm2dE-00070t-IE
	for qemu-trivial@nongnu.org; Thu, 28 Nov 2013 09:31:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:13828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Vm2d0-0006w0-AU; Thu, 28 Nov 2013 09:31:38 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rASEVbkg006541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 28 Nov 2013 09:31:37 -0500
Received: from [10.36.4.184] (vpn1-4-184.ams2.redhat.com [10.36.4.184])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rASEVZtI012089; Thu, 28 Nov 2013 09:31:36 -0500
Message-ID: <1385649095.13867.56.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: armbru@redhat.com
Date: Thu, 28 Nov 2013 15:31:35 +0100
In-Reply-To: <1385381298-3335-1-git-send-email-armbru@redhat.com>
References: <1385381298-3335-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace-events: Clean up after removal of
 old usb-host code
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
X-List-Received-Date: Thu, 28 Nov 2013 14:32:06 -0000

On Mo, 2013-11-25 at 13:08 +0100, armbru@redhat.com wrote:
> From: Markus Armbruster <armbru@redhat.com>
> 
> Commit b5613fd neglected to drop the trace events along with the code.

Added to usb patch queue.

thanks,
  Gerd



