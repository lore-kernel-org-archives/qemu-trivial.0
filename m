Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzl0V-0008Sg-5I
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2016 09:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bzl0T-0008Rj-Uq
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 09:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bzl0P-000689-4Q
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 09:46:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1bzl0D-000626-JK; Thu, 27 Oct 2016 09:45:53 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AACD8F236;
	Thu, 27 Oct 2016 13:45:52 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-67.ams2.redhat.com
	[10.36.116.67])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9RDjpSZ025099; Thu, 27 Oct 2016 09:45:52 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 2094C80E4F; Thu, 27 Oct 2016 15:45:51 +0200 (CEST)
Message-ID: <1477575951.9075.14.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 27 Oct 2016 15:45:51 +0200
In-Reply-To: <1477570647-7100-1-git-send-email-thuth@redhat.com>
References: <1477570647-7100-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 27 Oct 2016 13:45:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] ui/gtk: Fix non-working DELETE key
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2016 13:46:10 -0000

On Do, 2016-10-27 at 14:17 +0200, Thomas Huth wrote:
> GTK generates key events for the delete key with key->string[0] =3D 0x7f
> ... but this does not work right with the readline_handle_byte()
> function in util/readline.c, since this treats the keycode 127 as
> backspace. So let's add a special case for the GTK delete key to make
> this key behave right in the monitor interface of the GTK ui.

added to ui queue.

thanks,
  Gerd


