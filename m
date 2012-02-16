Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5GK-000580-7x
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 12:36:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5GD-00057h-Ae
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:36:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5G9-0002wp-NZ
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:36:49 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:37659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>)
	id 1Ry5Fv-0002tV-J9; Thu, 16 Feb 2012 12:36:31 -0500
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Ry5Ft-00077U-AR from Alexander_Barabash@mentor.com ;
	Thu, 16 Feb 2012 09:36:29 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 16 Feb 2012 09:35:46 -0800
Received: from [137.202.52.68] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Thu, 16 Feb 2012 17:36:27 +0000
Message-ID: <4F3D3EB1.6090003@mentor.com>
Date: Thu, 16 Feb 2012 19:36:49 +0200
From: Alexander Barabash <alexander_barabash@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 16 Feb 2012 17:35:46.0171 (UTC)
	FILETIME=[6A3E9CB0:01CCECD1]
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 192.94.38.131
Subject: [Qemu-trivial] [PATCH] [TRIVIAL] Removed unused pl080_init().
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
X-List-Received-Date: Thu, 16 Feb 2012 17:36:55 -0000


     Removed unused pl080_init().

     Signed-off-by: Alexander Barabash <alexander_barabash@mentor.com>

diff --git a/hw/primecell.h b/hw/primecell.h
index de7d6f2..ded0446 100644
--- a/hw/primecell.h
+++ b/hw/primecell.h
@@ -5,9 +5,6 @@
  /* Also includes some devices that are currently only used by the
     ARM boards.  */

-/* pl080.c */
-void *pl080_init(uint32_t base, qemu_irq irq, int nchannels);
-
  /* arm_sysctl.c */
  void arm_sysctl_init(uint32_t base, uint32_t sys_id, uint32_t proc_id);



