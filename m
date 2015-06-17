Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z59A5-0004Qo-2k
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 04:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z59A2-0004Lo-6G
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 04:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z59A1-0000qz-CD
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 04:57:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Z599s-0000oH-Do; Wed, 17 Jun 2015 04:57:20 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D822C37020E;
	Wed, 17 Jun 2015 08:57:19 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5H8vFXT029708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Jun 2015 04:57:17 -0400
Message-ID: <5581366B.3010302@redhat.com>
Date: Wed, 17 Jun 2015 10:57:15 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>
References: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>	<557572D5.3050103@redhat.com>
	<CAEgOgz6md-U4nAZM1MEqAqMnt6wk4APhGuU5tptXijq0umZQ+Q@mail.gmail.com>
In-Reply-To: <CAEgOgz6md-U4nAZM1MEqAqMnt6wk4APhGuU5tptXijq0umZQ+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] memory_mapping: Rework
	cpu related includes
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
X-List-Received-Date: Wed, 17 Jun 2015 08:57:31 -0000



On 09/06/2015 09:42, Peter Crosthwaite wrote:
> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > About to leave on vacation, so someone else will have to pick it up.
>
> Enjoy. If you are not back before soft freeze would you object to me
> sending a [PULL] for some of the multi-arch related mainloop header
> patches for which I have RB from Richard from?

I don't object to you sending a pull request for any multi-arch related
changes.  Anything that makes fewer patches go through my "misc" pull
requests is a good thing for me.

Just consult with Andreas when he's back about what he prefers to go
through his tree.

Paolo

