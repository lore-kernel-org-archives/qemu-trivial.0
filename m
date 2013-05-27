Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgtUy-0004q8-DH
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 05:13:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1UgtUs-0004pN-TD
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 05:13:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1UgtUj-00022D-Rw
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 05:13:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1UgtUj-00021X-Kr; Mon, 27 May 2013 05:13:33 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4R9DUB1022127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 27 May 2013 05:13:30 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-27.ams2.redhat.com
	[10.36.116.27])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4R9DRMD013312; Mon, 27 May 2013 05:13:28 -0400
Message-ID: <51A323B4.2000101@redhat.com>
Date: Mon, 27 May 2013 11:13:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 0/4] debugcon: fix some bugs when
	DEBUG_DEBUGCON
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
X-List-Received-Date: Mon, 27 May 2013 09:13:46 -0000

On 05/24/13 04:47, liguang wrote:
> when enable DEBUG_DEBUGCON, there are some message
> printing bugs, so fix them.

I'd suggest to either simply remove the debug printfs or turn them into
tracepoints.

cheers,
  Gerd



