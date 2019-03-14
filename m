Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4Nsg-0005zW-DC
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 06:46:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h4Nsc-0005w8-BO
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 06:46:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h4Nsb-0001GL-BJ
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 06:46:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1h4NsY-0001B4-4H; Thu, 14 Mar 2019 06:46:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2208306D339;
	Thu, 14 Mar 2019 10:46:24 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-21.ams2.redhat.com
	[10.36.117.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 704704D708;
	Thu, 14 Mar 2019 10:46:23 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>
Date: Thu, 14 Mar 2019 11:46:20 +0100
Message-Id: <20190314104622.101715-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 14 Mar 2019 10:46:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-4.0 0/2] Update .gitignore and
 tests/.gitignore for in-tree builds
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
X-List-Received-Date: Thu, 14 Mar 2019 10:46:31 -0000

This series could be useless when we will no longer support in-tree build=
s,
but for 4.0 I think it's useful to ignore these files.

Stefano Garzarella (2):
  .gitignore: ignore docs/built created for in-tree builds
  tests/.gitignore: ignore test-qapi-emit-events.[ch] for in-tree builds

 .gitignore       | 1 +
 tests/.gitignore | 1 +
 2 files changed, 2 insertions(+)

--=20
2.20.1


