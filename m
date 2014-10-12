Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XdDpm-0000yk-8Q
	for mharc-qemu-trivial@gnu.org; Sun, 12 Oct 2014 03:44:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XdDpf-0000pj-S9
	for qemu-trivial@nongnu.org; Sun, 12 Oct 2014 03:44:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XdDpb-0001So-2N
	for qemu-trivial@nongnu.org; Sun, 12 Oct 2014 03:44:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1XdDpR-0001RO-07; Sun, 12 Oct 2014 03:44:33 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9C7iMAK031213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sun, 12 Oct 2014 03:44:23 -0400
Received: from noname.redhat.com (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s9C7iJB4020574; Sun, 12 Oct 2014 03:44:19 -0400
Date: Sun, 12 Oct 2014 09:44:18 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20141012074418.GB3739@noname.redhat.com>
References: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>
	<5438A2C8.80508@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5438A2C8.80508@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: weidong.huang@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	arei.gonglei@huawei.com, stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: change free to
	g_free
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
X-List-Received-Date: Sun, 12 Oct 2014 07:44:52 -0000

Am 11.10.2014 um 05:23 hat Eric Blake geschrieben:
> On 10/10/2014 08:54 PM, arei.gonglei@huawei.com wrote:
> > From: Gonglei <arei.gonglei@huawei.com>
> >=20
> > The caller of qemu_vfree() maybe not check whether parameter
> > ptr pointer is NULL or not, such as vpc_open().
> > Using g_free() is more safe.
>=20
> NACK.  g_free is only safe for pointers allocated by g_malloc.
> qemu_vfree is for use on pointers allocated by qemu_try_memalign and
> friends (matching the name valloc which is an older spelling of
> posix_memalign), which are NOT allocated by g_malloc.  Furthermore,
> free(NULL) is safe.

I second that. Strong NACK.

Kevin

