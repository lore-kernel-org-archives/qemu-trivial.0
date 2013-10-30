Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VbQmf-0005wC-Ey
	for mharc-qemu-trivial@gnu.org; Wed, 30 Oct 2013 04:05:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VbQmX-0005oZ-KL
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 04:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1VbQmR-00048n-KV
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 04:05:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1VbQmB-00046I-SJ; Wed, 30 Oct 2013 04:05:16 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9U85E6M013928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 30 Oct 2013 04:05:14 -0400
Received: from [10.36.4.1] (vpn1-4-1.ams2.redhat.com [10.36.4.1])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9U85Bdv003217; Wed, 30 Oct 2013 04:05:12 -0400
Message-ID: <1383120311.22559.0.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Wed, 30 Oct 2013 09:05:11 +0100
In-Reply-To: <1383057871-3897-1-git-send-email-stefanha@redhat.com>
References: <1383057871-3897-1-git-send-email-stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] usb: drop unused USBNetState.inpkt
	field
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
X-List-Received-Date: Wed, 30 Oct 2013 08:05:43 -0000

On Di, 2013-10-29 at 15:44 +0100, Stefan Hajnoczi wrote:
> -    USBPacket *inpkt;

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd



