Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyjlD-0005hR-9n
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 08:56:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TyjlA-0005YW-04
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 08:56:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Tyjl4-0007c0-S1
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 08:55:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:15203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Tyjkz-0007b8-Fb; Fri, 25 Jan 2013 08:55:49 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PDtmGm009836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 08:55:48 -0500
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0PDtlMO020463; Fri, 25 Jan 2013 08:55:48 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D73D1200AA; Fri, 25 Jan 2013 14:55:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
References: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
Date: Fri, 25 Jan 2013 14:55:46 +0100
In-Reply-To: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
	(Michal Privoznik's message of "Fri, 25 Jan 2013 14:27:11 +0100")
Message-ID: <87zjzx2wpp.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx:
	s/tray-open/tray_open/ to match qapi schema
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
X-List-Received-Date: Fri, 25 Jan 2013 13:56:01 -0000

Michal Privoznik <mprivozn@redhat.com> writes:

> Currently, we are using 'tray_open' in QMP and 'tray-open' in
> HMP. However, the QMP documentation was mistakenly using the
> HMP version.

Could you point me to where we're using "tray_open"?

