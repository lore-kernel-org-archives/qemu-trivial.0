Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z9tYZ-0004uO-3n
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2015 07:18:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z9tYW-0004s6-OL
	for qemu-trivial@nongnu.org; Tue, 30 Jun 2015 07:18:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z9tYW-0001GT-22
	for qemu-trivial@nongnu.org; Tue, 30 Jun 2015 07:18:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Z9tYR-0001Dp-Qs; Tue, 30 Jun 2015 07:18:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 821D12C76EA;
	Tue, 30 Jun 2015 11:18:18 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5UBIGG4015021; Tue, 30 Jun 2015 07:18:17 -0400
Message-ID: <1435663095.30958.54.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jun 2015 13:18:15 +0200
In-Reply-To: <CAFEAcA8iq5Q84NH59zjS67O93Vq7a1u=9iyoVXB-GeuxA4BVag@mail.gmail.com>
References: <1435655374-20741-1-git-send-email-kraxel@redhat.com>
	<CAFEAcA8iq5Q84NH59zjS67O93Vq7a1u=9iyoVXB-GeuxA4BVag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] move QemuOpts from
 qemu/option.h to qemu/typedefs.h
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
X-List-Received-Date: Tue, 30 Jun 2015 11:18:25 -0000

On Di, 2015-06-30 at 10:15 +0100, Peter Maydell wrote:
> On 30 June 2015 at 10:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  include/qemu/option.h   | 2 +-
> >  include/qemu/typedefs.h | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> I don't object necessarily, but it would be nice if the
> commit message said what the rationale for the change was...

Build failure, with not-yet submitted patches,
due to QemuOpts being undeclared.

cheers,
  Gerd



