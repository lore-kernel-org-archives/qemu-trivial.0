Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WophD-0004e3-Hk
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:51:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Woph5-0004Uk-2X
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Wopgy-0007qz-UV
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:51:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Wopge-0007m6-UM; Mon, 26 May 2014 03:51:13 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4Q7p6Ak019744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 26 May 2014 03:51:07 -0400
Received: from [10.36.116.16] (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4Q7p4Mf025873; Mon, 26 May 2014 03:51:04 -0400
Message-ID: <1401090662.13567.0.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 26 May 2014 09:51:02 +0200
In-Reply-To: <538043ED.20200@msgid.tls.msk.ru>
References: <1400890569-30822-1-git-send-email-andrew@aoates.org>
	<538043ED.20200@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Andrew Oates <andrew@aoates.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] input (curses): mask
 keycodes to remove modifier bits
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
X-List-Received-Date: Mon, 26 May 2014 07:51:45 -0000

On Sa, 2014-05-24 at 11:02 +0400, Michael Tokarev wrote:
> 24.05.2014 04:16, Andrew Oates wrote:
> > Without the mask, control bits are passed on in the keycode, generating
> > incorrect PS/2 sequences when SHIFT, ALT, etc are held down.
> 
> While the patch itself appears to be trivial, it may have
> non-trivial effect.  Cc'ing Gerd for comments.

Patch is correct, picked it up.

cheers,
  Gerd


