Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLVHE-0001OC-Ad
	for mharc-qemu-trivial@gnu.org; Thu, 06 Mar 2014 05:11:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLVH7-0001O1-NY
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 05:11:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WLVH2-0005d3-Qu
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 05:11:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1WLVH2-0005cz-Iv; Thu, 06 Mar 2014 05:11:32 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s26ABI9p007329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 6 Mar 2014 05:11:29 -0500
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s269c00v011099; Thu, 6 Mar 2014 04:38:00 -0500
Date: Thu, 6 Mar 2014 10:37:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20140306103759.2d5e0ca0@nial.usersys.redhat.com>
In-Reply-To: <53178A27.1050103@redhat.com>
References: <1394035840-1584-1-git-send-email-imammedo@redhat.com>
	<1394035840-1584-3-git-send-email-imammedo@redhat.com>
	<53178A27.1050103@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-trivial@nongnu.org,
	coreyb@linux.vnet.ibm.com, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	mreitz@redhat.com, aliguori@amazon.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, lersek@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 2/2] vl: convert -m to
	QemuOpts
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
X-List-Received-Date: Thu, 06 Mar 2014 10:11:43 -0000

On Wed, 05 Mar 2014 13:33:43 -0700
Eric Blake <eblake@redhat.com> wrote:

> On 03/05/2014 09:10 AM, Igor Mammedov wrote:
> > Adds option to -m
> >  "size" - startup memory amount
> >=20
> > For compatibility with legacy CLI if suffix-less number is passed,
> > it assumes amount in Mb.
> >=20
> > Otherwise user is free to use suffixed number using suffixes b,k/K,M,G
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> > v2:
> >  - suggested by Andreas F=E4rber <afaerber@suse.de>
> >     * s/fprintf/error_report/
> >     * rename 'mem' option to 'size'
> >  - fix conflict with missing numa QemuOpts
>=20
> Given the amount of rework in v2, it may have been smarter to drop my
> R-b tag.  But beyond Andreas' findings of missing s/mem/size/ instances,
> I'm not spotting any problems, so if that's the only fix you make for
> v4, you can keep my R-b.
>=20
Thanks!

