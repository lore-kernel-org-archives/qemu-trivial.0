Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YPnIc-0003kY-Cw
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 02:19:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YPnIZ-0003hE-P2
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 02:19:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YPnIW-00052o-He
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 02:19:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:1143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YPnIW-00052k-A4; Mon, 23 Feb 2015 02:19:20 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1N7JFYk010890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 23 Feb 2015 02:19:15 -0500
Received: from [10.36.116.38] (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1N7JDTp015824; Mon, 23 Feb 2015 02:19:13 -0500
Message-ID: <1424675952.23631.3.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Date: Mon, 23 Feb 2015 08:19:12 +0100
In-Reply-To: <1424365943-27563-3-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424365943-27563-3-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH 2/5] ui: Removed unused functions
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
X-List-Received-Date: Mon, 23 Feb 2015 07:19:24 -0000

On Do, 2015-02-19 at 18:12 +0100, Thomas Huth wrote:
> Remove qemu_console_displaystate(), qemu_remove_kbd_event_handler(),
> qemu_different_endianness_pixelformat() and cpkey(), since they are
> completely unused.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


