Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLb6C-0004vD-Pe
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2011 09:43:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RLb68-0004eR-Le
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2011 09:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RLb60-0004vn-TD
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2011 09:43:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1RLb5t-0004uo-Oe; Wed, 02 Nov 2011 09:43:05 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2Dh2fi002543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 2 Nov 2011 09:43:02 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2DgxLP011090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Wed, 2 Nov 2011 09:43:01 -0400
Message-ID: <4EB149A1.9020507@redhat.com>
Date: Wed, 02 Nov 2011 14:46:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
References: <1320222981-3839-1-git-send-email-wdongxu@linux.vnet.ibm.com>
In-Reply-To: <1320222981-3839-1-git-send-email-wdongxu@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	pA2Dh2fi002543
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, raywang@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] block:fix cloop.c
	coding style
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
X-List-Received-Date: Wed, 02 Nov 2011 13:43:22 -0000

Am 02.11.2011 09:36, schrieb Dong Xu Wang:
> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
>=20
> Fix coding style in block/cloop.c.
>=20
> v3: Split to 2 patches: one for fixing coding style, one for replacing =
free with
>     g_free. And correct other 2 places with coding style problem.
> v2: Fix spelling: gfree->g_free.
> v1: Use gfree, to pair with g_malloc. Also fix coding style.
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Reviewed_by: Ray Wang <raywang@linux.vnet.ibm.com>
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Thanks, applied both to the block branch.

Kevin

