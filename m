Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3tBF-0000HS-UD
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 14:00:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3tB5-0008IY-Gf
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 14:00:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3tB2-0007l0-UT
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 14:00:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U3tB0-0007kY-Bk; Fri, 08 Feb 2013 13:59:58 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18IxuwA004830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 13:59:56 -0500
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r18Ixtad009749; Fri, 8 Feb 2013 13:59:56 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4E761200AA; Fri,  8 Feb 2013 19:59:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
Date: Fri, 08 Feb 2013 19:59:55 +0100
In-Reply-To: <1360340232-4670-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Fri, 8 Feb 2013 17:17:06 +0100")
Message-ID: <87txpmbphw.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 0/6] Error reporting fixes
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
X-List-Received-Date: Fri, 08 Feb 2013 19:00:12 -0000

Luiz, would you like to take v3 through your tree?  In that case I'd
drop qemu-trivial.

