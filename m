Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wz4RQ-0001FO-FU
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 09:37:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Wz4RH-00011K-8L
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 09:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Wz4R9-0005Mx-OH
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 09:37:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Wz4Qt-0005F5-7w; Mon, 23 Jun 2014 09:37:15 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5NDbBM0007328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 23 Jun 2014 09:37:11 -0400
Received: from noname.redhat.com (ovpn-116-94.ams2.redhat.com [10.36.116.94])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s5NDb8po001483; Mon, 23 Jun 2014 09:37:09 -0400
Date: Mon, 23 Jun 2014 15:37:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20140623133708.GG10973@noname.redhat.com>
References: <53A581FC.6050305@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53A581FC.6050305@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH trivial] block.c: Remove useless 'buf'
	variable
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
X-List-Received-Date: Mon, 23 Jun 2014 13:37:47 -0000

Am 21.06.2014 um 15:00 hat Chen Gang geschrieben:
> 'buf' is not used actually, so remove it and related snprintf() statement.
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

