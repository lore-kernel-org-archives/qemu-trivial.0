Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEcDk-0008CU-Sr
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 07:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZEcDj-00089C-0O
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 07:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZEcDi-0007ho-64
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 07:48:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1ZEcDd-0007gc-6f; Mon, 13 Jul 2015 07:48:21 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id C471A371B55;
	Mon, 13 Jul 2015 11:48:20 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6DBmIbk027524; Mon, 13 Jul 2015 07:48:19 -0400
Message-ID: <1436788098.26533.22.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2015 13:48:18 +0200
In-Reply-To: <CAFEAcA9gbPB8PTimK7J=wAC8gtQtgFxLhEkGOESD1r52f9-m6w@mail.gmail.com>
References: <1436772617-2490-1-git-send-email-kraxel@redhat.com>
	<CAFEAcA9gbPB8PTimK7J=wAC8gtQtgFxLhEkGOESD1r52f9-m6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-input: enable on
	non-linux hosts
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
X-List-Received-Date: Mon, 13 Jul 2015 11:48:27 -0000

On Mo, 2015-07-13 at 09:56 +0100, Peter Maydell wrote:
> On 13 July 2015 at 08:30, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > As we include a copy of the linux input layer header file in the qemu
> > source tree (include/standard-headers/linux/input.h) the virtio-input
> > bits (except pass-through) should build and work just fine on non-linux
> > hosts too.  Tweak Makefile accordingly.
> 
> Does "should" here mean "I haven't actually tested it" ? :-)

Did a build test on freebsd -- passed.

cheers,
  Gerd



