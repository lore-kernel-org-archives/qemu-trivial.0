Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V6bbX-0004hC-LK
	for mharc-qemu-trivial@gnu.org; Tue, 06 Aug 2013 03:22:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1V6bbQ-0004X8-If
	for qemu-trivial@nongnu.org; Tue, 06 Aug 2013 03:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1V6bbL-00045O-RL
	for qemu-trivial@nongnu.org; Tue, 06 Aug 2013 03:22:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1V6bb8-00043I-OB; Tue, 06 Aug 2013 03:22:26 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r767MO9D024234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 6 Aug 2013 03:22:24 -0400
Received: from blackfin.pond.sub.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r767MNHU005507; Tue, 6 Aug 2013 03:22:23 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C8290200B7; Tue,  6 Aug 2013 09:22:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1375730200-22203-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 06 Aug 2013 09:22:22 +0200
In-Reply-To: <1375730200-22203-1-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Mon, 5 Aug 2013 20:16:40 +0100")
Message-ID: <87d2pr1dxt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: disable clang
	-Wstring-plus-int warning
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
X-List-Received-Date: Tue, 06 Aug 2013 07:22:49 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> Some versions of clang will warn about adding integers to strings:
>
> disas/i386.c:4753:23: error: adding 'char' to a string does not append
>       to the string [-Werror,-Wstring-plus-int]
>       oappend ("%es:" + intel_syntax);
>                ~~~~~~~^~~~~~~~~~~~~~
> disas/i386.c:4753:23: note: use array indexing to silence this warning
>       oappend ("%es:" + intel_syntax);
>                       ^
>                &      [             ]
>
> disas/i386.c uses this idiom to to skip a "%" prefix if using intel
> rather than AT&T syntax. This seems like a reasonable  thing to do,
> and I don't think anybody contributing to QEMU is likely to believe
> that '+' is a string concatenation operator in C, so just disable
> -Wstring-plus-int.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Yes, please.

