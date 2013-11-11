Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfnjY-00022D-Le
	for mharc-qemu-trivial@gnu.org; Mon, 11 Nov 2013 04:24:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VfnjR-0001rB-Ki
	for qemu-trivial@nongnu.org; Mon, 11 Nov 2013 04:24:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VfnjL-0001D1-MZ
	for qemu-trivial@nongnu.org; Mon, 11 Nov 2013 04:24:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43447)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Vfnj9-000159-9f; Mon, 11 Nov 2013 04:24:11 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAB9O9Tt015906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 11 Nov 2013 04:24:09 -0500
Received: from [10.36.7.13] (vpn1-7-13.ams2.redhat.com [10.36.7.13])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rAB9O6ST019547; Mon, 11 Nov 2013 04:24:07 -0500
Message-ID: <1384161846.32143.15.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Date: Mon, 11 Nov 2013 10:24:06 +0100
In-Reply-To: <1384095856-15284-1-git-send-email-sw@weilnetz.de>
References: <1384095856-15284-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] console: Replace
 conditional debug messages by trace methods
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
X-List-Received-Date: Mon, 11 Nov 2013 09:24:35 -0000

On So, 2013-11-10 at 16:04 +0100, Stefan Weil wrote:
> +console_putchar_csi(int esc_param0, int esc_param1, int ch, int
> nb_esc_params) "escape sequence CSI%d;%d%c, %d parameters"
> +console_putchar_unhandled(int ch) "unhandled escape character '%c'"

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd



