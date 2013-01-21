Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxJPY-0008D2-Q4
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jan 2013 10:35:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1TxJPU-00081u-Kb
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 10:35:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1TxJPT-0007Vf-Hh
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 10:35:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1TxIDL-0003ea-5c; Mon, 21 Jan 2013 09:19:07 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0LEJ4Kg010553
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 21 Jan 2013 09:19:04 -0500
Received: from rincewind.home.kraxel.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0LEJ10p002368; Mon, 21 Jan 2013 09:19:02 -0500
Message-ID: <50FD4E55.1080709@redhat.com>
Date: Mon, 21 Jan 2013 15:19:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.12) Gecko/20130108 Thunderbird/10.0.12
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1358769827-7317-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1358769827-7317-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu-pixman.h: Avoid
 mutual inclusion loop with console.h
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
X-List-Received-Date: Mon, 21 Jan 2013 15:35:46 -0000

> Stefan: I've made the obvious change to fix the spice compile issue,
> but none of my systems have a new enough spice-protocol/spice-server
> to allow me to configure with spice enabled. I'd appreciate it if
> you could check it does indeed compile OK now...

I'll run this through the buildbot ...

cheers,
  Gerd


