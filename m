Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSPHH-0006bB-7J
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 12:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fSPHF-0006Za-Ho
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fSPHE-0003mX-O9
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:02:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40632 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fSPH8-0003fn-Qv; Mon, 11 Jun 2018 12:02:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D193401EF00;
	Mon, 11 Jun 2018 16:02:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-1.ams2.redhat.com [10.36.117.1])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E88112D18C;
	Mon, 11 Jun 2018 16:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D542F1138645; Mon, 11 Jun 2018 18:02:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Kevin Wolf
	<kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>, patches@linaro.org, 
	Cornelia Huck <cohuck@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
	=?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,  Markus Armbruster
	<armbru@redhat.com>,  Alex Williamson <alex.williamson@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,  John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 18:02:24 +0200
In-Reply-To: <20180611141716.3813-1-peter.maydell@linaro.org> (Peter Maydell's
	message of "Mon, 11 Jun 2018 15:17:16 +0100")
Message-ID: <87fu1t2twv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 11 Jun 2018 16:02:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 11 Jun 2018 16:02:34 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Mon, 11 Jun 2018 16:02:42 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> The codebase has a bit of a mix of different multiline
> comment styles. State a preference for the Linux kernel
> style:
>     /*
>      * Star on the left for each line.
>      * Leading slash-star and trailing star-slash
>      * each go on a line of their own.
>      */
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

