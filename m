Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0DQE-0002Yk-F0
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2013 10:48:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U0DQC-0002Sd-9Y
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 10:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U0DQ3-0003rx-Pf
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 10:48:28 -0500
Received: from e8.ny.us.ibm.com ([32.97.182.138]:46426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U0DQ3-0003rp-Ie
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 10:48:19 -0500
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Tue, 29 Jan 2013 10:47:17 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
	by e8.ny.us.ibm.com (192.168.1.108) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 29 Jan 2013 10:47:13 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 9F3F538C804A;
	Tue, 29 Jan 2013 10:47:10 -0500 (EST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r0TFl62F278460; Tue, 29 Jan 2013 10:47:06 -0500
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r0TFkoAc005733; Tue, 29 Jan 2013 08:46:50 -0700
Received: from localhost6.localdomain6 (dyn9050022135.mts.ibm.com
	[9.50.22.135] (may be forged))
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r0TFki9B004458; Tue, 29 Jan 2013 08:46:44 -0700
Message-Id: <201301291546.r0TFki9B004458@d03av01.boulder.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
Date: Tue, 29 Jan 2013 15:46:37 -0000
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13012915-9360-0000-0000-00000FDAE751
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.138
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qmp-commands.hx: s/tray-open/tray_open/
 to match qapi schema
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
X-List-Received-Date: Tue, 29 Jan 2013 15:48:29 -0000

Hi,

Thank you for submitting your patch series.  checkpatch.pl has
detected that one or more of the patches in this series violate
the QEMU coding style.

If you believe this message was sent in error, please ignore it
or respond here with an explanation.

Otherwise, please correct the coding style issues and resubmit a
new version of the patch.

For more information about QEMU coding style, see:

http://git.qemu.org/?p=qemu.git;a=blob_plain;f=CODING_STYLE;hb=HEAD

Here is the output from checkpatch.pl:

Subject: qmp-commands.hx: s/tray-open/tray_open/ to match qapi schema
ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 8 lines checked

Your patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.



Regards,

Anthony Liguori


