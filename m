Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rd0iq-0004DM-LQ
	for mharc-qemu-trivial@gnu.org; Tue, 20 Dec 2011 09:31:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Rd0ij-0003ob-R0
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 09:31:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Rd0ie-0000eA-7x
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 09:31:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:30418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Rd0iR-0000br-4w; Tue, 20 Dec 2011 09:30:51 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBKEUniM026994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 20 Dec 2011 09:30:49 -0500
Received: from rincewind.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBKEUlIs021009; Tue, 20 Dec 2011 09:30:48 -0500
Message-ID: <4EF09C16.8010100@redhat.com>
Date: Tue, 20 Dec 2011 15:30:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111104 Red Hat/3.1.16-2.el6_1
	Thunderbird/3.1.16
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1324379118-2570-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1324379118-2570-1-git-send-email-alevy@redhat.com>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-options.hx: fix tls-channel help
	text
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
X-List-Received-Date: Tue, 20 Dec 2011 14:31:15 -0000

On 12/20/11 12:05, Alon Levy wrote:
> Remove the default compiled out tunnel channel, add the always available
> cursor channel. Optimally the man page would depend on compiled in
> options, but that's harder to do.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd


