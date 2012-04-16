Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJiXY-00088M-3N
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 05:48:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1SJiXR-0007ny-3f
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1SJiXL-0003j1-50
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:48:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1SJiX8-0003eP-PM; Mon, 16 Apr 2012 05:47:42 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3G9ldPQ024380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 16 Apr 2012 05:47:39 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q3G9lc5V001398; Mon, 16 Apr 2012 05:47:38 -0400
Message-ID: <4F8BEAB9.4020508@redhat.com>
Date: Mon, 16 Apr 2012 11:47:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120307 Thunderbird/10.0.3
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1333310850-28767-1-git-send-email-sw@weilnetz.de>
	<20120402130504.GD11583@stefanha-thinkpad.localdomain>
In-Reply-To: <20120402130504.GD11583@stefanha-thinkpad.localdomain>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qxl: Add missing GCC_FMT_ATTR and fix
 format specifier
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
X-List-Received-Date: Mon, 16 Apr 2012 09:48:07 -0000

On 04/02/12 15:05, Stefan Hajnoczi wrote:
> On Sun, Apr 01, 2012 at 10:07:30PM +0200, Stefan Weil wrote:
>> > val is an uint64_t, therefore %d was not correct.
>> > 
>> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> Waiting for Gerd's Ack.
> 

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

