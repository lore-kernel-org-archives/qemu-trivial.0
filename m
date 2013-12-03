Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vnlqw-0001w9-0V
	for mharc-qemu-trivial@gnu.org; Tue, 03 Dec 2013 04:01:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Vnlqo-0001j5-W0
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 04:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Vnlqj-0002fB-KD
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 04:01:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VnlqY-0002cW-BX; Tue, 03 Dec 2013 04:00:46 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB390cWa020680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Dec 2013 04:00:38 -0500
Received: from blackfin.pond.sub.org (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rB390JJF027385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 Dec 2013 04:00:22 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 17CE9200C9; Tue,  3 Dec 2013 10:00:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru> <529D0533.7090402@suse.de>
	<529D11C5.2080505@ozlabs.ru>
Date: Tue, 03 Dec 2013 10:00:19 +0100
In-Reply-To: <529D11C5.2080505@ozlabs.ru> (Alexey Kardashevskiy's message of
	"Tue, 03 Dec 2013 10:03:33 +1100")
Message-ID: <87k3fmqpgc.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: remove (max_cpus > 255)
	check from smp_parse
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
X-List-Received-Date: Tue, 03 Dec 2013 09:01:08 -0000

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

[...]
>                                            And I cannot find any machine
> which would not define max_cpus, have I missed any?

If a machine lacks an explicit initializer for max_cpus, it'll remain
zero, which its users will interpret as 1.

