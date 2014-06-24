Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzOFZ-0000cT-1D
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 06:46:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WzOFQ-0000R1-1S
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 06:46:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WzOFI-0006C1-JO
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 06:46:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1WzOF5-00067u-8t; Tue, 24 Jun 2014 06:46:23 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5OAkJ3d017352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 24 Jun 2014 06:46:19 -0400
Received: from noname.redhat.com (ovpn-116-75.ams2.redhat.com [10.36.116.75])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s5OAkECD017942; Tue, 24 Jun 2014 06:46:15 -0400
Date: Tue, 24 Jun 2014 12:46:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20140624104614.GD3458@noname.redhat.com>
References: <53A84797.9040304@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53A84797.9040304@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: famz@redhat.com, qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
	eblake@redhat.com
Subject: Re: [Qemu-trivial] [PATCH trivial v2] block.c: Add return value for
 bdrv_append_temp_snapshot() to avoid incorrect failure processing issue
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
X-List-Received-Date: Tue, 24 Jun 2014 10:46:51 -0000

Am 23.06.2014 um 17:28 hat Chen Gang geschrieben:
> When failure occurs, 'ret' need be set, or may return 0 to indicate success.
> And error_propagate() also need be called only one time within a function.
> 
> It is abnormal to prevent bdrv_append_temp_snapshot() return value but still
> set errp when error occurs -- although it contents return value internally.
> 
> So let bdrv_append_temp_snapshot() internal return value outside, and let
> all things normal, then fix the issue too.
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

What does this fix?

Having both a return value and an Error* object is duplication and
only a sign that a function hasn't been fully converted to the Error
framework yet. We shouldn't introduce new instances of this without a
very good reason.

Kevin

