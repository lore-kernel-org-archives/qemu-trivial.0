Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXqFo-0000Bs-9g
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 08:05:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YXqFl-0000AA-7v
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 08:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YXqFk-0007Vs-HF
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 08:05:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YXqFc-0007TQ-B7; Tue, 17 Mar 2015 08:05:36 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2HC5Wgt013126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Mar 2015 08:05:32 -0400
Received: from [10.36.116.18] (ovpn-116-18.ams2.redhat.com [10.36.116.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HC5UhM031948; Tue, 17 Mar 2015 08:05:31 -0400
Message-ID: <1426593930.27188.96.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Date: Tue, 17 Mar 2015 13:05:30 +0100
In-Reply-To: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/usb: Include USB files only if
	necessary
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
X-List-Received-Date: Tue, 17 Mar 2015 12:05:46 -0000

On Sa, 2015-03-14 at 06:33 +0100, Thomas Huth wrote:
> Boards that do not include an USB controller should not provide
> USB devices. However, when running "qemu-system-s390x -device help"
> for example, there's still a usb-hub, usb-kbd, usb-mouse and
> usb-tablet in the list of "supported" devices. Let's fix that
> by compiling and linking the USB files only if it's really
> necessary.

Added to usb queue.

thanks,
  Gerd



