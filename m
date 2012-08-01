Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwXSM-0004LH-Ve
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 07:51:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwXSG-0003yu-1J
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 07:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwXSF-0003cz-0v
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 07:51:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1SwXS6-0003a3-Lz; Wed, 01 Aug 2012 07:50:58 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71Bouo8000532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 07:50:56 -0400
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q71BotdQ027864; Wed, 1 Aug 2012 07:50:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 16D2F20058; Wed,  1 Aug 2012 13:50:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1342539951-30915-1-git-send-email-akong@redhat.com>
	<1343811543-12137-2-git-send-email-akong@redhat.com>
	<20120801105011.GC17816@stefanha-thinkpad.localdomain>
	<CAFEAcA9_ATmjm95ottBKtpbaB5uEzOS2KNk19v6_vyngR8ZUKA@mail.gmail.com>
Date: Wed, 01 Aug 2012 13:50:54 +0200
In-Reply-To: <CAFEAcA9_ATmjm95ottBKtpbaB5uEzOS2KNk19v6_vyngR8ZUKA@mail.gmail.com>
	(Peter Maydell's message of "Wed, 1 Aug 2012 12:23:02 +0100")
Message-ID: <874nomespt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: aliguori@us.ibm.com, quintela@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [RESEND PATCH 1/3] socket: remove
	redundant check
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
X-List-Received-Date: Wed, 01 Aug 2012 11:51:14 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 1 August 2012 11:50, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> This isn't obvious.  It looks like the intent of the if (!e->ai_next) is
>> to suppress the error so that the next iteration of the *outer* loop can
>> succeed.
>
> Yeah, we only call it an error on the last time round. This
> loop is a bit confusingly structured, since we're effectively
> handling the failure in several places at once: we always
> fprintf() something, then we set the error on the last time
> round the loop, then at the end of the loop we fprintf again.
> We also duplicate the loop termination condition.

I cleaned it up some back in February, but my admittedly incremental
improvement was rejected because it didn't also convert to error_set().
*shrug*

http://lists.nongnu.org/archive/html/qemu-devel/2012-02/msg00772.html

[...]

