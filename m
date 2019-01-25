Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn1uu-0006y7-Rs
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 08:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gn1us-0006LB-LG
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 08:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gn1l1-0000GC-3W
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 08:42:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gn1kx-0000D4-Sy; Fri, 25 Jan 2019 08:42:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E43BAA08E2;
	Fri, 25 Jan 2019 13:42:49 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 732DF5C5FD;
	Fri, 25 Jan 2019 13:42:46 +0000 (UTC)
Date: Fri, 25 Jan 2019 11:42:45 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190125134245.GD4136@habkost.net>
References: <1548410602-16008-1-git-send-email-pbonzini@redhat.com>
	<fa3b6ce0-0fc4-7ee8-653b-5c0aecfa6d30@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <fa3b6ce0-0fc4-7ee8-653b-5c0aecfa6d30@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 25 Jan 2019 13:42:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] decodetree: re.fullmatch
 was added in 3.4
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2019 13:53:07 -0000

On Fri, Jan 25, 2019 at 01:45:00PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Cc'ing maintainers :P
>=20
> $ ./scripts/get_maintainer.pl -f scripts/decodetree.py
> Eduardo Habkost <ehabkost@redhat.com> (odd fixer:Python scripts)
> Cleber Rosa <crosa@redhat.com> (odd fixer:Python scripts)
>=20
> On 1/25/19 11:03 AM, Paolo Bonzini wrote:
> > Python 3 versions earlier than 3.4 do not have it, use the
> > same workaround that is in place for 3.0.
> >=20
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Queued, thanks!

--=20
Eduardo

