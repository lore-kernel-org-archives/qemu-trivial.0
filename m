Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U5i0r-0007AX-4q
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2013 14:29:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U5i0k-0006pW-05
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2013 14:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U5i0g-0005ce-Tu
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2013 14:28:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U5i0a-0005Zg-Q5; Wed, 13 Feb 2013 14:28:44 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1DJSg37008733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 13 Feb 2013 14:28:43 -0500
Received: from localhost (ovpn-113-97.phx2.redhat.com [10.3.113.97])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1DJSfTi028104; Wed, 13 Feb 2013 14:28:41 -0500
Date: Wed, 13 Feb 2013 17:28:40 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130213172840.607e6640@redhat.com>
In-Reply-To: <87vca260zh.fsf@blackfin.pond.sub.org>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-2-git-send-email-armbru@redhat.com>
	<20130208154154.7bf7ab79@redhat.com>
	<87wquid48e.fsf@blackfin.pond.sub.org>
	<20130208171315.2fc46fb4@redhat.com>
	<87vca260zh.fsf@blackfin.pond.sub.org>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 1/6] error: Clean up error
 strings with embedded newlines
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
X-List-Received-Date: Wed, 13 Feb 2013 19:28:59 -0000

On Fri, 08 Feb 2013 20:48:18 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> It's a cleanup.  It's only user-visible effect is getting rid of an
> extra newline on stderr.  I'm fixing those globally.  Tiny improvement
> in user experience, but next to no risk, thus proposed for 1.4.  Since I
> need to touch this call anyway for that, I can just as well clean up the
> API abuse.  The alternative is to leave the abuse alone and just strip
> the final newline.  That would make me sad.
> 
> If you hate the API, fix it.  Don't make me not fix abuses of it :)

I honestly would prefer to defer this and fix the API once and for all.
But it's not worth to discuss this anymore, as this patch has already
been merged.

