Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvaJn-0004jI-Uw
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 16:14:43 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvaJj-0004Vi-VO
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 16:14:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvaJi-0004ho-Sa
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 16:14:39 -0500
Received: from e33.co.us.ibm.com ([32.97.110.151]:46010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvaJi-0004hg-ND
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 16:14:38 -0500
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Wed, 16 Jan 2013 14:14:38 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 16 Jan 2013 14:14:35 -0700
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 7A0623E40039;
	Wed, 16 Jan 2013 14:14:28 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r0GLENvm291014; Wed, 16 Jan 2013 14:14:23 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r0GLE0T7021564; Wed, 16 Jan 2013 14:14:00 -0700
Received: from localhost6.localdomain6 (sig-9-76-20-104.mts.ibm.com
	[9.76.20.104])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r0GLDwGa021404; Wed, 16 Jan 2013 14:13:59 -0700
Message-Id: <201301162113.r0GLDwGa021404@d03av01.boulder.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
In-Reply-To: <1358356653-16309-1-git-send-email-sw@weilnetz.de>
Date: Wed, 16 Jan 2013 21:13:57 -0000
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13011621-2398-0000-0000-000010225CA4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.151
Cc: Stefan Weil <sw@weilnetz.de>, malc <av1474@comtv.ru>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] audio: Replace non-portable asprintf in
 debug code by g_strdup_printf
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
X-List-Received-Date: Wed, 16 Jan 2013 21:14:42 -0000

Applied.  Thanks.

Regards,

Anthony Liguori


