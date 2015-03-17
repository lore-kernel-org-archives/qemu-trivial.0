Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXr8p-0002vF-26
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 09:02:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YXr8h-0002k2-SS
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YXr8c-0000WJ-VK
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:02:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YXr8P-0000Tg-PK; Tue, 17 Mar 2015 09:02:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2HD29nL007984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Mar 2015 09:02:10 -0400
Received: from [10.36.116.18] (ovpn-116-18.ams2.redhat.com [10.36.116.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HD27Ol010062; Tue, 17 Mar 2015 09:02:07 -0400
Message-ID: <1426597326.27188.104.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Date: Tue, 17 Mar 2015 14:02:06 +0100
In-Reply-To: <20150317134056.5485884b@oc7435384737.ibm.com>
References: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1426593930.27188.96.camel@nilsson.home.kraxel.org>
	<1426594797.27188.103.camel@nilsson.home.kraxel.org>
	<20150317134056.5485884b@oc7435384737.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
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
X-List-Received-Date: Tue, 17 Mar 2015 13:02:37 -0000


> Oh, sorry, seems like I missed the "--enable-usb-redir" configure
> option ... I'll have a look and rework my patch...

Oh, right, that can hide the failure.
Note there also is --enable-libusb

cheers,
  Gerd



