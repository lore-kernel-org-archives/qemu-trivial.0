Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YpZRj-0006JW-Vx
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2015 05:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YpZRh-0006FB-FE
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 05:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YpZRg-00041I-Hq
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 05:47:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YpZRZ-0003yy-4l; Tue, 05 May 2015 05:47:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id BA9FEA0B75;
	Tue,  5 May 2015 09:47:12 +0000 (UTC)
Received: from [10.36.116.78] (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t459l9aX025603; Tue, 5 May 2015 05:47:10 -0400
Message-ID: <1430819227.28106.2.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Date: Tue, 05 May 2015 11:47:07 +0200
In-Reply-To: <1430477086-26830-1-git-send-email-berrange@redhat.com>
References: <1430477086-26830-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ui: remove check for failure of
	qemu_acl_init()
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
X-List-Received-Date: Tue, 05 May 2015 09:47:22 -0000

On Fr, 2015-05-01 at 11:44 +0100, Daniel P. Berrange wrote:
> The qemu_acl_init() function has long since stopped being able
> to return NULL, since g_malloc will abort on OOM. As such the
> checks for NULL were unreachable code.

added to vnc queue.

thanks,
  Gerd



