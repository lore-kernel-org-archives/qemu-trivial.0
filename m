Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfniY-0000nv-Kj
	for mharc-qemu-trivial@gnu.org; Mon, 11 Nov 2013 04:23:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VfniQ-0000eZ-Gx
	for qemu-trivial@nongnu.org; Mon, 11 Nov 2013 04:23:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VfniK-0000x7-Hr
	for qemu-trivial@nongnu.org; Mon, 11 Nov 2013 04:23:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Vfni5-0000tb-AG; Mon, 11 Nov 2013 04:23:05 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAB9N2R3026753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 11 Nov 2013 04:23:03 -0500
Received: from [10.36.7.13] (vpn1-7-13.ams2.redhat.com [10.36.7.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rAB9N01c025639; Mon, 11 Nov 2013 04:23:01 -0500
Message-ID: <1384161779.32143.14.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Date: Mon, 11 Nov 2013 10:22:59 +0100
In-Reply-To: <1384095499-12255-1-git-send-email-sw@weilnetz.de>
References: <1384095499-12255-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] console: Remove unused
	debug code
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
X-List-Received-Date: Mon, 11 Nov 2013 09:23:32 -0000

On So, 2013-11-10 at 15:58 +0100, Stefan Weil wrote:
> The local function console_print_text_attributes is no longer used
> since
> commit 7d6ba01c3741bc32ae252bf64a5fd3f930c2df4f.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd



