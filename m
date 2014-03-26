Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSjee-000563-10
	for mharc-qemu-trivial@gnu.org; Wed, 26 Mar 2014 04:57:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WSjeX-0004xW-Ud
	for qemu-trivial@nongnu.org; Wed, 26 Mar 2014 04:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WSjeS-0001V4-Vc
	for qemu-trivial@nongnu.org; Wed, 26 Mar 2014 04:57:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7502)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WSjeH-0001Sm-Rk; Wed, 26 Mar 2014 04:57:26 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2Q8vHVq009806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 26 Mar 2014 04:57:18 -0400
Received: from localhost (dhcp-64-106.muc.redhat.com [10.32.64.106])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2Q8vGi9021160; Wed, 26 Mar 2014 04:57:16 -0400
Date: Wed, 26 Mar 2014 09:57:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
Message-ID: <20140326085715.GA27500@stefanha-thinkpad.muc.redhat.com>
References: <1395779153-4536-1-git-send-email-prasadjoshi.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395779153-4536-1-git-send-email-prasadjoshi.linux@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, pl@kamp.de,
	qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qemu-img: Release refernece to
	BlockDriverState
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
X-List-Received-Date: Wed, 26 Mar 2014 08:57:46 -0000

On Wed, Mar 26, 2014 at 01:55:53AM +0530, Prasad Joshi wrote:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  qemu-img.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

