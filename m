Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z80zA-00005D-Rn
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jun 2015 02:50:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z80z8-0008Ss-AL
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 02:50:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z80z7-0005ZR-HA
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 02:50:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Z80z3-0005RP-6r; Thu, 25 Jun 2015 02:50:01 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 35FE7365066;
	Thu, 25 Jun 2015 06:50:00 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-16.ams2.redhat.com
	[10.36.116.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5P6nvR4030170; Thu, 25 Jun 2015 02:49:58 -0400
Message-ID: <1435214997.18484.6.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: arei.gonglei@huawei.com
Date: Thu, 25 Jun 2015 08:49:57 +0200
In-Reply-To: <1435137497-11972-1-git-send-email-arei.gonglei@huawei.com>
References: <1435137497-11972-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] ossaudio: fix memory leak
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
X-List-Received-Date: Thu, 25 Jun 2015 06:50:07 -0000

On Mi, 2015-06-24 at 17:18 +0800, arei.gonglei@huawei.com wrote:
> Variable "conf" going out of scope leaks the storage
> it points to in line 856.
> 
Added to audio queue.

thanks,
  Gerd



