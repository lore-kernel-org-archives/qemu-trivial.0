Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS4x5-00061d-Al
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 09:30:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WS4wN-0003fh-1V
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 09:30:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WS4pf-0001Qj-Kt
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 09:23:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WS4mf-0000jY-TL; Mon, 24 Mar 2014 09:19:22 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ODIm63004349
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Mar 2014 09:18:48 -0400
Received: from localhost (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2ODIkbk012441; Mon, 24 Mar 2014 09:18:46 -0400
Date: Mon, 24 Mar 2014 14:18:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
Message-ID: <20140324131845.GE4384@stefanha-thinkpad.redhat.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-6-git-send-email-prasadjoshi.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395566923-5074-6-git-send-email-prasadjoshi.linux@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, alex@alex.org.uk, v.maffione@gmail.com,
	aik@ozlabs.ru, jan.kiszka@siemens.com, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, rizzo@iet.unipi.it,
	afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH 6/6] net: netmap_poll must update both
 read/write poll state
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
X-List-Received-Date: Mon, 24 Mar 2014 13:30:05 -0000

On Sun, Mar 23, 2014 at 02:58:43PM +0530, Prasad Joshi wrote:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  net/netmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

