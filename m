Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTWEj-0000Dh-G4
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2011 05:36:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QTWEf-0000CK-Dg
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2011 05:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QTWEd-0003z1-O3
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2011 05:36:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1QTWEZ-0003y1-Ne; Mon, 06 Jun 2011 05:36:32 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p569aSMX014792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 6 Jun 2011 05:36:28 -0400
Received: from blackfin.pond.sub.org (ovpn-113-50.phx2.redhat.com
	[10.3.113.50])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p569aRcO011608; Mon, 6 Jun 2011 05:36:28 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id A1F3F265; Mon,  6 Jun 2011 11:36:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexandre Raymond <cerbere@gmail.com>
References: <1307246220-61006-1-git-send-email-cerbere@gmail.com>
Date: Mon, 06 Jun 2011 11:36:26 +0200
In-Reply-To: <1307246220-61006-1-git-send-email-cerbere@gmail.com> (Alexandre
	Raymond's message of "Sat, 4 Jun 2011 23:57:00 -0400")
Message-ID: <m3r577s3mt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Correct and standardize
	header guards in all header files
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
X-List-Received-Date: Mon, 06 Jun 2011 09:36:39 -0000

Alexandre Raymond <cerbere@gmail.com> writes:

> As per ISO/IEC 9899, Section 7.1.3 on reserved identifiers,
> identifiers starting with an underscore are reserved.
>
> Therefore:
> 1) Rename all incorrect header guards
>
> While I'm at it:
> 2) Standardize header guards to "#ifndef SOMETHING_H"

Consistency is good.

> 3) Repeat the header guard identifier after the closing "#endif"

Such comments can help readers to navigate #if mazes.  Not the case for
header guards.  Just noise.

