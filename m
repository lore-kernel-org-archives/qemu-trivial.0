Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WxYoY-00053q-H2
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jun 2014 05:39:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WxYoR-0004vI-KH
	for qemu-trivial@nongnu.org; Thu, 19 Jun 2014 05:39:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WxYoL-0001TA-HU
	for qemu-trivial@nongnu.org; Thu, 19 Jun 2014 05:39:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WxYo8-0001QU-GL; Thu, 19 Jun 2014 05:39:00 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5J9cw3B007921
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 19 Jun 2014 05:38:58 -0400
Received: from [10.36.116.72] (ovpn-116-72.ams2.redhat.com [10.36.116.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5J9cuef018663; Thu, 19 Jun 2014 05:38:56 -0400
Message-ID: <1403170735.22530.6.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Date: Thu, 19 Jun 2014 11:38:55 +0200
In-Reply-To: <1403047414-27505-1-git-send-email-kroosec@gmail.com>
References: <1403047414-27505-1-git-send-email-kroosec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCHv2] usb: Fix usb-bt-dongle initialization.
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
X-List-Received-Date: Thu, 19 Jun 2014 09:39:25 -0000

On Mi, 2014-06-18 at 00:23 +0100, Hani Benhabiles wrote:
> Due to an incomplete initialization, adding a usb-bt-dongle device through HMP
> or QMP will cause a segmentation fault.

Added to usb patch queue.

thanks,
  Gerd



