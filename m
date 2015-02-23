Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YPnIs-0004HZ-97
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 02:19:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YPnIq-0004Et-7l
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 02:19:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YPnIn-00054R-0v
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 02:19:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YPnIm-00054N-QT; Mon, 23 Feb 2015 02:19:36 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1N7JVq1006322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 23 Feb 2015 02:19:32 -0500
Received: from [10.36.116.38] (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1N7JTB0028907; Mon, 23 Feb 2015 02:19:30 -0500
Message-ID: <1424675969.23631.4.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Date: Mon, 23 Feb 2015 08:19:29 +0100
In-Reply-To: <1424365943-27563-4-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424365943-27563-4-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH 3/5] ui/vnc: Remove
	vnc_stop_worker_thread()
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
X-List-Received-Date: Mon, 23 Feb 2015 07:19:41 -0000

On Do, 2015-02-19 at 18:12 +0100, Thomas Huth wrote:
> This function is not used anymore, let's remove it.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


