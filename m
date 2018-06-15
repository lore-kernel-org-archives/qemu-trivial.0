Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTo7J-0006QW-HZ
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jun 2018 08:46:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fTo7F-0006MM-6X
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 08:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fTo7E-0004Xj-8g
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 08:46:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51312 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fTo78-0004Rh-4K; Fri, 15 Jun 2018 08:46:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B2B240122B9;
	Fri, 15 Jun 2018 12:46:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-237.ams2.redhat.com
	[10.36.117.237])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4A43111AF2C;
	Fri, 15 Jun 2018 12:45:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8C97C1138645; Fri, 15 Jun 2018 14:45:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Thomas
	Huth <thuth@redhat.com>,  "patches\@linaro.org" <patches@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,  Markus Armbruster
	<armbru@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Richard
	Henderson <richard.henderson@linaro.org>,  QEMU Developers
	<qemu-devel@nongnu.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
	<f4bug@amsat.org>, Alex Williamson <alex.williamson@redhat.com>, Stefan
	Hajnoczi <stefanha@redhat.com>,  Richard Henderson <rth@twiddle.net>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
	<CAFEAcA-vZH0KUxi+iYP3eYzXeHxNTotNwCMhEPcGhOLksbG71A@mail.gmail.com>
	<f9beda14-7c4a-8f89-baf1-5a79e847c4ac@redhat.com>
	<CAFEAcA_egToeW7ksTncbFCsW6uTh1FcPSgW6gx+VnjvQpqwWsw@mail.gmail.com>
Date: Fri, 15 Jun 2018 14:45:53 +0200
In-Reply-To: <CAFEAcA_egToeW7ksTncbFCsW6uTh1FcPSgW6gx+VnjvQpqwWsw@mail.gmail.com>
	(Peter Maydell's message of "Thu, 14 Jun 2018 11:46:17 +0100")
Message-ID: <87k1r01am6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 12:46:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 12:46:01 +0000 (UTC) for IP:'10.11.54.3'
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
X-List-Received-Date: Fri, 15 Jun 2018 12:46:10 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 13 June 2018 at 17:55, John Snow <jsnow@redhat.com> wrote:
[...]
>> It would only begin to matter terribly much if we actually decided we
>> wanted to do a doxygen-style doc generation for our internal APIs for
>> compatibility with, say, fancier IDEs than vim/emacs.
>
> We ought to do that at some point -- I had some prototype patches
> for it. Doc-comment comments always start /** on a line of its own,
> though.
>
>> As it stands, we're pretty inconsistent about which exact style we apply
>> when we "document" internal functions -- sometimes we document the
>> header, sometimes the implementation, sometimes both (but differently!)
>> and always with different styles all over the place. That's the real
>> problem, IMO.
>
> IMHO -- global functions should always be documented in the header
> with the prototype, and any new global function should get a
> doc comment (I require this for code I review...) I should be able
> to read about the API your code exposes to the rest of QEMU purely
> by looking at your headers.

Putting the function contract far from the actual function is a proven
way to end up with a contract that is far from what the function
actually does.

With a documentation generator such as Sphinx, the usual argument for
putting the contracts in headers "I want API documentation in one place,
without clutter" carries a lot less weight: the generated documentation
is exactly that.

